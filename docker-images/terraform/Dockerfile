ARG TERRAFORM_VERSION
FROM hashicorp/terraform:${TERRAFORM_VERSION} as terraform-aws-iam-authenticator
RUN apk add --no-cache --update curl

RUN curl -L https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator -o /usr/local/bin/aws-iam-authenticator \
  & wait \
  && chmod +x /usr/local/bin/aws-iam-authenticator

ARG TERRAFORM_VERSION
FROM hashicorp/terraform:${TERRAFORM_VERSION} as terraform-helm
ARG HELM_VERSION
# ENV BASE_URL="https://storage.googleapis.com/kubernetes-helm"
ENV BASE_URL="https://get.helm.sh" \
    TAR_FILE="helm-v${HELM_VERSION}-linux-amd64.tar.gz" \
    KUBECONFIG=/root/.kube/config

RUN apk add --update --no-cache curl git ca-certificates && \
    curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    apk del curl && \
    rm -f /var/cache/apk/*
COPY /fry-helm-in-terraform /
ENTRYPOINT [ "/bin/ash", "/fry-helm-in-terraform" ]
CMD ["--help"]

FROM terraform-helm as terraform-helm-aws-iam-authenticator
RUN apk add --no-cache --update curl
RUN curl -L https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator -o /usr/local/bin/aws-iam-authenticator \
  & wait \
  && chmod +x /usr/local/bin/aws-iam-authenticator \
  && apk del curl \
  && rm -f /var/cache/apk/*
