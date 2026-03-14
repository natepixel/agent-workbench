# Skill: Local API Debugging

## Purpose
Quickly inspect a local API without needing to remember the exact curl flow each time.

## When to use it
- debugging route behavior
- checking auth/session flow locally
- verifying a JSON response
- testing a health endpoint

## Example workflow
1. start the repo with:
   ```bash
   ./scripts/dev.sh
   ```
2. inspect current repo status:
   ```bash
   ./scripts/status.sh
   ```
3. query the app:
   ```bash
   curl -i http://127.0.0.1:8000/health
   ```

## Notes
- adjust ports based on your repo
- prefer local-only endpoints for testing
- do not paste secret-bearing responses into external AI tools without sanitizing
