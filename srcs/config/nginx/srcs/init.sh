# configure ssh
sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/g'  /etc/ssh/sshd_config  \
    && rc-update add sshd 

# staring nginx & ssh
openrc
touch /run/openrc/softlevel 
service nginx start
service sshd restart 

# # to keep the Container running
# tail -f /dev/null

sh