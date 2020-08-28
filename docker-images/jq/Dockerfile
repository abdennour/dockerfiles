ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as jq

RUN apk --update --no-cache add jq

ENTRYPOINT [ "jq" ]
CMD [ "--help" ]
