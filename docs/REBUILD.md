# SelfRes website rebuild

This is the **planning and content branch** for rebuilding `jerzha40/selfpage` using the open-source [Academic Pages](https://github.com/academicpages/academicpages.github.io) Jekyll template.

## Safeguards

- The original `main` branch and current published website remain unchanged.
- This branch currently contains a **content overlay**, not yet the entire Academic Pages theme. Do not claim the site builds with Jekyll until the template has been imported and tested.
- Do not import personal/private submodule contents or secrets into the public website.
- Treat each portfolio page as an evidence-based status report, not a claim that its research programme is complete.

## Existing organization

- `unjerry/aUnification`: general/private project workspace and catalog.
- `jerzha40/uni_escuela`: academic workspace and collection.
- `jerzha40/selfpage`: **single public website** containing Home, Research, Pantheon (portfolio), Story, CV, Contact.

`uni_escuela` **already contains** a `selfpage` Git submodule at `academic/2025_term_up_autumn/selfpage`. Proposed later move: `identity/selfpage`; this is not implemented yet.

## Import Academic Pages (next implementation step)

Use a **fresh local clone** so existing local work is not affected.

1. Clone the `selfpage` repository and switch to branch `rebuild/academic-pages-v1`.
2. Add the official Academic Pages repository as a separate Git remote, fetch its `master` branch and bring the template files into this branch. Back up or remove the old standalone `index.html` so it no longer intercepts the root URL.
3. Restore the customized `_pages/`, `_portfolio/`, `_data/navigation.yml`, and `docs/` files from this content-overlay commit after importing the template.
4. Set `url: https://jerzha40.github.io`, `baseurl: /selfpage`, and `repository: jerzha40/selfpage` in `_config.yml` (unless later renaming to the user-site repo or adopting a custom domain).
5. Replace other Academic Pages example content and demo author data. Review navigation paths on a project-site base URL.
6. Test locally (`bundle install`, `bundle exec jekyll serve`) and inspect the generated HTML.
7. Preview and review through a pull request. Merge/publish only after layout, links, mobile view, research claims, and personal information are checked.

## Site editorial conventions

- Homepage: clear academic identity first, literary style second.
- Motto: `Need nerves of tungsten.`
- Pantheon: a curated gallery, not an automated dump of all repositories.
- Project labels: `Under restoration`, `Research in progress`, `Verified release`, `Maintained`, or `Archived`.
- New experiments can remain private and messy. Publicly featured projects must have truthful claims and traceable evidence.
- AI assistance to implementation may be acknowledged in the site's credits; numerical/academic authorship must remain separately accurate.

## First planned exhibits

1. FirstAttempt — original 2023 C++ work, to be rehabilitated in 2026.
2. Scattering Lab — analytical benchmark, first stage to be verified and released.

## Before publishing

- Remove the existing page's stale 2026 Master's applicant wording.
- Audit `jerzha40/2025_term_up_autumn_Admission` for publicly exposed personal/application material.
- Add real CV PDF only when finished; do not include dead `cv.pdf` links.
- Replace placeholders in `_config.yml`, remove demo publications/talks/teaching and check each claimed affiliation.
- Make project/site ownership and Academic Pages attribution clear.
