# gray-gsd

The **Get Shit Done** spec → plan → tasks loop as gray sidecar commands.
Upstream spreads the workflow across dozens of phase commands; this port
condenses it to `/gsd` plus a `gsd_task` checklist tool, with all state as
plain markdown under `.gsd/` in the project repo (`spec.md`, `plan.md`,
`tasks.md` checkboxes).

## Commands

| command | wire reply | what it does |
|---|---|---|
| `/gsd <goal>` | `{prompt}` | writes `.gsd/spec.md` (falsifiable requirements, non-goals, acceptance criteria), `.gsd/plan.md` (steps + per-step verification), `.gsd/tasks.md` (`- [ ]` list), then executes task-by-task — marking `- [x]` only after each task's verification passes |
| `/gsd spec-only <goal>` | `{prompt}` | writes the three `.gsd/` files, then stops before executing |
| `/gsd execute` | `{prompt}` / `{text}` | resumes unchecked tasks; plain text error if `.gsd/tasks.md` is missing |
| `/gsd status` | `{text}` | spec/plan presence + rendered task checklist (`n/m tasks done`) |
| `/gsd reset` | `{text}` | removes the `.gsd/` state files |

## Tool

`gsd_task {action, index?, text?, dir?}` — manage `.gsd/tasks.md`:
`list` (default), `done <index>`, `undo <index>`, `add <text>`.
Indices are 1-based in file order.

## Wire methods used

`plugin/manifest`, `tool/call`, `command/run`, `plugin/shutdown`.
No hooks, no capabilities — protocol 1.1.

## Upstream

[gsd-build/get-shit-done](https://github.com/gsd-build/get-shit-done) —
MIT. Phrasing adapted from `commands/gsd/spec-phase.md`,
`plan-phase.md`, `execute-phase.md`, `verify-work.md` (falsifiable
requirements, verification loop, never mark unverified work done);
state layout simplified from `.planning/` to `.gsd/`.

## Install

```sh
cargo install --path .        # or: cargo build --release
gray plugin install ~/.cargo/bin/gray-gsd
```
