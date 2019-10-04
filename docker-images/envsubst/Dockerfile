# FROM perl:5-slim
FROM alpine:edge as alpine-perl

RUN apk --no-cache --update add bash perl
COPY entrypoint.sh /usr/bin/envsubt
ENTRYPOINT [ "bash", "/usr/bin/envsubt" ]