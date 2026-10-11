# SelfRes / Pantheon — academic website

A compact personal academic website using the [Academic Pages](https://github.com/academicpages/academicpages.github.io) Jekyll theme, plus a small, curated work gallery.

One website, seven sections: Home, Research, Preprints, Pantheon, My Story, CV, and Contact. The theme is pinned at a fixed upstream revision and is built separately from our Markdown content. The original webpage remains on `main` while this branch is being developed.

## Preview locally (Docker Desktop)

Run in the `selfpage` folder from PowerShell:

```powershell
docker compose up -d --build
```

Open **http://localhost:4000/selfpage/**.

The service **runs in the background**. You can close the terminal or keep working in VS Code.

- Edit `_pages/*.md`, `_portfolio/*.md`, or `_data/navigation.yml`: changes are synchronized and Jekyll rebuilds, normally within a few seconds; refresh the browser.
- Edit `_config_selfres.yml`, `_config_docker.yml`, or files under `overrides/`: run `docker compose restart selfpage`. The process must reload configuration and the template overlay.
- Edit `Dockerfile`, `Gemfile` upstream ref, or `scripts/prepare-site.sh`: run `docker compose up -d --build --force-recreate` to rebuild the container.
- View runtime output without staying attached: `docker compose logs -f --tail=50 selfpage`. Press Ctrl+C to stop viewing the logs **without stopping** the website.
- Check status: `docker compose ps`. When you deliberately want to stop the website, run `docker compose stop`; `docker compose down` also removes the container/network.

**You do not need `docker compose down` after every edit.** Ruby/Jekyll dependencies and the generated `_site` directory stay in Docker, not your Windows system.

## Pages and sources

| Content | Location |
| --- | --- |
| Home | `_pages/about.md` |
| Research | `_pages/research.md` |
| Preprints | `_pages/publications.md` |
| Pantheon gallery | `_pages/portfolio.html` |
| Exhibits | `_portfolio/*.md` |
| My Story | `_pages/story.md` |
| CV | `_pages/cv.md` |
| Contact | `_pages/contact.md` |
| Public profile | `_config_selfres.yml` |
| Menu | `_data/navigation.yml` |

The public site intentionally includes **only authored and reviewed content**. We do not automatically publish `aUnification`, the private parts of `uni_escuela`, or repository submodules.

## GitHub Actions

Pushes on this development branch run a site build and a route/content smoke test. Deployment is gated on pushes to `main` after GitHub Pages is configured to use Actions. No public deployment has been requested from this branch.

[Site and template credits](THEME_CREDITS.md)
