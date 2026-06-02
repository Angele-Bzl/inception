# A Docker container that contains MariaDB only, without nginx.

FROM debian:bookworm

#prepare the script and execution rights
COPY mariadb/tools/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

# download mariadb
RUN apt update -y \
    && apt install -y mariadb-server mariadb-client galera-4 \
    && rm -rf /var/lib/apt/lists/*
    # && mariadb-secure-installation 
    
# create directories
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql \
    && mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/init.sh"]
