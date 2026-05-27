---
name: spec-quick
description: "Execute an ad-hoc task with GSD guarantees (atomic commits, verification) but skip full planning. For tasks that don't need phases and research."
argument-hint: "<task-description>"
---

# /spec-quick — Quick Task Execution

Trigger the `spec-skill` skill and execute a lightweight ad-hoc task.

## When to Use

- Single, well-understood tasks ("Add dark mode toggle", "Fix type error in auth.ts")
- Don't need full phase planning or research
- Want atomic commits and verification without the overhead

## When NOT to Use

- Multi-step features → Use `/spec-new` + `/spec-plan`
- Unclear requirements → Use `/spec-new` for full discovery
- Cross-module changes → Use full phase workflow

## Workflow

1. **Understand** — Quick clarification of the task (1-2 questions max)
2. **Execute** — Implement the task with atomic commits
3. **Verify** — Build, type check, lint, test
4. **Document** — Create a lightweight summary in `.planning/quick/`

## What You Produce

- `.planning/quick/NNN-task-name/PLAN.md` — Minimal plan
- `.planning/quick/NNN-task-name/SUMMARY.md` — Outcome summary
- Atomic git commits

## Key Rules

- Skip research, plan checker, and verifier by default
- Still create atomic commits per logical change
- Still update STATE.md with last activity
- Keeps `.planning/quick/` separate from phase directories
