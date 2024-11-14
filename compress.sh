mkdir -p "$1"
cp -r src/images src/layout src/pages src/partials "$1/"
zip -r "$1.zip" "$1"
rm -rf "$1"