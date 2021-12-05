   
ARG DOCKER_COMPOSE_VERSION_V1
FROM docker/compose:${DOCKER_COMPOSE_VERSION_V1} as docker-compose-ssh
RUN apk add --update --no-cache openssh-client

FROM docker/compose:${DOCKER_COMPOSE_VERSION_V1} as docker-compose-ssl
RUN apk add --update --no-cache openssl ca-certificates
RUN sed -i 's@http://@https://@g' /etc/apk/repositories

FROM docker-compose-ssh as docker-compose-ssh-ssl
RUN apk add --update --no-cache openssl ca-certificates
RUN sed -i 's@http://@https://@g' /etc/apk/repositories
