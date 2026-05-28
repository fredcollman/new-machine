#!/usr/bin/env sh

package=$(pnpm list -r --depth -1 --json | jq -r '.[].name' | fzf --query "$1" --select-1)

if [ -z "$package" ]; then
  echo "no package selected"
  exit 1
fi

pnpm add --workspace "${package}@^"
