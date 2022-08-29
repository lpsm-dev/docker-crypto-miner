FROM alpine:3.16 as build
ARG XMRIG_VERSION=v6.15.3
ARG XMRIG_URL="https://github.com/xmrig/xmrig.git"
ARG XMRIG_BUILD_ARGS="-DXMRIG_DEPS=scripts/deps -DBUILD_STATIC=ON -DWITH_HWLOC=OFF -DCMAKE_VERBOSE_MAKEFILE=ON -DWITH_OPENCL=OFF -DCMAKE_SYSTEM_NAME=Linux"
RUN set -ex && \
      apk add --no-cache git make cmake \
        libstdc++ gcc g++ automake libtool libuv-dev \
        autoconf linux-headers openssl-dev hwloc-dev
WORKDIR /tmp/install
COPY [ "./src/build.sh", "." ]
RUN chmod +x ./build.sh && ./build.sh

FROM alpine:3.16
RUN set -ex && \
      apk add --no-cache bash screen cpulimit && \
      addgroup --gid 1000 xmrig && \
      adduser --uid 1000 -H -D -G xmrig -h /bin/xmrig xmrig
COPY --from=build --chown=xmrig:xmrig [ "/tmp/install/xmrig/build/xmrig", "/bin" ]
WORKDIR /usr/src/mining
COPY --chown=xmrig:xmrig [ "./src/xmrig", "." ]
RUN set -ex; \
  chown -R xmrig:xmrig /usr/src/mining; \
  chmod +x entrypoint.sh
USER xmrig

CMD [ "bash", "/usr/src/mining/entrypoint.sh" ]
