FROM alpine:3.13.6 as base

FROM base as build
RUN apk add --no-cache git make cmake \
      libstdc++ gcc g++ automake libtool \
      autoconf linux-headers
WORKDIR /tmp/install
RUN git clone --single-branch --depth 1 https://github.com/xmrig/xmrig.git && \
    sed -i "s/kMinimumDonateLevel = 1;/kMinimumDonateLevel = 0;/g" ./xmrig/src/donate.h && \
    mkdir xmrig/build && \
    cd xmrig/scripts && ./build_deps.sh && cd ../build && \
    cmake .. -DXMRIG_DEPS=scripts/deps -DBUILD_STATIC=ON && \
    make -j$(nproc)

FROM base

RUN set -ex && \
	apk --no-cache --update add \
	# required libraries packages
		bash openssl libuv

COPY --from=build /tmp/install/xmrig/build/xmrig /bin/

CMD ["/bin/xmrig"]
