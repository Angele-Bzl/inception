#!/bin/sh

if  [ ! -f "/var/www/html/wp-config.php" ]; then
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    mv wordpress/* /var/www/html/
    rm -rf wordpress latest.tar.gz

    until mariadb-admin ping -h mariadb -u "${MYSQL_USER_ADMIN}" -p"${MYSQL_PASSWORD_ADMIN}" --silent; do
        echo "Waiting for mariadb..."
        sleep 1
    done
    
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