# define the OS for the container
FROM debian:bookworm

ARG DOMAIN_NAME="abarzila.42.fr"

# download the utilities
RUN apt-get update \
&& apt-get install -y nginx openssl \
&& rm -rf /var/lib/apt/lists/*

# download ssl to create the certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/${DOMAIN_NAME}.key \
        -out /etc/nginx/${DOMAIN_NAME}.crt \
        -subj "/C=CO/ST=REG/L=City/O=42/CN=${DOMAIN_NAME}"

# copy the nginx configuration file to the right directory
COPY nginx/nginx.conf /etc/nginx/nginx.conf
RUN chmod +x /etc/nginx/nginx.conf

EXPOSE 443

# command run when the container is launched
ENTRYPOINT ["nginx", "-g", "daemon off;"]
