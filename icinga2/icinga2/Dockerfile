FROM centos:7.2.1511

RUN yum -y update \
    && yum -y install epel-release \
    && yum -y install https://packages.icinga.com/epel/7/release/noarch/icinga-rpm-release-7-1.el7.centos.noarch.rpm \
    && yum -y install icinga2 nagios-plugins-all icinga2-ido-pgsql \
    && yum clean all

RUN icinga2 feature enable ido-pgsql
RUN sed -i 's_//host = "localhost"_host = "pgdb"_g' /etc/icinga2/features-available/ido-pgsql.conf
RUN mkdir /run/icinga2/ && chown icinga /run/icinga2/

ADD start.sh start.sh
RUN chmod 755 start.sh

CMD ./start.sh