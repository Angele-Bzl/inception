#!/bin/sh

set -e

mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql
mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

echo "before if"

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    echo "Initializing fresh MariaDB..."

    mariadb-install-db --user=mysql --datadir=/var/lib/mysql

    mariadbd --user=mysql --datadir=/var/lib/mysql --skip-networking &
    MARIADB_PID=$!

    until mariadb-admin ping --silent 2>/dev/null; do
        echo "Waiting for MariaDB..."
        sleep 1
    done

    mariadb -u root << EOF
ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password;
SET PASSWORD = PASSWORD('${MYSQL_ROOT_PASSWORD}');
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER_ADMIN}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD_ADMIN}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER_ADMIN}'@'%';
FLUSH PRIVILEGES;
EOF

    mariadb-admin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
    wait $MARIADB_PID

    echo "MariaDB initialized successfully!"
fi
echo "after if"

exec mariadbd --user=mysql --datadir=/var/lib/mysql \
    --bind-address=0.0.0.0
    # --console