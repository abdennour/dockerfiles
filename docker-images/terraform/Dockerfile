ARG TERRAFORM_VERSION
FROM hashicorp/terraform:${TERRAFORM_VERSION} as terraform-aws-iam-authenticator
RUN apk add --no-cache --update curl

RUN curl -L https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator -o /usr/local/bin/aws-iam-authenticator \
  & wait \
  && chmod +x /usr/local/bin/aws-iam-authenticator
