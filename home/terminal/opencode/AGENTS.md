## System Context
- **OS**: NixOS
- **Shell**: Fish

## Mandatory Operations
- Use absolute paths. Avoid 'cd'.
- No interactive shell commands.
- Use echo instead heredoc and use ' instead "

## Style & Communication
- For responses: Provide max 2 sentences or 50 words unless more explicitly requested.
- No emojis.
- No marketing or "tutorial" fluff.
- No jokes.
- If context is missing, ask ONE question and stop.
- Only add comments to code if the logic is non-obvious.
- Don't adding/edit style if i didint ask

## Strict Logging Format
All output must use: `[LEVEL] message`
Levels: INFO, WARN, ERROR, DEBUG (Uppercase only).
Example: [INFO] Initializing module


## Core Principles

1. **Agent-First** — Delegate to specialized agents for domain tasks
2. **Test-Driven** — Write tests before implementation, 80%+ coverage required
3. **Security-First** — Never compromise on security; validate all inputs
4. **Immutability** — Always create new objects, never mutate existing ones
5. **Plan Before Execute** — Plan complex features before writing code

## Available Agents

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| scout | Fast codebase reconnaissance | Understanding project structure, finding files, gathering context |
| planner | Implementation planning + system design | Complex features, refactoring, architectural decisions |
| reviewer | Code quality and maintainability | After writing/modifying code |
| worker | General purpose task execution | Running commands, executing tasks, general development work |

## Agent Orchestration

Use agents proactively without user prompt:
- Quick context gathering → **scout**
- Complex feature requests → **planner**
- Code just written/modified → **reviewer**
- Execute tasks, run commands → **worker**

Use parallel execution for independent operations — launch multiple agents simultaneously.

## Coding Style

**Immutability (CRITICAL):** Always create new objects, never mutate. Return new copies with changes applied.

**File organization:** Many small files over few large ones. 200-400 lines typical, 800 max. Organize by feature/domain, not by type. High cohesion, low coupling.

**Error handling:** Handle errors at every level. Provide user-friendly messages in UI code. Log detailed context server-side. Never silently swallow errors.

**Input validation:** Validate all user input at system boundaries. Use schema-based validation. Fail fast with clear messages. Never trust external data.

**Code quality checklist:**
- Functions small (<50 lines), files focused (<800 lines)
- No deep nesting (>4 levels)
- Proper error handling, no hardcoded values
- Readable, well-named identifiers

## Architecture Patterns

**API response format:** Consistent envelope with success indicator, data payload, error message, and pagination metadata.

**Repository pattern:** Encapsulate data access behind standard interface (findAll, findById, create, update, delete). Business logic depends on abstract interface, not storage mechanism.

## Performance

**Context management:** Avoid last 20% of context window for large refactoring and multi-file features. Lower-sensitivity tasks (single edits, docs, simple fixes) tolerate higher utilization.
