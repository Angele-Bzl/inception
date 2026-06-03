#!/bin/sh

	# systemd status mariadb \
    # && systemd start mariadb \
    # && mariadb -u root -p

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql

    mariadbd --user=mysql --skip-networking &
    
    until mariadb-admin ping --silent; do 
        echo "Waiting for mariadb..."
        sleep 1
    done

    mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
    mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
    # mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${MYSQL_USER_ADMIN}'@'%' IDENTIFIED BY '${MY_SQL_PASSWORD_ADMIN}';"
    mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER_ADMIN}'@'%';"
    mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

    mariadb-admin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

fi

# Mariadb daemon in foreground
exec mariadbd --user=mysql --console
