build:
	echo "Building..."

dev:
	hugo server --contentDir=./content --disableFastRender --themesDir=./themes --noHTTPCache
