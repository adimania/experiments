Icinga
------

* This compose file implements [Icinga2](https://www.icinga.com/) and Icinga web projects. 
* It uses Postgres 9.6 for IDO
* Once the stack is up execute `docker-compose exec icingaweb2 icingacli setup token show` and copy the token
* Get the IP of the `icinga2_icingaweb2_1` container using `docker inspect icinga2_icingaweb2_1`
* Open a browser and browse the URL `<ip>/icingaweb2/` and follow the interactive setup.

Credentials:
----------
* Web DB: icingaweb2, User: icingaweb2, Password: icingaweb2
* IDO DB: icinga, User: icinga, Password: icinga
