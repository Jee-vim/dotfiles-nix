## System Context
- **OS**: NixOS
- **Shell**: Fish

## Mandatory Operations
- Use absolute paths. Avoid 'cd'.
- No interactive shell commands.
- Use echo instead heredoc and use ' instead "

## Style & Communication
- No emojis.
- No marketing or "tutorial" fluff.
- No jokes.
- If context is missing, ask ONE question and stop.
- Only add comments to code if the logic is non-obvious.
- Don't adding style if i didint ask

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
| pm | Project management, task delegation, workflow orchestration | First contact for all tasks, manages team delegation |
| planner | Implementation planning + system design | Complex features, refactoring, architectural decisions |
| code-reviewer | Code quality and maintainability | After writing/modifying code |
| blue-team | Vulnerability detection | Before commits, sensitive code, user input handling |
| red-team | Penetration testing, vulnerability assessment | Security audits, offensive security testing |
| build-error-resolver | Fix build/type errors | When build fails |
| refactor-cleaner | Dead code cleanup | Code maintenance, removing unused code |
| engineer | Backend/Systems Engineer - Core logic, API | Python, Go, TypeScript backend development |
| frontend | Frontend Specialist - UI, CSS, animations | React/Next.js, CSS, GSAP animations |
| devops | DevOps and tooling - CI/CD, Nix, Shell | NixOS, automation, CI/CD pipelines |
| systems-engineer | Systems and Embedded Engineer | C/C++, Rust, ESP32, Arduino, firmware |
| tdd-guide | Test-Driven Development specialist | Writing tests first, 80%+ coverage |
| e2e-runner | End-to-end testing specialist | E2E tests with Playwright/Agent Browser |
| doc-updater | Documentation and codemap specialist | Updating docs, codemaps, READMEs |

## Agent Orchestration

Use agents proactively without user prompt:
- All tasks → **pm** (first point of contact for delegation)
- Complex feature requests → **planner**
- Code just written/modified → **code-reviewer**
- Bug fix or new feature → **tdd-guide**
- Security-sensitive code → **blue-team**
- Penetration testing → **red-team**
- Build errors → **build-error-resolver**
- Dead code cleanup → **refactor-cleaner**
- Backend development → **engineer**
- Frontend/UI work → **frontend**
- DevOps/automation → **devops**
- Embedded/firmware → **systems-engineer**
- E2E testing → **e2e-runner**
- Documentation updates → **doc-updater**

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

**Skeleton projects:** Search for battle-tested templates, evaluate with parallel agents (security, extensibility, relevance), clone best match, iterate within proven structure.

## Performance

**Context management:** Avoid last 20% of context window for large refactoring and multi-file features. Lower-sensitivity tasks (single edits, docs, simple fixes) tolerate higher utilization.

**Build troubleshooting:** Use build-error-resolver agent → analyze errors → fix incrementally → verify after each fix.
