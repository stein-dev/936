#!/bin/bash
set -e

export ANDROID_NDK_HOME="/home/stein/ndk-bundle"
export PATH="${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH"
export CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 -mthumb -O3 -Wall -s"
export CXXFLAGS="$CFLAGS"

mkdir -p output/shared/ || true

make clean

./Configure android-arm -fPIC -fstack-protector-all -march=armv7-a -D__ANDROID_API__=19 -D_FILE_OFFSET_BITS=32 -no-integrated-as \
 no-idea no-camellia \
 no-seed no-bf no-cast no-rc2 no-rc4 no-rc5 no-md2 \
 no-md4 no-ecdh no-sock no-ssl3 \
 no-dsa no-dh no-ec no-ecdsa no-tls1 \
 no-rfc3779 no-whirlpool no-srp \
 no-mdc2 no-ecdh no-engine \
 no-srtp shared \
--prefix="${PWD}/output/shared" "$CFLAGS"

make depend
make "$@"
make INSTALL_PREFIX="${PWD}/output/shared" install