---
name: spec-config
description: "Show or update .planning/config.json settings. Displays current configuration and allows changing mode, granularity, workflow toggles, and other settings."
---

# /spec-config — Configuration Management

Trigger the `spec-skill` skill and manage `.planning/config.json` settings.

## When Invoked Without Arguments

Display the current configuration with key settings highlighted:

```
# Current Configuration

Mode: interactive
Granularity: standard
Research: enabled
Plan check: enabled
Verifier: enabled
Parallel execution: enabled (max 3 agents)
Gates: all enabled (8 checkpoints)

Full config: .planning/config.json
```

## When Invoked With Arguments

```
/spec-config mode yolo              # Set auto-approve mode
/spec-config granularity fine       # More granular phases (8-12)
/spec-config parallel off           # Disable parallel execution
/spec-config research off           # Skip research before planning
/spec-config discuss assumptions    # Use codebase-first discovery
/spec-config show                   # Show full config.json
```

## Common Settings

| Setting | Values | Effect |
|---------|--------|--------|
| `mode` | `interactive`, `yolo` | Confirm vs auto-approve |
| `granularity` | `coarse`, `standard`, `fine` | Phase count (3-5 / 5-8 / 8-12) |
| `workflow.research` | boolean | Research before planning |
| `workflow.plan_check` | boolean | Verify plans before execution |
| `workflow.verifier` | boolean | Verify must_haves after execution |
| `workflow.discuss_mode` | `discuss`, `assumptions` | Interview vs codebase-first |
| `parallelization.enabled` | boolean | Run independent plans in parallel |

See `templates/config.json` for the full schema.
