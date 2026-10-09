# AGENTS.md: pstack-app-template

> Base rules for all repos: the organization's Knowledge Standard (draft v0.2, held in a private central repository). Access it through an authorized channel before applying shared rules; this file records this template's repo-specific rules.
> Metadata: [`repo.yaml`](repo.yaml) · last_reviewed: 2026-10-09 (against 1277a22)

## What this repo is
Template for new apps on [pstack](https://github.com/willpower-institute/pstack). An app repo holds **only its own addons** and pins pstack by tag (`PSTACK_REF`, currently `v0.5.1` in `Dockerfile` / `docker-compose.yml`).
Canonical for: the starting layout of a pstack app (addons folder, Dockerfile, compose, CI).
Not canonical for: pstack kernel code or module-writing rules. Those live in pstack (`docs/MODULE_GUIDE.md`, `CHANGELOG.md`).

## When you create a new app from this template
- Rename `app_addons` to `<app>_addons` (never `addons`; it collides with pstack). See README step 2.
- **Edit `repo.yaml` and this `AGENTS.md`** for the new app: name, owner, status, purpose, `depends_on.pin`, `last_reviewed`, and `ws001`. Do not keep the template's values.
- Rename the sample module `demo` to your real module.

## Run / test
See README "Dev บนเครื่อง". Tests: `python -m pytest tests/` with `PSTACK_ADDONS_PATHS=../pstack/addons,app_addons`. CI: `.github/workflows/ci.yml` (clones pstack at `PSTACK_REF` from `.env.example`), `codeql.yml`.

## Repo-specific rules
- Never edit pstack code in this repo. Change pstack, release a tag, then bump `PSTACK_REF` here in one PR after reading pstack's CHANGELOG (README "กติกาสำคัญ").
- Keep `PSTACK_REF` identical in `Dockerfile`, `docker-compose.yml`, `.env.example` and `repo.yaml: depends_on.pin` (one value, four places; a CI check is proposed in the base rules).
- The image contains only `<app>_addons`. Any runtime file (config, seed, assets) needs an explicit `COPY` in the Dockerfile (README warning).
- `.env` is never committed; only `.env.example` with placeholder values.

## Unknown / TBD
- Approving humans for this template: TBD.
- No ADR directory or CHANGELOG yet. Add `docs/decisions/` when the template layout changes in a way apps must follow.
