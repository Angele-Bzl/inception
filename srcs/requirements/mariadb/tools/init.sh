#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then

echo "Initializing fresh MariaDB system tables..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql --rpm

    # mariadbd --user=mysql --skip-networking &
    
    # until mariadb-admin ping --silent; do 
    #     echo "Waiting for mariadb..."
    #     sleep 1
    # done

    # mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
    # mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
    # mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${MYSQL_USER_ADMIN}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD_ADMIN}';"
    # mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER_ADMIN}'@'%';"
    # mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

    # mariadb-admin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

    TMP_FILE="/tmp/init.sql"
    
cat << EOF > $TMP_FILE
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER_ADMIN}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD_ADMIN}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER_ADMIN}'@'%';
FLUSH PRIVILEGES;
EOF

    # Directly inject the configuration into the system tables
    mariadbd --user=mysql --bootstrap < $TMP_FILE
    rm -f $TMP_FILE

    sleep 2

    echo "MariaDB system tables initialized successfully!"

fi

# Mariadb daemon in foreground
exec mariadbd --user=mysql --console --bind-address=0.0.0.0
