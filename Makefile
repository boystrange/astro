
NULL =

IMAGES = \
	2024-M24 \
	2024-M46 \
	2024-bodes-galaxy \
	2024-eagle \
	2024-helix \
	2024-horsehead \
	2024-leo-triplet \
	2024-pinwheel \
	2024-pleiades \
	2024-rosette \
	2024-western-veil \
	2025-M35 \
	2025-M44 \
	2025-markarian \
	2025-moon-mars \
	2025-seagull-nebula \
	M42 \
	M67 \
	$(NULL)

THUMBNAILS = $(IMAGES:%=%.png)

all: $(THUMBNAILS)
	bundle exec jekyll serve --drafts

%.png: %/final.png
	sips --resampleHeight 256 -o "$@" "$<"

