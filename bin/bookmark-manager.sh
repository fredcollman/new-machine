#!/usr/bin/env sh
BOOKMARK_DIR=~/bookmarks
bookmark=$1
shift

cd $BOOKMARK_DIR

case "${bp}" in
  ''|'0')
    EXTRA_VARS="--profile-directory=Default"
    ;;
  *[!0-9]*)
    EXTRA_VARS="--profile-directory=${bp}"
    ;;
  *)
    EXTRA_VARS="--profile-directory='Profile $bp'"
    ;;
esac

if [ -x "./$bookmark" ]; then
  "./$bookmark" "$@" | xargs sensible-browser "${EXTRA_VARS}"
else
  echo "No such bookmark $bookmark" && exit 1
fi
