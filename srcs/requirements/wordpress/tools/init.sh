#!/bin/sh

if  ! -f "/var/www/html/wp-config.php" ]; then
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    mv wordpress/* /var/www/thml/
    rm -rf wordpress latest.tar.gz

    until mariadb-admin ping -h mariadb --silent; do
        echo "Waiting for mariadb..."
        sleep 1
    done
    
    # Configure and install WordPress here via WP-CLI or manual scripts...
    # (This is where you set up your login.42.fr URL and non-admin users)
fi

exec php-fpm8.2 -F