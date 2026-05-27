# Skill: Cross-repo coordination via Cheshire

## Purpose

Use the Cheshire daemon (`localhost:7777`) as a broker to coordinate with other repos without creating any dependency between them. From inside one repo you can:

- leave a todo / question / note for another repo's *future* agent session,
- read another repo's files or skills,
- see what other repos have left for *this* one.

Cheshire knows every git repo under `~/Development/`. Messages persist on disk and sync across machines; delivery is fire-and-forget — the recipient sees them on their next session. There is no polling and no live connection between repos.

## When to use it

- You're working in repo A and realize repo B needs to do something later ("the media server needs the new DNS reservation").
- You need to know how another repo does something and want to read its docs/skills without leaving your current repo.
- You're starting a session and want to surface anything left for this repo (see the on-arrival step below).

## When NOT to use it

- Don't reach across repos to avoid work that belongs in the current one. The bridge is for *coordination*, not avoidance.
- If the info is already in this repo, read it locally first.
- If the user wants you to actually *fix* something in another repo, switch directories (or use the live-agent pattern at the bottom) rather than leaving a vague todo.

## On session start (the on-arrival convention)

Before other work, surface anything pending for this repo:

```bash
cheshire inbox
```

- If it prints `no unread messages in <repo>.`, continue silently.
- If there are messages, summarize them and ask the user whether to handle them now, defer, or just mark them read.

If `cheshire inbox` errors with "not reachable," the daemon isn't running — mention it; don't improvise.

## Identify the current repo

Some commands need this repo's registry name (resolved from the working directory):

```bash
cheshire whoami            # prints "Group/Name"
cheshire whoami --json     # full {name, group, id, ref, path}
```

If `cheshire whoami` says "not inside any tracked repo," the cwd isn't registered with Cheshire — surface that rather than guessing.

## Send a message to another repo

```bash
cheshire inbox post <target-repo> "<body>" --kind=todo
cheshire inbox post <target-repo> "<body>" --kind=question --ref=path/to/file.go:42
cheshire inbox post <target-repo> "<body>" --kind=answer --reply-to=<original-id>
```

Kinds: `todo` (do this), `question` (need an answer), `note` (FYI), `answer` (reply). Use `todo` if unsure. The `--ref=path:line` flag anchors the message to a code location in the *current* repo — useful for cross-repo bug reports.

Example:

```bash
cheshire inbox post NateMediaServer "Plex DNS needs the IPv6 reservation we discussed" \
  --kind=todo --ref=data/dhcp.json:42
```

## Read another repo's file or skill

```bash
curl -s "localhost:7777/api/repos/<repo>/files/<path>"      # raw file (read-only, path-safe, 1 MiB cap)
curl -s "localhost:7777/api/repos/<repo>/skills"            # list that repo's skills
curl -s "localhost:7777/api/repos/<repo>/skills/<name>"     # one skill's raw markdown
```

If a target repo has a skill directly relevant to the question, fetch and apply it yourself — don't ask the user to switch repos.

## Expected outputs

- `cheshire inbox` → a table of unread messages, or `no unread messages in <repo>.`
- `cheshire inbox post …` → `posted to <repo> — id <uuid>`
- `cheshire whoami` → `Group/Name`
- File/skill reads → raw content on stdout; HTTP 404 for unknown repo/file, 400 for a path that escapes the repo root.

The human can also view and compose messages from the dashboard at <http://localhost:7777> (Inbox tab + per-row badges on the Repos tab) — no agent session required.

## Live cross-repo agent (advanced, rare)

If you genuinely need the *other* repo's agent to reason — not just read its files — run a one-shot Claude in its directory:

```bash
cd /path/to/<other-repo> && claude -p "<your prompt>"
```

This blocks until the sub-agent returns (a normal subprocess wait, not polling). Use sparingly; reading a file via the HTTP API covers ~90% of cases.

## Caveats

- Requires the `cheshired` daemon running locally (it normally runs under launchd).
- Messages are delivered on the recipient's *next* session, not in real time — multi-day latency is by design.
- `{repo}` accepts a bare name (`NetworkSetup`) or `Group/Name` (`Projects/NetworkSetup`) when the bare name is ambiguous.
