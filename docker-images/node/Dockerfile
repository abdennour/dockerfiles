ARG NODE_TAG
ARG PYTHON_TAG
FROM node:${NODE_TAG} as node
ENV BAKERY_NODE_TAG ${NODE_TAG}

FROM python:${PYTHON_TAG} as python
ENV BAKERY_PYTHON_TAG ${PYTHON_TAG}

FROM node as node-python
ENV BAKERY_PYTHON_TAG ${PYTHON_TAG}
COPY --from=python /usr/local/bin /usr/local/bin
COPY --from=python /usr/local/lib /usr/local/lib
COPY --from=python /usr/local/include /usr/local/include
