FROM python:3.6-alpine3.10 as eksctl


ARG AWS_CLI_VERSION
ARG EKSCTL_VERSION
ENV AWS_CLI_VERSION=${AWS_CLI_VERSION} \
    EKSCTL_VERSION=${EKSCTL_VERSION}
RUN apk -uv add --no-cache groff jq less curl bash && \
    pip install --no-cache-dir awscli==$AWS_CLI_VERSION

RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/${EKSCTL_VERSION}/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp \
  && chmod +x /tmp/eksctl \
  && mv /tmp/eksctl /usr/local/bin

VOLUME /root/.aws
WORKDIR /aws

