---
name: spec-health
description: "Validate .planning/ directory integrity. Check required files, config schema, phase directory structure, and artifact naming conventions. Auto-repair with --repair flag."
argument-hint: "[--repair]"
---

# /spec-health — Health Check

Trigger the `spec-skill` skill and run the `.planning/` directory health check.

See `workflows/health.md` for the complete health check procedure.

## Workflow

1. **Directory Validation** — Check `.planning/`, `.planning/phases/` exist
2. **Required Files** — Verify PROJECT.md, ROADMAP.md, STATE.md, config.json present
3. **Config Schema** — Validate config.json structure and field types
4. **Phase Integrity** — Check naming conventions, cross-reference with ROADMAP
5. **Artifact Naming** — Verify PLAN.md, SUMMARY.md follow `NN-MM-NAME.md` convention
6. **Cross-Reference** — ROADMAP ↔ Phases, ROADMAP ↔ Requirements, Plans ↔ Requirements

## Auto-Repair (`--repair`)

- Missing required files → Create from `templates/` directory
- Invalid config values → Reset to template defaults
- Missing directories → Create
- Corrupted content → Report for manual fix

## Output

Health report with:
- Summary (files present, phases found, warnings, errors)
- Errors requiring immediate fix
- Warnings to review
- Auto-repairs applied
- Recommendations

## Key Rules

- Template-created files include `<!-- AUTO-GENERATED -->` header
- Phase directories with no plans or summaries → warning only
- config.json with invalid types → reset to defaults
