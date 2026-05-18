# !/bin/sh

echo NGINX_SCRIPT

if [ ! -f /etc/nginx/ssl/cert.pem ]; then
    mkdir -p /etc/nginx/ssl

    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/key.pem \
        -out /etc/nginx/ssl/cert.pem \
        -subj "/C=CO/ST=REG/L=City/O=42/CN=${DOMAIN_NAME}"

    sed -i "s/server_name localhost/server_name ${DOMAIN_NAME}/g" /etc/nginx/http.d/nginx.conf

    # cp 404.html /var/www/html/404.html
fi

exec nginx -g "daemon off;"

# THIS IS NOT MY CODE. I COPY PASTED IT FOR A TEST