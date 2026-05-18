# A Docker container that contains MariaDB only, without nginx.

FROM debian:bookworm

COPY tools/init.sh /usr/local/bin/init.sh

RUN sudo apt install mariadb-server mariadb-client galera-4 \
    && sudo mariadb-secure-installation \
    && sudo systemctl status mariadb \
    && sudo systemctl start mariadb \
    && mariadb -u root -p

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/init.sh"]
