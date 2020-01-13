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
#----intermediate-------
FROM alpine:edge as downloads
WORKDIR /downloads
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk &&\
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-bin-2.30-r0.apk &&\
    wget https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
ARG DOCKER_COMPOSE_VERSION
ENV DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}
RUN wget https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64
#------

FROM docker as docker-compose
WORKDIR /opt/tmp
RUN apk --update --no-cache add ca-certificates
COPY --from=downloads /downloads/. .
RUN mv sgerrand.rsa.pub /etc/apk/keys/sgerrand.rsa.pub &&\ 
    apk add glibc-2.30-r0.apk glibc-bin-2.30-r0.apk && rm -rf *.apk &&\
    mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose &&\
    chmod a+x /usr/local/bin/docker-compose

FROM docker-compose as docker-compose-aws
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
