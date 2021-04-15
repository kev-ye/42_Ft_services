# # configure ssh
# sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/g'  /etc/ssh/sshd_config  \
#     && rc-update add sshd 

# init
openrc
touch /run/openrc/softlevel

# # run nginx
# service nginx start

# # run sshd
# service sshd restart 

# # to keep the Container running
# tail -f /dev/null

# To run in foreground:
nginx -g 'daemon off;'
