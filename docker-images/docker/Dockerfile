ARG DOCKER
FROM docker:${DOCKER} as docker

RUN apk --update --no-cache add bash

FROM docker as docker-aws


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

