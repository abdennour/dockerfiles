ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as dotenv-to-js-object
COPY fry /bin/envars-to-js-object
ENTRYPOINT [ "sh", "/bin/envars-to-js-object" ]