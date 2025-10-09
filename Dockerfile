# Stage 1: Build the XMRig binary
FROM public.ecr.aws/docker/library/alpine:3.22.2 AS builder

ARG XMRIG_VERSION=v6.22.0
ARG XMRIG_URL="https://github.com/xmrig/xmrig.git"
ARG XMRIG_BUILD_ARGS="-DXMRIG_DEPS=scripts/deps -DBUILD_STATIC=ON -DWITH_HWLOC=OFF"

RUN apk add --no-cache git make cmake libstdc++ gcc g++ automake libtool autoconf linux-headers

WORKDIR /tmp/install

RUN git clone --single-branch --depth 1 --branch="$XMRIG_VERSION" "$XMRIG_URL" \
    && cd xmrig \
    && mkdir -p build \
    && sed -i 's/kDefaultDonateLevel = 1;/kDefaultDonateLevel = 0;/; s/kMinimumDonateLevel = 1;/kMinimumDonateLevel = 0;/;' src/donate.h \
    && cd scripts \
    && ./build_deps.sh \
    && cd ../build \
    && cmake .. $XMRIG_BUILD_ARGS \
    && make -j$(nproc)

# Stage 2: Copy XMRig binary into a smaller image
FROM public.ecr.aws/docker/library/alpine:3.22.2

RUN apk add --no-cache bash screen cpulimit \
    && addgroup --gid 1000 xmrig \
    && adduser --uid 1000 -H -D -G xmrig -h /bin/xmrig xmrig

COPY --from=builder --chown=xmrig:xmrig [ "/tmp/install/xmrig/build/xmrig", "/bin" ]

WORKDIR /usr/src/mining

COPY [ "./src/xmrig", "." ]

RUN chown -R xmrig:xmrig /usr/src/mining \
    && chmod +x entrypoint.sh

USER xmrig

CMD [ "bash", "/usr/src/mining/entrypoint.sh" ]
