FROM centos:7.2.1511

RUN yum -y update \
    && yum -y install epel-release \
    && yum -y install https://packages.icinga.com/epel/7/release/noarch/icinga-rpm-release-7-1.el7.centos.noarch.rpm \
    && yum -y install icingaweb2 icingacli php-pgsql httpd \
    && yum clean all

RUN icingacli setup token create
RUN sed -i 's_;date.timezone =_date.timezone = Asia/Kolkata_g' /etc/php.ini
ADD https://raw.githubusercontent.com/Icinga/icingaweb2/master/etc/schema/pgsql.schema.sql /usr/share/doc/icingaweb2/schema/pgsql.schema.sql
RUN chmod +r /usr/share/doc/icingaweb2/schema/pgsql.schema.sql

CMD httpd -DFOREGROUND