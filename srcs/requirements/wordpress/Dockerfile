# A Docker container that contains WordPress + php-fpm (it must be installed and
# configured) only, without nginx

# In your WordPress database, there must be two users, one of them being the ad-
# ministrator. The administrator’s username can’t contain admin/Admin or admin-
# istrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and
# so forth)

# To make things simpler, you have to configure your domain name so it points to your
# local IP address.
# This domain name must be login.42.fr. Again, you have to use your own login.
# For example, if your login is wil, wil.42.fr will redirect to the IP address pointing to
# wil’s website.

# define the OS for the container
FROM    debian:bookworm

# download the utilities
RUN     apt update -y \
        && apt install -y \
        php-fpm \
        php-mysql \
        wget \
        tar \
        mariadb-client

RUN sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 9000|g' /etc/php/8.2/fpm/pool.d/www.conf

RUN mkdir -p /run/php

# copy the container script to the right directory
COPY    tools/init.sh /usr/local/bin/init.sh
RUN     chmod +x /usr/local/bin/init.sh

# EXPOSE  9000

# command run when the container is launched
ENTRYPOINT  ["/usr/local/bin/init.sh"]