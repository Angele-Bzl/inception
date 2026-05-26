# A Docker container that contains MariaDB only, without nginx.

FROM debian:bookworm

COPY mariadb/tools/init.sh /usr/local/bin/init.sh

# download mariadb
RUN apt update \
    && apt install mariadb-server mariadb-client galera-4 \
    && mariadb-secure-installation 

# EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/init.sh"]
