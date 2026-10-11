#!/usr/bin/env python3
"""Build-artifact smoke check for the public SelfRes academic site.

Standard library only; runs after the Jekyll build in GitHub Actions.
"""
from pathlib import Path
import sys

root = Path(sys.argv[1] if len(sys.argv) > 1 else "_site")
routes = (
    "index.html",
    "research/index.html",
    "publications/index.html",
    "portfolio/index.html",
    "portfolio/firstattempt/index.html",
    "portfolio/scattering-lab/index.html",
    "story/index.html",
    "cv/index.html",
    "contact/index.html",
    "assets/css/main.css",
)
missing = [p for p in routes if not (root / p).is_file()]
if missing:
    raise SystemExit("Missing generated site files:\n" + "\n".join(missing))

css = (root / "assets/css/main.css").read_text(encoding="utf-8")
if len(css) < 1000:
    raise SystemExit("Site stylesheet is unexpectedly empty.")

home = (root / "index.html").read_text(encoding="utf-8")
preprints = (root / "publications/index.html").read_text(encoding="utf-8")
for route in ("research", "publications", "portfolio", "story", "cv", "contact"):
    if f"/selfpage/{route}/" not in home:
        raise SystemExit(f"Missing navigation URL for {route}.")
if "/selfpage/assets/css/main.css" not in home:
    raise SystemExit("Stylesheet URL is missing the correct project-site base path.")
if "0009-0003-9957-2569" not in home:
    raise SystemExit("Verified ORCID link is missing from homepage.")
if "2410.18593" not in preprints:
    raise SystemExit("Expected arXiv preprint is missing.")
for placeholder in ("Red Brick University", "yourorcidurl", "none@example.org"):
    if placeholder in home:
        raise SystemExit(f"Upstream placeholder still visible: {placeholder}")
if "author__avatar" in home:
    raise SystemExit("Unwanted/unverified avatar is still rendered.")

print("Pantheon site smoke check passed: 9 pages, CSS, routes, ORCID, preprint.")
