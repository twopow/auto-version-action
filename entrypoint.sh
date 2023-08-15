#!/bin/bash

set -euf

echo "version=$(git describe --tags --always 2>/dev/null || echo -n 'unknown')" >>"$GITHUB_OUTPUT"
echo "shortlog=$(git shortlog "$(git describe --tags --always --abbrev=0 2>/dev/null)"..HEAD -e || echo -n 'unknown')" >>"$GITHUB_OUTPUT"
