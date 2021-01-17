#!/bin/bash
set -e


# export ANDROID_NDK_HOME="/home/stein/ndk-bundle/toolchains/llvm/prebuilt/linux-x86_64"
# export CC="armv7a-linux-androideabi30-clang"
# export CXX="armv7a-linux-androideabi30-clang++"



export ANDROID_NDK_HOME="/home/stein/ndk21-api19-arm"
export PATH="${ANDROID_NDK_HOME}/bin:$PATH"
export CC="arm-linux-androideabi-gcc"
export CXX="arm-linux-androideabi-g++"

export SSL="/home/stein/openvpn-936/openssl-1.1.1i/output/static"
export PKG_CONFIG_PATH="${SSL}/lib/pkgconfig"


export CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 -mthumb -O2 -s"

mkdir -p output/ || true

./configure --host=arm-linux-gnueabi --prefix="${PWD}/output"

make
make install