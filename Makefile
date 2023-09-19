build:
	echo "Building..."
	hugo --contentDir=./content --themesDir=./themes --buildDrafts --destination=./public --minify $(HUGO_ARGS)

dev:
	echo "Starting development server..."
	hugo server --contentDir=./content --disableFastRender --themesDir=./themes --noHTTPCache --bind=0.0.0.0 --port=1313  $(HUGO_ARGS)
