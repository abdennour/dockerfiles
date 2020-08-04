FROM python:3.6-alpine3.10 as aws

ARG AWS_CLI_VERSION

ENV AWS_CLI_VERSION=${AWS_CLI_VERSION}
RUN apk -uv add --no-cache groff jq less && \
    pip install --no-cache-dir awscli==$AWS_CLI_VERSION

WORKDIR /aws
COPY fry /fry-aws-helm
ENTRYPOINT [ "/bin/sh", "/fry-aws-helm" ]

FROM aws as aws-helm
ARG HELM_VERSION
# ENV BASE_URL="https://storage.googleapis.com/kubernetes-helm"
ENV BASE_URL="https://get.helm.sh" \
    TAR_FILE="helm-v${HELM_VERSION}-linux-amd64.tar.gz" \
    KUBECONFIG=/root/.kube/config
RUN apk add --update --no-cache curl git ca-certificates && \
    curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    apk del curl && \
    rm -f /var/cache/apk/*
