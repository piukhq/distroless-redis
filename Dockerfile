FROM redis:6 as base

RUN mkdir -p /opt/etc && \
    cp -a --parents /usr/local/bin/redis-server /opt && \
    cp /usr/share/zoneinfo/UTC /opt/etc/localtime

FROM gcr.io/distroless/base

COPY --from=base /opt /
ENTRYPOINT [ "redis-server" ]
