# define the OS for the container
FROM debian:bookworm

# copy the container script to the right directory
COPY mariadb/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

# download the utilities
RUN chmod +x /usr/local/bin/init.sh \
    && apt update -y \
    && apt install -y mariadb-server mariadb-client \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/init.sh"]
