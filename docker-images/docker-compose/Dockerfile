   
ARG DOCKER_COMPOSE_VERSION
FROM docker/compose:${DOCKER_COMPOSE_VERSION} as docker-compose-ssh
RUN apk add --update --no-cache openssh-client

FROM docker-compose-ssh as docker-compose-ssh-ssl
RUN apk add --update --no-cache openssl ca-certificates
RUN sed -i 's@http://@https://@g' /etc/apk/repositories
