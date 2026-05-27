---
name: spec-new
description: "Initialize a new spec-driven project. Full initialization flow: questions → research → requirements → roadmap. Creates .planning/ directory structure with PROJECT.md, REQUIREMENTS.md, ROADMAP.md, STATE.md, and config.json."
argument-hint: "[project-name]"
---

# /spec-new — New Project Initialization

Trigger the `spec-skill` skill and execute the project initialization workflow.

## Workflow

1. **Questions** — Ask until the user's idea is fully understood (goals, constraints, tech preferences, edge cases)
2. **Requirements** — Extract v1, v2, and out-of-scope items
3. **Roadmap** — Create phases mapped to requirements
4. **Initialize** — Create `.planning/` directory with PROJECT.md, REQUIREMENTS.md, ROADMAP.md, STATE.md, config.json

## What You Produce

- `.planning/PROJECT.md` — Project vision and context
- `.planning/REQUIREMENTS.md` — Scoped requirements with traceability
- `.planning/ROADMAP.md` — Phase decomposition with success criteria
- `.planning/STATE.md` — Project memory and session state
- `.planning/config.json` — Workflow configuration

## Key Rules

- **STOP and WAIT** for user confirmation before creating any files
- Use `references/questioning.md` for questioning strategies
- Follow `templates/PROJECT.md` template structure
- Check for existing `.planning/` — if found, offer to reinitialize or merge
