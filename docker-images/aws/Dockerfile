FROM python:3.6-alpine3.10 as aws


LABEL maintainer="Abdennour Toumi <http://in.abdennoor.com>" \
      tn.kubernetes.docker.dockerfile="docker-images/aws/Dockerfile" \
      tn.kubernetes.license=MIT \
      tn.kubernetes.name="aws-cli" \
      tn.kubernetes.url=https://github.com/abdennour/bakery-images \
      tn.kubernetes.vcs-url="https://github.com/abdennour/bakery-images.git" \
      tn.kubernetes.vcs-type=Git

ARG AWS_CLI_VERSION

ENV AWS_CLI_VERSION=${AWS_CLI_VERSION}
RUN apk -uv add --no-cache groff jq less && \
    pip install --no-cache-dir awscli==$AWS_CLI_VERSION

WORKDIR /aws

CMD sh

LABEL tn.kubernetes.build-date=$BUILD_DATE \
      tn.kubernetes.version=$VERSION \
      tn.kubernetes.vcs-ref=$VCS_REF