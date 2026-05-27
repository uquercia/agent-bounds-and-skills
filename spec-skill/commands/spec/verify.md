---
name: spec-verify
description: "Verify phase completion by checking must_haves (truths, artifacts, key_links), running automated tests, and conducting UAT. Creates verification report and fix plans if gaps found."
argument-hint: "<phase-number>"
---

# /spec-verify — Verify Phase Completion

Trigger the `spec-skill` skill and execute the verification workflow.

See `workflows/verify-work.md` for the complete verification procedure.

## Workflow

1. **Load Verification Context** — Collect all `must_haves` from phase plans, read SUMMARY.md files
2. **Automated Checks** — Build, type check, lint, tests
3. **Must-Haves Verification**:
   - **Truths** — Verify each observable behavior is actually working
   - **Artifacts** — Check files exist, have real content (not placeholders), meet min_lines/exports/contains
   - **Key Links** — Grep for connection patterns, verify mechanisms
4. **Manual Verification** — Present UAT deliverables to user for interactive testing
5. **Generate Report** — Create VERIFICATION.md with results table
6. **Handle Gaps** — Critical gaps → fix plans → re-execute → re-verify

## What You Produce

- `.planning/phases/XX-name/XX-VERIFICATION.md` — Full verification report
- `.planning/phases/XX-name/XX-UAT.md` — User acceptance test results (if applicable)
- Fix plans for any critical gaps found

## Key Rules

- Task completion ≠ Goal achievement — must_haves verify the GOAL, not just the tasks
- Critical gaps MUST be fixed before transition
- Non-critical gaps → document as accepted with rationale
- All automated checks must pass before manual verification
