FROM centos:centos8.4.2105

USER root
RUN yum update -y && \
 yum install -y fontconfig keyutils net-tools && \
 yum clean all && \
 rm -rf /var/cache/yum && \
 useradd -ms /bin/bash coverity && \
 mkdir /home/coverity/setup && \
  chown -R coverity /home/coverity/*
WORKDIR /home/coverity
USER coverity
