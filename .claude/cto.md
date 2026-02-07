
# Development Guidelines for Claude

> **About this file (v3.1.0)**
> Lean, always-loaded core optimized for context efficiency.
> This file defines **non-negotiable principles**. Details are loaded on demand via skills.

## Architecture

* **CLAUDE.md (this file)**
  Core philosophy + operational constraints (~100 lines, always loaded)

* **Skills**
  Deep patterns loaded on demand
  (`tdd`, `testing`, `mutation-testing`, `test-design-reviewer`, `typescript-strict`, `functional`, `refactoring`, `expectations`, `planning`, `front-end-testing`, `react-testing`)

* **Agents**
  Specialized subprocesses for verification, critique, and analysis

**Previous versions**

* v2.0.0 — Modular with always-loaded docs (~3000+ lines)
* v1.0.0 — Monolithic single file (1,818 lines)

---

## Core Philosophy

**TEST-DRIVEN DEVELOPMENT IS NON-NEGOTIABLE.**

Every line of production code exists **only** to satisfy a failing test.
No exceptions. No shortcuts. No speculative code.

TDD is not a testing strategy — it is the **design mechanism** that enables:

* simple design
* safe refactoring
* fast feedback
* predictable AI behavior

All work proceeds in **small, reversible, known-good increments**.

---

## Non-Negotiable Rules (Quick Reference)

### Engineering Principles

* Tests are written first, always
* Tests describe **behavior**, never implementation
* Design emerges from tests, not upfront speculation
* Code is correct *only* if behavior is proven by tests

### Type & Design Constraints

* TypeScript **strict mode only**
* No `any` (use `unknown` if truly unknown)
* No unjustified type assertions
* Immutable data only
* Small, pure functions
* Real schemas/types in tests — never redefined

---

## Testing Discipline

**Core rule**: 100% of meaningful behavior must be test-driven.

### Testing Rules

* Tests go through **public APIs only**
* Tests document business behavior
* No 1:1 mapping between test files and implementation files
* No shared mutable state in tests
* Use factory functions for test data
  (no `let`, no `beforeEach`)

Mutation testing is used to **validate test quality**, not inflate coverage.

> Load `testing` and `mutation-testing` skills for detailed patterns.

---

## TypeScript Guidelines

**Principle**: Schemas at trust boundaries. Types for internal logic.

### Rules

* Strict mode always
* Prefer `type` for data
* Use `interface` only for behavioral contracts
* Define schemas first, derive types from them (Zod / Standard Schema)
* Validate external inputs at boundaries, not internally

> Load `typescript-strict` for rationale and patterns.

---

## Code Style

**Principle**: Functional, immutable, self-documenting code.

### Rules

* No data mutation
* Prefer pure functions
* No nested conditionals — use early returns or composition
* No comments explaining *what* the code does
  (if needed, the code is wrong)
* Prefer options objects over positional parameters
* Prefer `map / filter / reduce` over loops

> Load `functional` for detailed patterns.

---

## Development Workflow

**Canonical loop**: RED → GREEN → REFACTOR

### Workflow Rules

1. **RED** — write a failing test
   (no production code without one)
2. **GREEN** — write the minimum code to pass
3. **REFACTOR** — improve design *only if it adds value*
4. Codebase must be working after every step
5. **Wait for commit approval before every commit**

Significant work uses the three-document model:

* `PLAN.md`
* `WIP.md`
* `LEARNINGS.md`

> Load `tdd`, `refactoring`, and `planning` skills as needed.

---

## Working With Claude

**Principle**: AI amplifies discipline — it does not replace it.

### Expectations

* TDD is followed strictly, without exception
* Refactoring is assessed after every green
* Learnings are captured while context is fresh
* CLAUDE.md is updated when principles evolve
* Regularly ask:
  *“What do I wish I’d known at the start?”*

> Load `expectations` for documentation standards.

---

## Resources

* TypeScript Handbook
* Testing Library Guiding Principles
* Kent C. Dodds — Testing JavaScript
* Functional Programming in TypeScript (fp-ts)

---

## Summary

This system exists to produce **correct software through constraint**.

Tests drive design.
Small steps preserve control.
Types encode truth.
Immutability enables confidence.

When in doubt:
**write the test, make it pass, then simplify.**

