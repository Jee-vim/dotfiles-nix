---
description: Comprehensive Python code review for PEP 8 compliance, type hints, security, and Pythonic idioms. Uses reviewer agent.
---

# Python Code Review

Uses **reviewer** agent for comprehensive Python-specific code review.

## Review Categories

### CRITICAL (Must Fix)
- SQL/Command injection vulnerabilities
- Unsafe eval/exec usage
- Pickle unsafe deserialization
- Hardcoded credentials
- YAML unsafe load
- Bare except clauses hiding errors

### HIGH (Should Fix)
- Missing type hints on public functions
- Mutable default arguments
- Swallowing exceptions silently
- Not using context managers for resources
- C-style looping instead of comprehensions
- Using type() instead of isinstance()
- Race conditions without locks

### MEDIUM (Consider)
- PEP 8 formatting violations
- Missing docstrings on public functions
- Print statements instead of logging
- Inefficient string operations
- Magic numbers without named constants

## Automated Checks

```bash
# Type checking
mypy .

# Linting and formatting
ruff check .
black --check .

# Security scanning
bandit -r .

# Testing
pytest --cov=app --cov-report=term-missing
```

## Framework-Specific Reviews

### Django Projects
- N+1 query issues (use `select_related` and `prefetch_related`)
- Missing migrations for model changes
- Raw SQL usage when ORM could work
- Missing `transaction.atomic()` for multi-step operations

### FastAPI Projects
- CORS misconfiguration
- Pydantic models for request validation
- Response models correctness
- Proper async/await usage

### Flask Projects
- Context management (app context, request context)
- Proper error handling
- Blueprint organization

## Common Fixes

### Add Type Hints
```python
# Before
def calculate(x, y):
    return x + y

# After
def calculate(x: int | float, y: int | float) -> int | float:
    return x + y
```

### Use Context Managers
```python
# Before
f = open("file.txt")
data = f.read()
f.close()

# After
with open("file.txt") as f:
    data = f.read()
```

### Fix Mutable Defaults
```python
# Before
def append(value, items=[]):
    items.append(value)
    return items

# After
def append(value, items=None):
    if items is None:
        items = []
    items.append(value)
    return items
```