#!/bin/bash
set -e


export ANDROID_NDK_HOME="/home/stein/ndk-bundle/toolchains/llvm/prebuilt/linux-x86_64"
export CC="armv7a-linux-androideabi21-clang"
export CXX="armv7a-linux-androideabi21-clang++"



# export ANDROID_NDK_HOME="/home/stein/ndk21-api19-arm"
# export CC="arm-linux-androideabi-gcc"
# export CXX="arm-linux-androideabi-g++"


export PATH="${ANDROID_NDK_HOME}/bin:$PATH"
export CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 -mthumb -O2 -s -static"


make LIBS="-all-static"