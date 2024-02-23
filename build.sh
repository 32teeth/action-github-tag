#!/bin/bash

version=0.0.0

update() {
    local manifest="package.json"
    version=$(jq -r '.version' "$manifest") # Extract current version from package.json

    IFS='.' read -r major minor patch <<< "${version#v}" # Split version into components

    if ((patch < 9)); then
        ((patch++))
    elif ((minor < 9)); then
        ((minor++))
        patch=0
    else
        ((major++))
        minor=0
        patch=0
    fi

    version="v$major.$minor.$patch" # Construct new version string

    echo "Updating to version $version"

    jq ".version = \"$version\"" "$manifest" > temp.json && mv temp.json "$manifest" # Update version in package.json
}

update

git add .
git commit -am "Update to version: $version"
git tag $version -m "Update to version: $version"
git push origin $version
git push
gh release create $version --generate-notes

