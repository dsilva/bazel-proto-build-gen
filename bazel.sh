#!/bin/bash

set -e

HERE=$(dirname "$0")

VERSION="2.0.0"

if [[ "$OSTYPE" == "darwin"* ]]; then
  platform=darwin
elif [[ "$OSTYPE" == "linux"* ]]; then
  platform=linux
fi

BAZEL="$HERE"/opt/bazel/bazel-$VERSION-$platform-x86_64

if [ ! -e "$BAZEL" ]; then
  URL="https://github.com/bazelbuild/bazel/releases/download/$VERSION/bazel-$VERSION-$platform-x86_64"

  mkdir -p "$HERE"/opt/bazel
  curl -o "$BAZEL" -L "$URL"
  chmod a+x "$BAZEL"
fi

exec "$BAZEL" "$@"
