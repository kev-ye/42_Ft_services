# init
openrc
touch /run/openrc/softlevel

# create mariadb
/etc/init.d/mariadb setup

# start mariadb
rc-service mariadb start