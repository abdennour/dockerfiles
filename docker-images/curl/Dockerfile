ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as curl

RUN apk --update --no-cache add curl

ENTRYPOINT [ "/usr/bin/curl" ]
CMD [ "--help" ]

FROM curl as curl-bash
RUN apk --update --no-cache add bash