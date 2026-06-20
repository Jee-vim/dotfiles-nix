## System Context
- **OS**: NixOS
- **Shell**: Fish

## Mandatory Operations
- No interactive shell commands.
- Use echo instead heredoc and use ' instead "
- Create shell.nix if making a script in python or bash that need some 3dParty library instead use pip directly

## When using the Lightpanda MCP server:
- Always use the `markdown` tool for webpage retrieval.
- Never use `html` unless raw DOM inspection is explicitly requested.
- Prefer `markdown(url)` over `goto(url)` followed by extraction.

## Style & Communication
- For responses: Provide max 2 sentences or 50 words unless more explicitly requested.
- No emojis.
- No marketing or "tutorial" fluff.
- No jokes.
- If context is missing, ask ONE question and stop.
- Only add comments to code if the logic is non-obvious.
- Don't adding/edit style if i didint ask
- Every agent must always use the caveman skill on every single conversation. using the caveman skill /skill:caveman

## Strict Logging Format
All output/log must use: `[LEVEL] message`
Levels: INFO, WARN, ERROR, DEBUG (Uppercase only).
Example: [INFO] Initializing module

## Core Principles

1. **Agent-First** — Delegate to specialized agents for domain tasks
2. **Security-First** — Never compromise on security; validate all inputs
3. **Immutability** — Always create new objects, never mutate existing ones
4. **Plan Before Execute** — Plan complex features before writing code

## Available Agents

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| scout | Fast codebase reconnaissance | Understanding project structure, finding files, gathering context |
| planner | Implementation planning + system design | Complex features, refactoring, architectural decisions |
| reviewer | Code quality and maintainability | After writing/modifying code |
| worker | General purpose task execution | Running commands, executing tasks, general development work |


## Agent Orchestration & State Transfer

- **Handoff Chain**: `scout` (gather state) → `planner` (write spec to `/tmp/plan.md`) → `worker` (execute plan) → `reviewer` (verify output).
- **Parallel Limits**: Run parallel agents only on independent domains; never allow simultaneous writes to the same file.
- **State Preservation**: Append structural context into absolute path temporary files rather than passing large text histories.

## Coding Style

**File organization:** Many small files over few large ones. 200-400 lines typical, 800 max. Organize by feature/domain, not by type. High cohesion, low coupling.
**Error handling:** Handle errors at every level. Provide user-friendly messages in UI code. Log detailed context server-side. Never silently swallow errors.
**Input validation:** Validate all user input at system boundaries. Use schema-based validation. Fail fast with clear messages. Never trust external data.
**Code quality checklist:**
- Functions small (<50 lines), files focused (<800 lines)
- No deep nesting (>4 levels)
- Proper error handling, no hardcoded values
- Readable, well-named identifiers

## UI & Layout Consistency

**Viewport Safety:** Always use `svh` (Small Viewport Height) instead of `dvh` for mobile layout heights to prevent layout shifts from address bar resizing.
**Component Lifecycle:** Enforce local, immutable state definitions within structural units; handle reactive bindings natively without third-party mutations.
**Token Enforcement:** Utilize pre-defined CSS design variables exclusively; do not declare inline aesthetic mutations or invent arbitrary style tokens.
**Style Reconnaissance:** Before adding new classes, search global styles at `global.css` or `index.css` to check for pre-existing utility definitions.

## Architecture Patterns

**API response format:** Consistent envelope with success indicator, data payload, error message, and pagination metadata.
**Repository pattern:** Encapsulate data access behind standard interface (findAll, findById, create, update, delete). Business logic depends on abstract interface, not storage mechanism.

## Performance

**Context management:** Avoid last 20% of context window for large refactoring and multi-file features. Lower-sensitivity tasks (single edits, docs, simple fixes) tolerate higher utilization.
**Token Reduction:** Clean text inputs before processing; strip all lockfiles, build logs, and binary outputs from the active agent context.
**Caching Strategy:** Cache absolute path listings and tool search outputs at `/tmp/scout_cache` for 5 minutes instead of re-scanning the disk.
