#!/bin/bash -x

export ARCH=`uname -m`
export XMRIG_VERSION="v6.15.3"
export XMRIG_URL="https://github.com/xmrig/xmrig.git"
export XMRIG_BUILD_ARGS="-DXMRIG_DEPS=scripts/deps -DBUILD_STATIC=ON"

if [[ "$ARCH" == *"aarch64"* ]]; then 
  git clone --single-branch --depth 1 --branch=$XMRIG_VERSION $XMRIG_URL
  mkdir ./xmrig/build 
  sed -i "s/kDefaultDonateLevel = 1;/kDefaultDonateLevel = 0;/g" ./xmrig/src/donate.h 
  sed -i "s/kMinimumDonateLevel = 1;/kMinimumDonateLevel = 0;/g" ./xmrig/src/donate.h 
  XMRIG_BUILD_ARGS="$XMRIG_BUILD_ARGS -DWITH_HWLOC=OFF -DWITH_OPENCL=OFF -DCMAKE_SYSTEM_PROCESSOR=arm"
  cd xmrig/scripts && ./build_deps.sh && cd ../build 
  cmake .. $XMRIG_BUILD_ARGS && \
  make -j$(nproc)
else 
  git clone --single-branch --depth 1 --branch=$XMRIG_VERSION $XMRIG_URL
  mkdir ./xmrig/build 
  sed -i "s/kDefaultDonateLevel = 1;/kDefaultDonateLevel = 0;/g" ./xmrig/src/donate.h 
  sed -i "s/kMinimumDonateLevel = 1;/kMinimumDonateLevel = 0;/g" ./xmrig/src/donate.h 
  cd xmrig/scripts && ./build_deps.sh && cd ../build 
  cmake .. $XMRIG_BUILD_ARGS && \
  make -j$(nproc)
fi
