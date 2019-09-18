ARG NGINX_VERSION


FROM alpine:edge as builder

RUN apk --update add curl
WORKDIR /downloads
ARG REMARK_VERSION
ENV REMARK_VERSION=${REMARK_VERSION}

RUN curl -O https://cdnjs.cloudflare.com/ajax/libs/remark/${REMARK_VERSION}/remark.min.js
   


FROM nginx:${NGINX_VERSION} as remark

LABEL maintainer="Abdennour Toumi" \
      website="kubernetes.tn" \
      description="Slides as Code For presentations using Markdown Syntax"

WORKDIR /usr/share/nginx/html
COPY src/. .
COPY --from=builder /downloads/remark.min.js ./js/remark.min.js

CMD ["nginx", "-g", "daemon off;"]


