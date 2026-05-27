---
name: spec-execute
description: "Execute all plans for a phase in parallel waves. Runs tasks with atomic commits, verification after each task, and generates SUMMARY.md."
argument-hint: "<phase-number>"
---

# /spec-execute — Execute a Phase

Trigger the `spec-skill` skill and execute the phase execution workflow.

See `workflows/execute-plan.md` for the complete execution procedure.

## Workflow

1. **Pre-Execution** — Load context (STATE.md, PROJECT.md, PLAN.md), validate readiness, check user_setup
2. **Execute in Waves** — Group plans by `wave` number. Within each wave, run plans in parallel. Waves execute sequentially.
3. **Per-Task** — Read first → implement → verify → atomic commit
4. **Checkpoints** — Pause at `checkpoint:*` tasks, present to user, resume on approval
5. **Post-Execution** — Create SUMMARY.md, update STATE.md, update PROJECT.md if needed

## Wave Execution Pattern

```
WAVE 1 (parallel):   Plan 01, Plan 02     # Independent, no overlap
WAVE 2 (parallel):   Plan 03, Plan 04     # Depend on wave 1
WAVE 3:              Plan 05              # Depends on plans 03+04
```

## What You Produce

- Code changes with atomic commits per task
- `.planning/phases/XX-name/XX-YY-SUMMARY.md` — Post-execution summary with frontmatter

## Key Rules

- Build/test must pass after each task before committing
- Do NOT proceed past a failing verification
- 3 consecutive failures → document, consult debugging references, create checkpoint for user
- Context window filling → complete current task, commit, create `.continue-here.md`
