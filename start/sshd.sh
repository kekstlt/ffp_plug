#!/bin/sh

# need sshd user and group for priviledge separation
if ! grep '^sshd:' /etc/passwd >/dev/null; then
	echo 'sshd:x:33:33:sshd:/:/bin/false' >>/etc/passwd
fi
if ! grep '^sshd:' /etc/shadow >/dev/null; then
	echo 'sshd:*:9797:0:::::' >>/etc/shadow
fi
if ! grep '^sshd:' /etc/group >/dev/null; then
	echo 'sshd::33:sshd' >>/etc/group
fi

# generate host keys
if [ ! -r /etc/ssh/ssh_host_key ]; then
	/usr/sbin/ssh-keygen -t rsa1 -f /etc/ssh/ssh_host_key -N ''
fi
if [ ! -r /etc/ssh/ssh_host_dsa_key ]; then
	/usr/sbin/ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''
fi
if [ ! -r /etc/ssh/ssh_host_rsa_key ]; then
	/usr/sbin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
fi
if [ ! -r /etc/ssh/ssh_host_ecdsa_key ]; then
	/usr/sbin/ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
fi

#CHMOD
chmod 400 /etc/ssh/ssh_host*key

#START SSH
/usr/sbin/sshd -f /etc/ssh/sshd_config

