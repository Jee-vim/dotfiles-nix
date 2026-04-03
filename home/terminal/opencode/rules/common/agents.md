# Agent Orchestration

## Available Agents

Located in `~/.claude/agents/`:

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| scout | Fast codebase reconnaissance | Understanding project structure, finding files, gathering context |
| planner | Implementation planning + system design | Complex features, refactoring, architectural decisions |
| reviewer | Code review | After writing code |
| worker | General purpose task execution | Running commands, executing tasks |

## Immediate Agent Usage

No user prompt needed:
1. Quick context gathering - Use **scout** agent
2. Complex feature requests - Use **planner** agent
3. Code just written/modified - Use **reviewer** agent
4. Task execution, running commands - Use **worker** agent

## Parallel Task Execution

ALWAYS use parallel Task execution for independent operations:

```markdown
# GOOD: Parallel execution
Launch 2 agents in parallel:
1. Agent 1: Gather context with scout
2. Agent 2: Review code with reviewer

# BAD: Sequential when unnecessary
First scout, then reviewer
```

## Multi-Perspective Analysis

For complex problems, use split role sub-agents:
- Scout (context gathering)
- Planner (design)
- Reviewer (quality)
- Worker (execution)