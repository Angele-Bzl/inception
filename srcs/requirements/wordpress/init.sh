#!/bin/sh

set -e

if echo "$WP_ADMIN_USER" | grep "admin" > /dev/null || echo "$WP_ADMIN_USER" | grep "Admin" > /dev/null; then
    echo "Warning: Worpdress admin user can't contain the word 'admin' or 'Admin'"
    # set WP_ADMIN_USER=boss
    # echo "Wordpress admin user variable changed to 'boss'" 
fi

if  [ ! -f "/var/www/html/wp-config.php" ]; then
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    cp -r wordpress/* /var/www/html/
    rm -rf wordpress latest.tar.gz

    # until mariadb-admin ping -h mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" --silent; do
    until nc -z -v -w3 mariadb 3306; do
        echo "Waiting for mariadb... "
        sleep 1
    done
    
    sleep 5
    
    cd /var/www/html/

    # Configures the DB connection details
    wp config create \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER_ADMIN}" \
        --dbpass="${MYSQL_PASSWORD_ADMIN}" \
        --dbhost="mariadb" \
        --allow-root

    # Installs WP and sets up the Admin (Make sure $WP_ADMIN_USER doesn't contain 'admin'!)
    wp core install \
        --url="${WP_URL}" \
        --title="Inception WordPress" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --allow-root

    # Creates the mandatory second, regular user
    wp user create \
        "${WP_USER}" \
        "${WP_USER_EMAIL}" \
        --user_pass="${WP_USER_PASSWORD}" \
        --role=author \
        --allow-root

    chown -R www-data:www-data /var/www/html

fi

exec php-fpm8.2 -F