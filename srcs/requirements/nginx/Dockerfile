# A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.

# define the OS for the container
FROM    debian:bookworm

ARG DOMAIN_NAME=abarzila

# download the utilities
RUN     apt-get update \
        && apt-get install -y nginx openssl \
        && rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/key.pem \
        -out /etc/nginx/cert.pem \
        -subj "/C=CO/ST=REG/L=City/O=42/CN=${DOMAIN_NAME}"

# copy the container script to the right directory
# COPY    tools/init.sh /usr/local/bin/init.sh
COPY nginx.conf /etc/nginx/http.d/nginx.conf

# open port for the other containers https://
# EXPOSE  443

# command run when the container is launched
ENTRYPOINT  ["nginx", "-g", "daemon off;"]