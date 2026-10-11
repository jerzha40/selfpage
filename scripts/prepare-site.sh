#!/bin/sh
# Merge pinned Academic Pages with this repository's authored site content.
set -eu

MODE="${1:-serve}"
SOURCE="${SELFRES_SOURCE_DIR:-/workspace}"
THEME="${ACADEMIC_PAGES_SOURCE_DIR:-/opt/academic-pages}"
DEST="${SELFRES_OUTPUT_DIR:-/worksite}"

if [ ! -f "$THEME/Gemfile" ] || [ ! -d "$SOURCE/_pages" ] || [ ! -f "$SOURCE/_config_selfres.yml" ]; then
	echo "Missing Academic Pages template or SelfRes content overlay." >&2
	exit 1
fi
if [ "$DEST" = "$SOURCE" ] || [ "$DEST" = "$THEME" ]; then
	echo "Refusing to overwrite a source directory." >&2
	exit 1
fi

mkdir -p "$DEST"
# Fresh generated site; never alter the mounted repository.
rsync -a --delete "$THEME/" "$DEST/"

# Discard upstream sample works and navigation, keeping the licensed theme code.
rm -rf "$DEST/_pages" "$DEST/_portfolio" "$DEST/_publications" \
	"$DEST/_talks" "$DEST/_teaching" "$DEST/_posts" "$DEST/_drafts"
mkdir -p "$DEST/_data" "$DEST/_pages" "$DEST/_portfolio" "$DEST/_publications" \
	"$DEST/_talks" "$DEST/_teaching" "$DEST/_posts" "$DEST/_drafts"
rsync -a "$SOURCE/_pages/" "$DEST/_pages/"
rsync -a "$SOURCE/_portfolio/" "$DEST/_portfolio/"
rsync -a "$SOURCE/_publications/" "$DEST/_publications/"
rsync -a "$SOURCE/_talks/" "$DEST/_talks/"
rsync -a "$SOURCE/_teaching/" "$DEST/_teaching/"
rsync -a "$SOURCE/_posts/" "$DEST/_posts/"
rsync -a "$SOURCE/_drafts/" "$DEST/_drafts/"
# Optional user images, including the future portrait, layer over theme assets.
if [ -d "$SOURCE/images" ]; then
	rsync -a "$SOURCE/images/" "$DEST/images/"
fi
cp "$SOURCE/_data/navigation.yml" "$DEST/_data/navigation.yml"
cp "$SOURCE/_config_selfres.yml" "$DEST/_config_selfres.yml"
cp "$SOURCE/_config_docker.yml" "$DEST/_config_docker.yml"
# Avoid absolute theme URLs in preview: the repo is a GitHub Pages project site.
# Use host-independent internal URLs, not the server's 0.0.0.0 bind address.
cp "$SOURCE/overrides/_includes/base_path" "$DEST/_includes/base_path"
cp "$SOURCE/overrides/_includes/head.html" "$DEST/_includes/head.html"
cp "$SOURCE/overrides/_includes/author-profile.html" "$DEST/_includes/author-profile.html"

# The 2025 standalone index.html exists only in the overlay repository's history.
# Root home is generated from _pages/about.md with permalink: /.
rm -f "$DEST/index.html"

cd "$DEST"
case "$MODE" in
prepare)
	echo "Prepared Academic Pages overlay at $DEST"
	;;
build)
	exec bundle exec jekyll build --strict_front_matter \
		--config _config.yml,_config_selfres.yml
	;;
serve)
	# Sync changed Markdown/YAML from the mounted repository while Jekyll watches
	# the generated workspace. Refresh browser when content changes.
	(
		while sleep 2; do
			# Compare file contents, not only timestamps: reliable with Docker Desktop / NTFS.
			rsync -a --checksum --delete "$SOURCE/_pages/" "$DEST/_pages/"
			rsync -a --checksum --delete "$SOURCE/_portfolio/" "$DEST/_portfolio/"
			rsync -a --checksum --delete "$SOURCE/_publications/" "$DEST/_publications/"
			rsync -a --checksum --delete "$SOURCE/_talks/" "$DEST/_talks/"
			rsync -a --checksum --delete "$SOURCE/_teaching/" "$DEST/_teaching/"
			rsync -a --checksum --delete "$SOURCE/_posts/" "$DEST/_posts/"
			rsync -a --checksum --delete "$SOURCE/_drafts/" "$DEST/_drafts/"
			if [ -d "$SOURCE/images" ]; then
				rsync -a --checksum "$SOURCE/images/" "$DEST/images/"
			fi
			rsync -a --checksum "$SOURCE/_data/navigation.yml" "$DEST/_data/navigation.yml"
			# Configuration is loaded by Jekyll only at server start.
			# To see config edits, use: docker compose restart selfpage
		done
	) &
	exec bundle exec jekyll serve --host 0.0.0.0 --port 4000 \
		--watch --force_polling \
		--config _config.yml,_config_selfres.yml,_config_docker.yml
	;;
*)
	echo "Usage: prepare-selfres-site [prepare|build|serve]" >&2
	exit 2
	;;
esac
