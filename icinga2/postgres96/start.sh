#!/bin/bash

su postgres -c "/usr/pgsql-9.6/bin/pg_ctl -D /var/lib/pgsql/9.6/data -l /var/lib/pgsql/logfile start"

sleep 1

su postgres -c "psql -c \"CREATE ROLE icinga WITH LOGIN PASSWORD 'icinga'\""
su postgres -c "psql -c \"CREATE ROLE icingaweb2 WITH LOGIN PASSWORD 'icingaweb2'\""

su postgres -c "createdb -O icinga icinga"
su postgres -c "createdb -O icingaweb2 icingaweb2"

export PGPASSWORD=icinga
su postgres -c "psql -U icinga -d icinga < pgsql.icinga2.sql"

tail -F /var/lib/pgsql/9.6/data/pg_log/*.log