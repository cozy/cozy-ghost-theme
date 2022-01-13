#!/bin/bash

set -euxo pipefail

echo "Creating release..."
curl https://api.github.com/repos/cozy/cozy-ghost-theme/releases \
    -s \
    -H "Content-Type:application/json" \
    -H "Authorization: token $GITHUB_TOKEN" \
    -d "{\"tag_name\":\"$TRAVIS_TAG\",\"target_commitish\": \"master\",\"name\": \"$TRAVIS_TAG\",\"body\": \"\",\"draft\": false,\"prerelease\": false}" > /tmp/release.json
release_id=$(cat /tmp/release.json | jq '.id')
if [ -z "${release_id}" -o "${release_id}" = "null" ]; then
    echo "Unable to get release ID"
    exit 1
fi
echo "Release $release_id has been created"

echo "Uploading dist/cozy.zip"
file="dist/cozy.zip"
file_target="cozy-${TRAVIS_TAG}.zip"
curl "https://uploads.github.com/repos/cozy/cozy-ghost-theme/releases/${release_id}/assets?name=${file_target}" \
    -f \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Content-Type: $(file -b --mime-type $file)" \
    --data-binary @$file
echo "Done !"
