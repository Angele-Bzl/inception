# define the OS for the container
FROM debian:bookworm

# download the utilities
RUN apt update -y \
    && apt install -y \
    php-fpm \
    php-mysql \
    wget \
    tar \
    mariadb-client \
    curl \
    php-phar \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*


# Install WP-CLI (Command Line Interface for WordPress)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 9000|g' /etc/php/8.2/fpm/pool.d/www.conf

RUN mkdir -p /run/php /var/www/html && chown -R www-data:www-data /var/www/html

EXPOSE 9000

# copy the container script to the right directory
COPY wordpress/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

# command run when the container is launched
ENTRYPOINT ["/usr/local/bin/init.sh"]