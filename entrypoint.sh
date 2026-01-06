#!/bin/bash

set -euf

GIT_TAG=$(git describe --tags --always 2>/dev/null);
GIT_TAG=${GIT_TAG:-'unknown'};
echo "tag=${GIT_TAG}" >>"$GITHUB_OUTPUT";

GIT_SHORTSHA=$(git rev-parse --short HEAD 2>/dev/null);
GIT_SHORTSHA=${GIT_SHORTSHA:-'unknown'};
echo "shortsha=${GIT_SHORTSHA}" >>"$GITHUB_OUTPUT";

# if VERSION is not set, use the git tag
VERSION=${VERSION:-${GIT_TAG}};
VERSION=$(echo -n "${VERSION}" | sed 's/[^0-9a-zA-Z_\-\.]/-/g');

echo "version=${VERSION}" >>"$GITHUB_OUTPUT"
echo -n "${VERSION}" > version.txt;

{
  echo "shortlog<<GHEOF"
  git shortlog "$(git describe --tags --always --abbrev=0 2>/dev/null)"..HEAD -e || echo -n 'unknown'
  echo "GHEOF"
} >>"$GITHUB_OUTPUT"
