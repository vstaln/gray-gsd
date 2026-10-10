<div align="center">
  <img alt="gray-gsd" src="assets/icon.svg" width="120" height="120" />
  <h1>gray-gsd</h1>
  <p><strong>Spec, plan and tasks workflow, with all state kept as plain markdown.</strong></p>
  <p>
    <a href="https://gray.alignment.id">Website</a> ·
    <a href="https://gray.alignment.id/plugins/gray-gsd">Store</a> ·
    <a href="https://github.com/vstaln/gray-gsd">Source</a> ·
    <a href="https://github.com/vstaln/gray">gray</a>
  </p>
  <p>
    <a href="LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-1c1c20?style=flat-square&labelColor=0a0a0b" /></a>
    <a href="https://www.rust-lang.org"><img alt="Built with Rust" src="https://img.shields.io/badge/built%20with-rust-1c1c20?style=flat-square&labelColor=0a0a0b&logo=rust&logoColor=d4a373" /></a>
    <a href="https://gray.alignment.id/plugins/gray-gsd"><img alt="gray plugin" src="https://img.shields.io/badge/gray-plugin-1c1c20?style=flat-square&labelColor=0a0a0b&color=7aa2f7" /></a>
  </p>
</div>

<br/>

```bash
gray plugin install gray-gsd
```

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

## Tags

`gray` `plugin` `gsd` `rust`

---
Part of the [gray](https://github.com/vstaln/gray) plugin ecosystem —
the open-source AI agent harness. <https://gray.alignment.id>
