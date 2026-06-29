#!/bin/sh

set -e

if echo "$WP_ADMIN_USER" | grep "admin" > /dev/null || echo "$WP_ADMIN_USER" | grep "Admin" > /dev/null; then
    echo -e "\033[0;31mError\033[0m: WP_ADMIN_USER can't contain the word 'admin' or 'Admin'"
    echo "The container won't launch correctly with a wrong admin user name."
    exit 1
fi

if  [ ! -f "/var/www/html/wp-config.php" ]; then
    wget https://wordpress.org/wordpress-6.8.2.tar.gz
    tar -xzf wordpress-6.8.2.tar.gz
    cp -r wordpress/* /var/www/html/
    rm -rf wordpress wordpress-6.8.2.tar.gz

   # wp core download --allow-root --version=6.9

    until nc -z -v -w3 mariadb 3306; do
        echo "Waiting for mariadb... "
        sleep 1
    done
    
    
    cd /var/www/html/

    # Configures the DB connection details
    wp config create \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER_ADMIN}" \
        --dbpass="${MYSQL_PASSWORD_ADMIN}" \
        --dbhost="mariadb" \
        --allow-root

    # Installs WP and sets up the Admin
    wp core install \
        --url="abarzila.42.fr" \
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