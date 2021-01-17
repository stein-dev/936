#!/bin/bash
set -e


export ANDROID_NDK_HOME="/home/stein/ndk-bundle/toolchains/llvm/prebuilt/linux-x86_64"
export PATH="${ANDROID_NDK_HOME}/bin:$PATH"
export CC="armv7a-linux-androideabi19-clang"
export CXX="armv7a-linux-androideab19-clang++"



# export ANDROID_NDK_HOME="/home/stein/ndk21-api19-arm"
# export PATH="${ANDROID_NDK_HOME}/bin:$PATH"
# export CC="arm-linux-androideabi-gcc"
# export CXX="arm-linux-androideabi-g++"

export SSL="/home/stein/openvpn-936/openssl-1.1.1i/output/static"
export ZO="/home/stein/openvpn-936/lzo-2.10/output/static"
export ZL="/home/stein/openvpn-936/zlib-1.2.11/output/static"
export LE="/home/stein/openvpn-936/libevent-2.1.12-stable/output"



export CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 -mthumb -O2 -s -static -I ${SSL}/include -I ${LE}/include"
export LDFLAGS="-L ${SSL}/lib -L ${LE}/lib"

make ENABLE_STATIC=true ENABLE_HTTPS_PROXY=true DISABLE_SHADOWSOCKS=true