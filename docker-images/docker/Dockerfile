ARG DOCKER
FROM docker:${DOCKER} as docker


LABEL maintainer="Abdennour Toumi <http://in.abdennoor.com>" \
      tn.kubernetes.docker.dockerfile="docker-images/docker/Dockerfile" \
      tn.kubernetes.license=MIT \
      tn.kubernetes.name="docker" \
      tn.kubernetes.url=https://github.com/abdennour/bakery-images \
      tn.kubernetes.vcs-url="https://github.com/abdennour/bakery-images.git" \
      tn.kubernetes.vcs-type=Git

RUN apk --update --no-cache add bash

LABEL tn.kubernetes.build-date=$BUILD_DATE \
      tn.kubernetes.version=$VERSION \
      tn.kubernetes.vcs-ref=$VCS_REF


FROM docker as docker-aws

LABEL tn.kubernetes.name="docker-aws"

ARG AWS_CLI_VERSION
ENV AWS_CLI_VERSION=${AWS_CLI_VERSION}
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==$AWS_CLI_VERSION s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
