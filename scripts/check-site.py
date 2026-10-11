#!/usr/bin/env python3
"""Build-artifact smoke check for the public SelfRes academic site.

Standard library only; runs after the Jekyll build in GitHub Actions.
"""

import re
import sys
from pathlib import Path

root = Path(sys.argv[1] if len(sys.argv) > 1 else "_site")
routes = (
    "index.html",
    "research/index.html",
    "publications/index.html",
    "publication/differential-informed-auto-encoder/index.html",
    "year-archive/index.html",
    "talks/index.html",
    "teaching/index.html",
    "portfolio/index.html",
    "portfolio/firstattempt/index.html",
    "portfolio/scattering-lab/index.html",
    "story/index.html",
    "cv/index.html",
    "contact/index.html",
    "assets/css/main.css",
    "images/profile.png",
)
missing = [p for p in routes if not (root / p).is_file()]
if missing:
    raise SystemExit("Missing generated site files:\n" + "\n".join(missing))

css = (root / "assets/css/main.css").read_text(encoding="utf-8")
if len(css) < 1000:
    raise SystemExit("Site stylesheet is unexpectedly empty.")

home = (root / "index.html").read_text(encoding="utf-8")
preprints = (root / "publications/index.html").read_text(encoding="utf-8")
for route in (
    "research",
    "publications",
    "portfolio",
    "year-archive",
    "talks",
    "teaching",
    "story",
    "cv",
    "contact",
):
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
if 'class="author__avatar"' not in home:
    raise SystemExit("Academic Pages avatar slot is missing.")
if 'src="/selfpage/images/profile.png"' not in home:
    raise SystemExit(
        "Avatar src must exactly match the bundled image URL; check Liquid whitespace."
    )
if 'href="https://bsky.app/profile/jerzha40.bsky.social"' not in home:
    raise SystemExit("Bluesky profile URL is missing or malformed.")
if 'href="https://www.linkedin.com/in/jinrui-zhang-707025341"' not in home:
    raise SystemExit("LinkedIn profile URL is missing or malformed.")
if "arXiv author profile" not in home or not re.search(r"\(to\s+add\)", home):
    raise SystemExit(
        "Unconfigured arXiv author profile slot should remain a nonlinked placeholder."
    )
if 'href="https://scholar.google.com/citations?user=QpBRjl8AAAAJ' not in home:
    raise SystemExit("Configured Google Scholar profile link is missing.")
if "http://0.0.0.0:4000/" in home:
    raise SystemExit("Internal links incorrectly use Docker's bind address.")
if 'href="/selfpage/research/"' not in home:
    raise SystemExit("Local/navigation links are not host-independent.")


print(
    f"Pantheon site smoke check passed: {len(routes) - 1} pages, CSS, routes, ORCID, preprint."
)
