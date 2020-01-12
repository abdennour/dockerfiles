FROM alpine:edge as downloads
WORKDIR /downloads
ARG EKSCTL_VERSION
ENV EKSCTL_VERSION=${EKSCTL_VERSION}
RUN apk -uv add --no-cache wget tar
RUN wget "https://github.com/weaveworks/eksctl/releases/download/${EKSCTL_VERSION}/eksctl_$(uname -s)_amd64.tar.gz" \
   && tar -zxvf "eksctl_$(uname -s)_amd64.tar.gz" \
   && chmod +x eksctl

FROM python:3.6-alpine3.10 as eksctl

VOLUME /root/.aws
ARG AWS_CLI_VERSION
ARG EKSCTL_VERSION
ENV AWS_CLI_VERSION=${AWS_CLI_VERSION} \
    EKSCTL_VERSION=${EKSCTL_VERSION}
RUN apk -uv add --no-cache groff jq less bash && \
    pip install --no-cache-dir awscli==$AWS_CLI_VERSION

COPY --from=downloads  /downloads/eksctl /usr/local/bin

ENTRYPOINT [ "/usr/local/bin/eksctl" ]

FROM eksctl as eksctl-kubectl

RUN apk add --update ca-certificates bash gnupg jq \
  && apk add --update -t deps curl gettext \
  && rm -rf /var/cache/apk/* 
ARG KUBECTL_VERSION
ENV KUBECTL_VERSION=${KUBECTL_VERSION}
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl
ENTRYPOINT [ "/usr/local/bin/kubectl" ]