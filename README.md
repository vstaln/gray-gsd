<p align="center">
  <img src="assets/gray-logo.svg" alt="gray" width="96">
</p>
<h1 align="center">gray-gsd</h1>
<p align="center">The Get Shit Done spec → plan → tasks loop as gray sidecar commands.</p>
<p align="center">
  <a href="https://github.com/vstaln/gray-gsd/blob/main/LICENSE"><img alt="MIT License" src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
  <img alt="gray plugin" src="https://img.shields.io/badge/gray-plugin-7aa2f7.svg">
  <img alt="rust" src="https://img.shields.io/badge/built%20with-rust-orange.svg">
</p>

The full workflow is condensed to `/gsd` plus a `gsd_task` checklist tool,
with all state as plain markdown under `.gsd/` in the project repo
(`spec.md`, `plan.md`, `tasks.md` checkboxes).

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

## Install

```sh
cargo install --path .        # or: cargo build --release
gray plugin install ~/.cargo/bin/gray-gsd
```

---
Part of the [gray](https://github.com/vstaln/gray) plugin ecosystem —
the open-source AI agent harness. <https://gray.alignment.id>
