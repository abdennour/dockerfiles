ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as curl-zip

RUN apk --update --no-cache add curl zip

ENTRYPOINT [ "/usr/bin/curl" ]
CMD [ "--help" ]
