#!/bin/bash

set -euxo pipefail

echo "Creating release..."
curl -v -i -X POST \
    -H "Content-Type:application/json" \
    -H "Authorization: token $GITHUB_TOKEN" \
    https://api.github.com/repos/cozy/cozy-ghost-theme/releases \
    -d "{\"tag_name\":\"$TRAVIS_TAG\",\"target_commitish\": \"master\",\"name\": \"$TRAVIS_TAG\",\"body\": \"\",\"draft\": false,\"prerelease\": false}" > /tmp/release.json
export release_id=$(cat /tmp/release.json | jq '.[0].id')
echo "Release $release_id has been created"

echo "Uploading dist/cozy.zip"
export file="dist/cozy.zip"
curl \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Content-Type: $(file -b --mime-type $file)" \
    --data-binary @$file \
    "https://uploads.github.com/repos/cozy/cozy-ghost-theme/releases/$release_id/assets?name=$(basename $file)"
echo "Done !"
