# A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.

# define the OS for the container
FROM    debian:buster

# download the utilities
RUN     apk update && apk upgrade && apk add \
        openssl \
        nginx   \
        curl    \
        vim     \
        sudo    \
RUN     rm -f /etc/nginx/nginx.conf

# copy the container to the right directory
COPY    ./config/nginx.conf /etc/nginx/nginx.conf
COPY    scripts/setup_nginx.sh /setup_nginx.sh

# open port for the other containers https://
EXPOSE  443

# command run when the container is launched
ENTRYPOINT  ["sh", "setup_nginx.sh"]