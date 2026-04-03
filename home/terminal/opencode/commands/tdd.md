---
description: Enforce test-driven development workflow. Scaffold interfaces, generate tests FIRST, then implement minimal code to pass. Ensure 80%+ coverage.
---

# TDD Command

Test-driven development using scout, planner, and reviewer agents.

## Workflow

```
scout -> planner -> reviewer
```

1. **scout** - Understand the codebase, find relevant files
2. **planner** - Plan the implementation with tests first
3. **reviewer** - Review the implementation

## TDD Cycle

```
RED → GREEN → REFACTOR → REPEAT

RED:      Write a failing test
GREEN:    Write minimal code to pass
REFACTOR: Improve code, keep tests passing
REPEAT:   Next feature/scenario
```

## Usage

```
/tdd "Implement feature X"
```

1. Scout gathers context about relevant files
2. Planner creates test-first implementation plan
3. Worker writes failing tests (RED)
4. Worker implements to pass (GREEN)
5. Reviewer reviews the code

## Coverage Requirements

- **80% minimum** for all code
- **100% required** for financial, auth, security-critical code