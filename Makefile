build:
	echo "Building..."
	hugo --contentDir=./content --themesDir=./themes --buildDrafts --destination=./public --minify $(HUGO_ARGS)

dev:
	hugo server --contentDir=./content --disableFastRender --themesDir=./themes --noHTTPCache
