---
name: spec-transition
description: "Complete the current phase and prepare for the next phase. Updates PROJECT.md, ROADMAP.md, and STATE.md with completion context."
---

# /spec-transition — Phase Transition

Trigger the `spec-skill` skill and execute the phase transition workflow.

See `workflows/transition.md` for the complete transition procedure.

## Workflow

1. **Verify Completion** — Confirm all plans have SUMMARY.md, verification passed, UAT completed
2. **Update PROJECT.md** — Move completed requirements to Validated, add new decisions, refresh context
3. **Update ROADMAP.md** — Mark phase complete, add completion date, update progress
4. **Update STATE.md** — Set position to next phase, update metrics, record transition
5. **Context Assembly** — Summarize what was built, list new files/modules, flag decisions affecting future phases
6. **Checkpoint (BLOCKING)** — Present summary to user, **WAIT** for confirmation before next phase

## What You Update

- `.planning/PROJECT.md` — Requirements status, key decisions, product description
- `.planning/ROADMAP.md` — Progress table, phase status
- `.planning/STATE.md` — Current position, accumulated context, performance metrics

## Key Rules

- Never transition with unresolved critical issues
- Always present the transition summary to the user
- Wait for explicit confirmation before starting next phase discussion
- If user wants to pause, create `.continue-here.md` with assembled context
