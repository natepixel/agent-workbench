# 0001 - Template Philosophy

## Context
Many projects function as both real codebases and AI-augmented working environments.

## Decision
Adopt a repo template that explicitly supports:
- AI orientation via `AGENTS.md`
- durable project truth via top-level docs
- temporary scratch work in `working/`
- committed operational knowledge in `skills/`
- one-command local startup via `./scripts/dev.sh`

## Consequences
Benefits:
- less repeated setup across repos
- less clutter in production paths
- clearer handoff between humans and AIs
- better continuity across branches and worktrees

Tradeoffs:
- slightly more upfront structure
- requires discipline about promoting temporary work into durable locations
