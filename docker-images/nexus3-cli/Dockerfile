FROM python:3.6 as builder

ARG NEXUS3CLI_VERSION
ENV NEXUS3CLI_VERSION=${NEXUS3CLI_VERSION}

RUN \
  pip install https://github.com/thiagofigueiro/nexus3-cli/archive/${NEXUS3CLI_VERSION}.tar.gz


FROM python:3.6-alpine as nexus3-cli

COPY --from=builder /usr/local/lib/python3.6/site-packages/. /usr/local/lib/python3.6/site-packages/ 
COPY --from=builder /usr/local/bin/nexus3 /usr/local/bin/nexus3
ENTRYPOINT [ "nexus3" ]
