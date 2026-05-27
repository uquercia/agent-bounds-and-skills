---
name: spec-next
description: "Auto-detect the current project state and run the next logical workflow step. Reads STATE.md to determine position and routes to the appropriate command."
---

# /spec-next — Auto-Advance

Trigger the `spec-skill` skill and automatically determine the next workflow step.

## Workflow

1. **Read STATE.md** — Check current position (phase, plan, status)
2. **Determine Next Step**:
   - No `.planning/` → Route to `/spec-new`
   - Phase status "Ready to discuss" → Route to `/spec-plan <phase>`
   - Phase status "Ready to execute" → Route to `/spec-execute <phase>`
   - Phase status "In progress" → Resume execution (load `.continue-here.md` if exists)
   - Phase status "Phase complete" → Route to `/spec-verify <phase>` or `/spec-transition`
   - All phases complete → Suggest `/spec-transition` or new milestone
3. **Report** — Tell the user what step is next and ask for confirmation before proceeding

## What You Read

- `.planning/STATE.md` — Current position
- `.planning/ROADMAP.md` — Phase progress
- `.continue-here.md` — Paused session context (if exists)

## Key Rules

- Always report what you detected before taking action
- Ask for confirmation: "Ready to proceed with <next step>?"
- If state is ambiguous, present options to the user
