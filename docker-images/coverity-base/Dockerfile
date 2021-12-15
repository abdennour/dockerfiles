FROM centos:centos8.4.2105

USER root
WORKDIR /home/coverity
RUN yum update -y && \
 yum install -y fontconfig keyutils net-tools && \
 useradd -ms /bin/bash coverity && \
 mkdir /home/coverity/setup && \
  chown -R coverity .*
