---
name: spec-map-codebase
description: "Analyze an existing codebase (brownfield project) to understand its structure, architecture, tech stack, conventions, and concerns. Produces .planning/codebase/ analysis documents."
argument-hint: "[area-to-focus]"
---

# /spec-map-codebase — Codebase Analysis

Trigger the `spec-skill` skill and analyze an existing codebase for brownfield projects.

## When to Use

- Starting spec-driven development on an existing project
- Need to understand a codebase before adding features
- Want structured documentation of the current state

## Workflow

1. **Structure Analysis** — Document directory layout, entry points, module organization
2. **Architecture Analysis** — Identify design patterns, data flow, component relationships
3. **Stack Analysis** — Catalog technologies, versions, and rationale
4. **Conventions Analysis** — Document naming patterns, file organization, error handling
5. **Integrations Analysis** — Map external services, APIs, authentication
6. **Testing Analysis** — Document test frameworks, coverage, CI integration
7. **Concerns Analysis** — Identify technical debt, security issues, performance bottlenecks

## What You Produce

- `.planning/codebase/structure.md` — Directory organization and key modules
- `.planning/codebase/architecture.md` — Design patterns and component relationships
- `.planning/codebase/stack.md` — Technology stack with versions
- `.planning/codebase/conventions.md` — Coding conventions and patterns
- `.planning/codebase/integrations.md` — External services and dependencies
- `.planning/codebase/testing.md` — Testing approach and coverage
- `.planning/codebase/concerns.md` — Known issues and technical debt

## Key Rules

- Read actual code — don't guess from file names
- Sample 3-5 representative files per category
- Note both explicit rules (linter config) and implicit conventions (code patterns)
- After analysis, offer to run `/spec-new` with the codebase analysis as context
