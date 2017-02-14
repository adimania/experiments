FROM centos:7.2.1511

RUN yum -y update \
    && yum -y install epel-release \
    && yum -y install https://yum.postgresql.org/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm \
    && yum -y install postgresql96-server postgresql96 postgresql96-contrib postgresql96-plperl postgresql96-devel \
    && yum clean all

RUN su postgres -c "/usr/pgsql-9.6/bin/initdb --pgdata=/var/lib/pgsql/9.6/data"
ADD pg_hba.conf /var/lib/pgsql/9.6/data/pg_hba.conf
RUN sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /var/lib/pgsql/9.6/data/postgresql.conf
ADD pgsql.icinga2.sql pgsql.icinga2.sql
ADD start.sh start.sh
RUN chmod 755 start.sh

CMD ./start.sh