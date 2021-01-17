#!/bin/bash
set -e

export ANDROID_NDK_HOME="/home/stein/ndk-bundle"
export PATH="${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH"
export CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 -mthumb -O3 -Wall -s"
export CXXFLAGS="$CFLAGS"

mkdir -p output/static/ || true

make clean

./Configure android-arm -fPIC -march=armv7-a -D__ANDROID_API__=19 -D_FILE_OFFSET_BITS=32 -no-integrated-as \
 no-shared \
--prefix="${PWD}/output/static" "$CFLAGS"

make depend
make "$@"
make INSTALL_PREFIX="${PWD}/output/static" install