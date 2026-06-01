#!/bin/sh

	# systemd status mariadb \
    # && systemd start mariadb \
    # && mariadb -u root -p

if [ ! -d "/var/lib/mysql" ]; then
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql

    mariadbd --user=mysql --skip-networking &
    
    until mariadb-admin ping --silent; do 
        echo "Waiting for mariadb..."
        sleep 1
    done

    mariadb-admin shutdown

fi

# Mariadb daemon in foreground
exec mariadbd --user=mysql --console
