#
# run with the right eth interface
# 
# 
# docker run -d --net=host -v /netservices/DHCP/cfg:/cfg -v /netservices/DHCP/logs:/logs --name dhcpd isc-dhcpd eth2
#
FROM centos:centos7

MAINTAINER A B a.b@to.infn.it

RUN yum -y update  \

 && yum -y install \
           dhcp \
           net-tools \
           which

EXPOSE 67/udp 67/tcp


COPY util/entrypoint.sh /sbin/entrypoint.sh

RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]

 
