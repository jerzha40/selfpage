# SelfRes website rebuild — Academic Pages / Docker

This branch now includes a **working build configuration (not yet independently run)** using an upstream Academic Pages template pinned to commit `c089e79c7bce7ff453de525bc0bb80c261400cf6`.

## Structure

- `unjerry/aUnification`: general project index and private research/development workspace.
- `jerzha40/uni_escuela`: academic index; already contains `selfpage` as submodule at `academic/2025_term_up_autumn/selfpage`.
- `jerzha40/selfpage`: a single website for Home, Research, Pantheon, Story, CV, Contact.

Proposed move of the submodule to `identity/selfpage` has **not** been performed.

## Local preview

```powershell
docker compose up --build
```

Open `http://localhost:4000/selfpage/`. Generated site files are produced in the container, not copied to your Windows project folder.

The original `index.html` is excluded from the generated website. It is unchanged on `main`.

## Build approach

The official theme is checked out by SHA, then `scripts/prepare-site.sh` removes its example pages/portfolio and overlays our Markdown and navigation. The theme's own `_config.yml` is extended by `_config_selfres.yml`; local Docker adds `_config_docker.yml`.

GitHub Actions validates pushes to the rebuild branch. Deployment is gated on pushes to `main` after review; configure GitHub Pages to use Actions when ready.

## Before merging

- [ ] Confirm `docker compose up --build` actually succeeds on Windows.
- [ ] Verify links at the project-site base path `/selfpage/`.
- [ ] Inspect mobile and desktop appearance.
- [ ] Validate all research claims and statuses.
- [ ] Check privacy of public application materials and GitHub references.
- [ ] Add a reviewed CV PDF only if desired; no dead PDF links.
- [ ] Decide whether to rename the repository to `jerzha40.github.io` later.
- [ ] Review Pantheon work pages and replace provisional status with reproducible releases.

## Attribution

See `THEME_CREDITS.md`. AI assistance to website implementation is credited, while research authorship and evidence are handled separately.
