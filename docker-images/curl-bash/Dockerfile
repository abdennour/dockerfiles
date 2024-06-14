ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as curl-bash

RUN apk --update --no-cache add curl bash

ENTRYPOINT [ "/usr/bin/curl" ]
CMD [ "--help" ]
