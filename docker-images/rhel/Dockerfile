FROM registry.access.redhat.com/ubi7/ubi-init as rhel7


FROM registry.access.redhat.com/ubi8/ubi-init as rhel8

RUN yum module install python36 -y && \
  ln -s /usr/bin/python3 /usr/bin/python && \
  yum clean all
