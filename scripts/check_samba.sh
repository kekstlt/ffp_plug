#!/bin/sh

echo 'Samba check'
ps -A | grep smbd || /usr/sbin/smb restart