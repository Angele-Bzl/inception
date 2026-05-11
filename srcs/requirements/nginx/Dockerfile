# A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.

# define the OS for the container
FROM    debian:bookworm

# download the utilities
RUN     apt-get update && apt-get install -y nginx \
        && rm -rf /var/lib/apt/lists/*

# copy the container to the right directory
COPY    tools/init.sh /usr/local/bin/init.sh

# open port for the other containers https://
EXPOSE  443

# command run when the container is launched
ENTRYPOINT  ["sh", "/usr/local/bin/init.sh"]