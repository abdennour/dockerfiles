# FROM perl:5-slim
ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as alpine-perl

RUN apk --no-cache --update add perl
COPY entrypoint.sh /usr/bin/envsubst
RUN chmod +x /usr/bin/envsubst

ENTRYPOINT [ "/usr/bin/envsubst" ]