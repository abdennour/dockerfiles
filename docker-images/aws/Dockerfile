FROM python:3.6-alpine3.10 as aws

ARG AWS_CLI_VERSION

ENV AWS_CLI_VERSION=${AWS_CLI_VERSION}
RUN apk -uv add --no-cache groff jq less && \
    pip install --no-cache-dir awscli==$AWS_CLI_VERSION

WORKDIR /aws

ENTRYPOINT [ "aws" ]