ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as kind-cli
WORKDIR /usr/local/bin
ARG KIND_CLI_VERSION
ENV KIND_CLI_VERSION=${KIND_CLI_VERSION}
RUN wget "https://github.com/kubernetes-sigs/kind/releases/download/${KIND_CLI_VERSION}/kind-linux-amd64" \
   && mv kind-linux-amd64 kind \
   && chmod +x kind

ENTRYPOINT [ "/usr/local/bin/kind" ]