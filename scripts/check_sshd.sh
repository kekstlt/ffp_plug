#!/bin/sh

echo 'sshd check'
ps -A | grep sshd || /usr/sbin/sshd -f /etc/ssh/sshd_config