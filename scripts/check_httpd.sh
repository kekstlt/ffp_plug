#!/bin/sh

echo 'lighttpd check'
ps -A | grep lighttpd || lighttpd -D -m /usr/lighty_lib -f /etc/lighttpd/lighttpd.conf