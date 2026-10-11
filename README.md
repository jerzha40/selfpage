# SelfRes / Jinrui Zhang — academic website

**Branch:** `rebuild/academic-pages-v1` (work in progress, not yet published).

One public website, including the academic homepage, Research, Pantheon (work gallery), My Story, CV, and Contact. The project is managed as a submodule of `jerzha40/uni_escuela`.

Built using the open-source [Academic Pages](https://github.com/academicpages/academicpages.github.io) template. Rather than copy its source into this repository, the Docker and GitHub Actions builds download a **pinned revision** of the template, overlay our Markdown and site configuration, and build a static Jekyll website.

## Local preview with Docker Desktop

From this folder in PowerShell:

```powershell
docker compose up --build
```

Then open **http://localhost:4000/selfpage/**.

Ruby, Bundler and Jekyll live inside the Docker image; no host Ruby installation is required. The repository is mounted read-only, and generated files remain inside the container.

Edit `_pages/`, `_portfolio/`, and `_data/navigation.yml` in VS Code. Jekyll checks for changes; refresh your browser. If you change `_config_selfres.yml` or template infrastructure, restart with `docker compose restart`, or rebuild the image when you change the Dockerfile.

Stop with Ctrl+C and optionally run `docker compose down`.

## GitHub Actions

The workflow `.github/workflows/site.yml` checks site builds on this development branch. A deployment to GitHub Pages is only attempted **after** this branch is merged into `main` and GitHub Pages is configured to use GitHub Actions.

## Source of truth

- `_pages/about.md`: homepage
- `_pages/research.md`: research directions
- `_pages/story.md`: personal essay
- `_pages/cv.md`: compact, carefully reviewed CV
- `_pages/contact.md`: contact
- `_portfolio/*.md`: curated project exhibits
- `_config_selfres.yml`: public identity and site deployment settings

The previous standalone `index.html` is retained in the `main` branch and its Git history, but intentionally removed from this rebuild branch. The new homepage is generated from `_pages/about.md`.

See [THEME_CREDITS.md](THEME_CREDITS.md) and [docs/REBUILD.md](docs/REBUILD.md).
