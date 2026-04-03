---
description: Generate and run end-to-end tests with Playwright.
---

# E2E Command

End-to-end testing using worker agent with Playwright.

## Workflow

```
scout -> worker -> reviewer
```

1. **scout** - Understand user flow, identify test scenarios
2. **worker** - Generate and run Playwright tests
3. **reviewer** - Review test quality

## Usage

```
/e2e "Test user login flow"
```

## Critical User Flows (Priority Order)

1. User authentication (login/logout)
2. Browse and view markets
3. Search functionality
4. Place trade (test funds only)
5. Withdraw funds

## Test Artifacts

- Screenshots on failure
- Videos on failure
- HTML report
- Traces for debugging

## Best Practices

- Use data-testid attributes
- Wait for API responses, not arbitrary timeouts
- Test critical journeys only
- Run on staging, never production