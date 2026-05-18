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
RUN     apt-get update && apt-get install -y wordpress

# copy the container script to the right directory
COPY    tools/init.sh /usr/local/bin/init.sh

# open port for the other containers https://
EXPOSE  443

# command run when the container is launched
ENTRYPOINT  ["sh", "/usr/local/bin/init.sh"]