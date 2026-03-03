# Agent Instructions

## System Context
- **OS**: NixOS
- **Shell**: Fish
- **Editor**: Neovim
- **Python**: Add dependencies to shell.nix; do not use ad-hoc pip install.

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
| security-reviewer | Vulnerability detection | Before commits, sensitive code, user input handling |
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
- Architectural decision → **planner**
- Security-sensitive code → **security-reviewer**
- Build errors → **build-error-resolver**
- Dead code cleanup → **refactor-cleaner**
- Backend development → **engineer**
- Frontend/UI work → **frontend**
- DevOps/automation → **devops**
- Embedded/firmware → **systems-engineer**
- E2E testing → **e2e-runner**
- Documentation updates → **doc-updater**

Use parallel execution for independent operations — launch multiple agents simultaneously.

## Security Guidelines

**Before ANY commit:**
- No hardcoded secrets (API keys, passwords, tokens)
- All user inputs validated
- SQL injection prevention (parameterized queries)
- XSS prevention (sanitized HTML)
- CSRF protection enabled
- Authentication/authorization verified
- Rate limiting on all endpoints
- Error messages don't leak sensitive data

**Secret management:** NEVER hardcode secrets. Use environment variables or a secret manager. Validate required secrets at startup. Rotate any exposed secrets immediately.

**If security issue found:** STOP → use security-reviewer agent → fix CRITICAL issues → rotate exposed secrets → review codebase for similar issues.

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

## Testing Requirements

**Minimum coverage: 80%**

Test types (all required):
1. **Unit tests** — Individual functions, utilities, components
2. **Integration tests** — API endpoints, database operations
3. **E2E tests** — Critical user flows

**TDD workflow (mandatory):**
1. Write test first (RED) — test should FAIL
2. Write minimal implementation (GREEN) — test should PASS
3. Refactor (IMPROVE) — verify coverage 80%+

Troubleshoot failures: check test isolation → verify mocks → fix implementation (not tests, unless tests are wrong).

## Development Workflow

1. **Plan** — Use planner agent, identify dependencies and risks, break into phases
2. **TDD** — Use tdd-guide agent, write tests first, implement, refactor
3. **Review** — Use code-reviewer agent immediately, address CRITICAL/HIGH issues
4. **Commit** — Conventional commits format, comprehensive PR summaries

## Git Workflow

**Commit format:** `<type>: <description>` — Types: feat, fix, refactor, docs, test, chore, perf, ci

**PR workflow:** Analyze full commit history → draft comprehensive summary → include test plan → push with `-u` flag.

## Architecture Patterns

**API response format:** Consistent envelope with success indicator, data payload, error message, and pagination metadata.

**Repository pattern:** Encapsulate data access behind standard interface (findAll, findById, create, update, delete). Business logic depends on abstract interface, not storage mechanism.

**Skeleton projects:** Search for battle-tested templates, evaluate with parallel agents (security, extensibility, relevance), clone best match, iterate within proven structure.

## Performance

**Context management:** Avoid last 20% of context window for large refactoring and multi-file features. Lower-sensitivity tasks (single edits, docs, simple fixes) tolerate higher utilization.

**Build troubleshooting:** Use build-error-resolver agent → analyze errors → fix incrementally → verify after each fix.

## Project Structure

```
agents/        
skills/         
commands/        
```

## Success Metrics

- All tests pass with 80%+ coverage
- No security vulnerabilities
- Code is readable and maintainable
- Performance is acceptable
- User requirements are met
