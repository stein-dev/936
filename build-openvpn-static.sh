#!/bin/bash
set -e

# export ANDROID_NDK_HOME="/home/stein/gcc-linaro"
# export PATH="${ANDROID_NDK_HOME}/bin:$PATH"
# export CC="arm-linux-gnueabi-gcc"

export ANDROID_NDK_HOME="/home/stein/ndk21-api19-arm"
# export PATH="${ANDROID_NDK_HOME}/bin:$PATH"
# export CC="arm-linux-androideabi-gcc"

export SSL="/home/stein/openvpn-936/openssl-1.1.1i/output/static"
export ZO="/home/stein/openvpn-936/lzo-2.10/output/static"

# export ANDROID_NDK_HOME="/mnt/684A205D4A202A70/Users/Stein/ndk16-api19"
export PATH="${ANDROID_NDK_HOME}/bin:$PATH"
export CC="arm-linux-androideabi-gcc"
export CXX="arm-linux-androideabi-g++"
export CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 -mthumb -O2 -s"
export PKG_CONFIG_PATH="${SSL}/lib/pkgconfig"


mkdir -p output/static/ || true

make clean

./configure --prefix="${PWD}/output/static" --target=arm-linux-androideabi --host=arm-linux-gnueabi --disable-debug --disable-plugin-auth-pam \
 --disable-multihome --disable-port-share --with-crypto-library=openssl --disable-plugins \
  --enable-small --disable-systemd --enable-static --disable-shared \
OPENSSL_SSL_LIBS="-L${SSL}/lib -lssl" OPENSSL_SSL_CFLAGS="-I${SSL}/include" \
OPENSSL_CRYPTO_LIBS="-L${SSL}/lib -lcrypto" OPENSSL_CRYPTO_CFLAGS="-I${SSL}/include" \
LZO_LIBS="-L${ZO}/lib -llzo2" LZO_CFLAGS="-I${ZO}/include"  \
--enable-iproute2 IPROUTE=/system/bin/ip IFCONFIG=/system/bin/ifconfig ROUTE=/system/bin/route NETSTAT=/system/bin/netstat
#make "$@"
make LIBS="-all-static"
make install