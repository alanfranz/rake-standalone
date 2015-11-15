#!/bin/bash
set -e
TARGET=$(readlink -f .)
cd "${0%/*}"
rm -f $TARGET/env.list.tmp
cp env.list $TARGET/env.list.tmp
echo BUILD_NUMBER="${BUILD_NUMBER:-0}" >> $TARGET/env.list.tmp
echo GIT_COMMIT="${GIT_COMMIT:-$(git rev-parse HEAD)}" >> $TARGET/env.list.tmp
