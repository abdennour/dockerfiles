# FROM perl:5-slim
ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as alpine-perl

RUN apk --no-cache --update add bash perl
COPY entrypoint.sh /usr/bin/envsubt
ENTRYPOINT [ "bash", "/usr/bin/envsubt" ]