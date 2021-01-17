#!/bin/bash
set -e


export ANDROID_NDK_HOME="/home/stein/ndk-bundle/toolchains/llvm/prebuilt/linux-x86_64"
export PATH="${ANDROID_NDK_HOME}/bin:$PATH"
export CC="armv7a-linux-androideabi21-clang"
export CXX="armv7a-linux-androideabi21-clang++"



# export ANDROID_NDK_HOME="/home/stein/ndk21-api19-arm"
# export PATH="${ANDROID_NDK_HOME}/bin:$PATH"
# export CC="arm-linux-androideabi-gcc"
# export CXX="arm-linux-androideabi-g++"
# export LD=$CC



export CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 -mthumb -O2 -s -static"

./configure ac_cv_func_malloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes --host=arm-linux-gnueabi --target=arm-linux-androideabi

make