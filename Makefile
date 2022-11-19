build:
	echo "Building..."
	hugo --contentDir=./content --themesDir=./themes --buildDrafts --destination=./public --minify

dev:
	hugo server --contentDir=./content --disableFastRender --themesDir=./themes --noHTTPCache
