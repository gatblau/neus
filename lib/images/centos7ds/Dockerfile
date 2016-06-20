#
# CentOS 7 with systemd
# builds a docker image which replaces the fake systemd in the centos base image with the real systemd
# Use for emulating Virtual machines running CentOS 7 or RHEL 7 for testing playbooks.
#
# Additional packages:
#   sudo
#   ssh
#   net-tools
#
FROM centos:7
MAINTAINER "gatblau" <admin@gatblau.org>
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*; \
rm -f /lib/systemd/system/anaconda.target.wants/*;
RUN yum update -y; \
    yum install -y openssh-server; \
    yum install -y sudo ; \
    yum install -y initscripts ; \
    yum install -y net-tools ; \
    yum clean all
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
