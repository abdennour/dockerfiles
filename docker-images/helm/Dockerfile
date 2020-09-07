FROM alpine:3.11 as helm
ARG HELM_VERSION
# ENV BASE_URL="https://storage.googleapis.com/kubernetes-helm"
ENV BASE_URL="https://get.helm.sh" \
    TAR_FILE="helm-v${HELM_VERSION}-linux-amd64.tar.gz"
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN apk add --update --no-cache curl git ca-certificates && \
    curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    apk del curl && \
    rm -f /var/cache/apk/*
COPY fry /bin/helm-entrypoint
ENTRYPOINT ["sh", "/bin/helm-entrypoint" ]
CMD ["--help"]

FROM helm as helm-aws