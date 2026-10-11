# SelfRes / Pantheon — academic website

A personal academic website using the [Academic Pages](https://github.com/academicpages/academicpages.github.io) Jekyll template. **One website; expandable academic sections; a curated Pantheon gallery.** This is a development branch; the original site remains intact on `main`.

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
- Future profile slots (Google Scholar, LinkedIn, arXiv author profile, Bluesky) remain visible as **(to add)** and are deliberately NOT clickable.
- Update `author` and `profile_links_to_complete` in `_config_selfres.yml` when you create a new account. Then restart `docker compose restart selfpage`; Jekyll only loads site config on startup.

| Public page               | Edit or add files                                        |
| ------------------------- | -------------------------------------------------------- |
| Home                      | `_pages/about.md`                                        |
| Research                  | `_pages/research.md`                                     |
| Publications              | `_publications/*.md` (archive: `_pages/publications.md`) |
| Pantheon                  | `_portfolio/*.md` (archive: `_pages/portfolio.html`)     |
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

GitHub Actions checks that pages, CSS, navigation links, ORCID, and the documented preprint build correctly. It does not publish from this development branch; a deployment is intended only after reviewed changes reach `main`.

Only public, verified material belongs here. Never automatically expose submodules, private `aUnification` projects, credentials, or student records.

[Theme and AI-assistance credits](THEME_CREDITS.md).
