# https://storage.googleapis.com/kubernetes-release/release/stable.txt
ARG AWS_CLI_VERSION
FROM alpine:edge as kubectl

RUN apk add --update ca-certificates bash gnupg jq \
  && apk add --update -t deps curl gettext \
  && rm -rf /var/cache/apk/* 
ARG KUBECTL_VERSION
ENV KUBECTL_VERSION=${KUBECTL_VERSION}
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl
ENTRYPOINT [ "kubectl" ]

FROM amazon/aws-cli:${AWS_CLI_VERSION} as kubectl-aws
COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin/
ENTRYPOINT [ "/usr/local/bin/kubectl" ]

# FROM kubectl as kubectl-helm
# ARG HELM_VERSION
# # ENV BASE_URL="https://storage.googleapis.com/kubernetes-helm"
# ENV BASE_URL="https://get.helm.sh"
# ENV TAR_FILE="helm-v${HELM_VERSION}-linux-amd64.tar.gz"

# RUN apk add --update --no-cache curl git ca-certificates && \
#     curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
#     mv linux-amd64/helm /usr/bin/helm && \
#     chmod +x /usr/bin/helm && \
#     rm -rf linux-amd64 && \
#     apk del curl && \
#     rm -f /var/cache/apk/*

# FROM kubectl-aws as kubectl-aws-helm
# ARG HELM_VERSION
# # ENV BASE_URL="https://storage.googleapis.com/kubernetes-helm"
# ENV BASE_URL="https://get.helm.sh"
# ENV TAR_FILE="helm-v${HELM_VERSION}-linux-amd64.tar.gz"

# RUN apk add --update --no-cache curl git ca-certificates && \
#     curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
#     mv linux-amd64/helm /usr/bin/helm && \
#     chmod +x /usr/bin/helm && \
#     rm -rf linux-amd64 && \
#     apk del curl && \
#     rm -f /var/cache/apk/*

# CMD ["--help"]
