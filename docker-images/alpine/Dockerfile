ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as alpine-ssl
RUN apk add --update --no-cache openssl ca-certificates
RUN sed -i 's@http://@https://@g' /etc/apk/repositories


FROM alpine-ssl as alpine-nodejs-utils
RUN apk add --update --no-cache openssh-client git nodejs skopeo
