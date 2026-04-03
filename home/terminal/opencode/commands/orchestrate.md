# Orchestrate Command

Sequential agent workflow for complex tasks.

## Usage

`/orchestrate [workflow-type] [task-description]`

## Workflow Types

### feature
Full feature implementation workflow:
```
scout -> planner -> reviewer
```

### bugfix
Bug investigation and fix workflow:
```
scout -> planner -> reviewer
```

### refactor
Safe refactoring workflow:
```
scout -> planner -> reviewer
```

### quick
Quick task execution:
```
worker
```

## Execution Pattern

For each agent in the workflow:

1. **Invoke agent** with context from previous agent
2. **Collect output** as structured handoff document
3. **Pass to next agent** in chain
4. **Aggregate results** into final report

## Handoff Document Format

Between agents, create handoff document:

```markdown
## HANDOFF: [previous-agent] -> [next-agent]

### Context
[Summary of what was done]

### Findings
[Key discoveries or decisions]

### Files Modified
[List of files touched]

### Open Questions
[Unresolved items for next agent]

### Recommendations
[Suggested next steps]
```

## Example: Feature Workflow

```
/orchestrate feature "Add user authentication"
```

Executes:

1. **Scout Agent**
   - Gathers codebase context
   - Identifies relevant files
   - Output: `HANDOFF: scout -> planner`

2. **Planner Agent**
   - Analyzes requirements
   - Creates implementation plan
   - Identifies dependencies
   - Output: `HANDOFF: planner -> reviewer`

3. **Reviewer Agent**
   - Reviews implementation
   - Checks for issues
   - Suggests improvements
   - Output: Final Report

## Final Report Format

```
ORCHESTRATION REPORT
====================
Workflow: feature
Task: Add user authentication
Agents: scout -> planner -> reviewer

SUMMARY
-------
[One paragraph summary]

AGENT OUTPUTS
-------------
Scout: [summary]
Planner: [summary]
Reviewer: [summary]

FILES CHANGED
-------------
[List all files modified]

TEST RESULTS
------------
[Test pass/fail summary]

RECOMMENDATION
--------------
[SHIP / NEEDS WORK / BLOCKED]
```

## Arguments

$ARGUMENTS:
- `feature <description>` - Full feature workflow
- `bugfix <description>` - Bug fix workflow
- `refactor <description>` - Refactoring workflow
- `quick <description>` - Quick task with worker

## Custom Workflow Example

```
/orchestrate custom "scout,planner,reviewer" "Redesign caching layer"
```

## Tips

1. **Start with scout** for context gathering
2. **Always include planner** for design
3. **Always include reviewer** before merge
4. **Keep handoffs concise** - focus on what next agent needs
5. **Run verification** between agents if needed