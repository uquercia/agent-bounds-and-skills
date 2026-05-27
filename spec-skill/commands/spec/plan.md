---
name: spec-plan
description: "Research and create an executable PLAN.md for a specific phase. Runs discovery questions, research, and generates atomic task plans with XML structure."
argument-hint: "<phase-number>"
---

# /spec-plan — Plan a Phase

Trigger the `spec-skill` skill and execute the phase planning workflow.

## Workflow

1. **Load Context** — Read PROJECT.md, ROADMAP.md, STATE.md, and prior phase summaries
2. **Discuss (BLOCKING)** — Ask phase-specific clarifying questions about scope, constraints, interfaces, and acceptance criteria. Use `references/questioning.md` for patterns.
3. **Research** — Investigate implementation approaches, libraries, and patterns for this phase
4. **Create PLAN.md** — Generate the executable plan following `templates/PLAN.md`:
   - Must_haves (truths, artifacts, key_links) for goal-backward verification
   - XML task structure with `<read_first>`, `<acceptance_criteria>`, concrete values
   - Wave assignment for parallel execution
   - User_setup for external services
5. **Review (BLOCKING)** — Present full plan, **STOP and WAIT** for user confirmation

## What You Produce

- `.planning/phases/XX-name/XX-CONTEXT.md` — Discovery decisions
- `.planning/phases/XX-name/XX-RESEARCH.md` — Technical research
- `.planning/phases/XX-name/XX-YY-PLAN.md` — Executable implementation plan

## Key Rules

- 2-3 tasks per plan, ~50% context max
- Prefer vertical slices over horizontal layers
- Every task must have grep-verifiable acceptance criteria
- Reference prior SUMMARYs only when genuinely needed (not reflexive chaining)
- External services → declare in `user_setup` frontmatter
