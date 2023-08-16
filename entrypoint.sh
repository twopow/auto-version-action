#!/bin/bash

set -euf

echo "version=$(git describe --tags --always 2>/dev/null || echo -n 'unknown')" >>"$GITHUB_OUTPUT"

{
  echo "shortlog<<GHEOF"
  git shortlog "$(git describe --tags --always --abbrev=0 2>/dev/null)"..HEAD -e || echo -n 'unknown'
  echo "GHEOF"
} >>"$GITHUB_OUTPUT"
