ARG DOCKER_VERSION

FROM docker:${DOCKER_VERSION} as docker-buildx
# Credits to https://github.com/docker/buildx/issues/132#issuecomment-695768757
ARG BUILDX_VERSION
ENV BUILDX_VERSION=${BUILDX_VERSION}
RUN mkdir -p ~/.docker/cli-plugins && \
   wget https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.linux-amd64 && \
   chmod a+x buildx-v${BUILDX_VERSION}.linux-amd64 && \
   mv buildx-v${BUILDX_VERSION}.linux-amd64 ~/.docker/cli-plugins/docker-buildx
# docker buildx du

FROM docker:${DOCKER_VERSION} as docker-compose
ARG DOCKER_COMPOSE_VERSION
ENV DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}
RUN mkdir -p ~/.docker/cli-plugins && \
   wget https://github.com/ElmCompany/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64 && \
   chmod a+x docker-compose-linux-x86_64 && \
   mv docker-compose-linux-x86_64 ~/.docker/cli-plugins/docker-compose
# docker compose version

FROM docker-compose as docker-compose-ssh
RUN apk add --update --no-cache openssh-client

FROM docker-compose as docker-compose-ssl
RUN apk add --update --no-cache openssl ca-certificates

FROM docker-compose as docker-compose-ssh-ssl
RUN apk add --update --no-cache openssh-client openssl ca-certificates

FROM docker:${DOCKER_VERSION}-dind as docker

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
ARG DOCKER_COMPOSE_VERSION_V1
ENV DOCKER_COMPOSE_VERSION_V1=${DOCKER_COMPOSE_VERSION_V1}
RUN wget https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION_V1}/docker-compose-Linux-x86_64
#------

FROM docker as docker-compose-v1
WORKDIR /opt/tmp
RUN apk --update --no-cache add ca-certificates
COPY --from=downloads /downloads/. .
RUN mv sgerrand.rsa.pub /etc/apk/keys/sgerrand.rsa.pub &&\ 
    apk add glibc-2.30-r0.apk glibc-bin-2.30-r0.apk && rm -rf *.apk &&\
    mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose &&\
    chmod a+x /usr/local/bin/docker-compose

FROM docker-compose-v1 as docker-compose-aws
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
