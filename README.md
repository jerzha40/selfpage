# SelfRes / Portfolio — academic website

A personal academic website using the [Academic Pages](https://github.com/academicpages/academicpages.github.io) Jekyll template. **One website; expandable academic sections; a curated portfolio of projects.** This is a development branch; the original site remains intact on `main`.

## Preview in Docker (no Ruby installed on Windows)

From the `selfpage` folder:

```powershell
docker compose up -d --build
```

Open **http://localhost:4000/selfpage/**.

- **Markdown edit:** save changes, wait a few seconds, refresh the browser. No restart needed.
- **Site config change** (`_config_selfres.yml`): `docker compose restart selfpage`.
- **Dockerfile or build script change:** `docker compose up -d --build --force-recreate`.
- **View logs without attaching the terminal:** `docker compose logs -f --tail=50 selfpage` (Ctrl+C only stops log viewing).
- **Stop the preview:** `docker compose stop`. No need to run `down` during normal editing.

## Add content gradually

The standard Academic Pages sections remain available, including empty ones.

### Personal profile sidebar

The left column deliberately uses Academic Pages' original author-profile layout:

- The theme's **neutral silhouette** (`images/profile.png`) is displayed until you supply a photo; the bundled asset is not a photograph of the site owner.
- Existing, verified links (GitHub, ORCID, personal Gmail) are clickable.
- Only unconfigured profile slots remain visible as **(to add)** and are deliberately NOT clickable. Verified account links appear normally.
- Update `author` and `profile_links_to_complete` in `_config_selfres.yml` when you create a new account. Then restart `docker compose restart selfpage`; Jekyll only loads site config on startup.

| Public page               | Edit or add files                                        |
| ------------------------- | -------------------------------------------------------- |
| Home                      | `_pages/about.md`                                        |
| Research                  | `_pages/research.md`                                     |
| Publications              | `_publications/*.md` (archive: `_pages/publications.md`) |
| Projects                  | `_portfolio/*.md` (archive: `_pages/portfolio.html`)     |
| Blog Posts / Year Archive | `_posts/YYYY-MM-DD-title.md`                             |
| Talks                     | `_talks/*.md`                                            |
| Teaching                  | `_teaching/*.md`                                         |
| My Story                  | `_pages/story.md`                                        |
| CV                        | `_pages/cv.md`                                           |
| Contact                   | `_pages/contact.md`                                      |
| Public identity           | `_config_selfres.yml`                                    |
| Navigation                | `_data/navigation.yml`                                   |

**Start with [`_scaffolds/README.md`](_scaffolds/README.md).** It explains how to copy a template for each kind of item. Empty sections display an honest placeholder, rather than a fabricated academic accomplishment.

New files in these content folders are copied into the Jekyll workspace, and the associated archives update automatically. The initial theme remains pinned to a fixed upstream commit; the site is built from our content overlay.

### Replacing the portrait later

The grey silhouette is the original Academic Pages `images/profile.png`. It is a placeholder, not your portrait.

When you have a photograph, save it as `images/portrait.jpg` in this repository, change `author.avatar` to `"portrait.jpg"` in `_config_selfres.yml`, and run `docker compose restart selfpage`. The build copies user-provided images over the upstream assets without deleting the originals.

## Releases and safety

GitHub Actions validates the Jekyll build, generated pages, canonical URLs, sitemap, CSS, identity links, and the documented preprint. **Pushes to `rebuild/academic-pages-v1` automatically deploy this public GitHub Pages site** after checks pass. The old 2025 website remains on `main`; this build does not publish from `main`.

Only public, verified material belongs here. Never automatically expose submodules, private `aUnification` projects, credentials, or student records.

[Theme and AI-assistance credits](THEME_CREDITS.md).

## Public site structure

- Navigation label: **Projects**; archive page title: **Portfolio**.
- Project permalinks remain under `/selfpage/portfolio/`. This is intentional to preserve public URLs and Google indexing.
- Files in `_portfolio/` are project records. Do not rename the Jekyll collection or its Liquid references.
- `files/` is reserved for author-approved attachments, e.g. a future CV PDF. Upstream template sample PDFs are **not** published.
- The contact subject marker is `PORTFOLIOLETTER`; anyone using the older `PANTHEONLETTER` marker can still be found via Gmail search for historical correspondence.
