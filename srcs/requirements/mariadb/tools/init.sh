# !/bin/sh

	sudo systemctl status mariadb \
    && sudo systemctl start mariadb \
    && mariadb -u root -p