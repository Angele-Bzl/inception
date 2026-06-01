# !/bin/sh

	# systemd status mariadb \
    # && systemd start mariadb \
    # && mariadb -u root -p



# Mariadb daemon in foreground
exec mariadb --user=mysql --console
# il faut exec mariadb