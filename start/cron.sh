#!/bin/sh

echo 'cron script starts';

#cron add
echo '* * * * * /ffp/cron.sh >> /var/log/cron.log' >> /var/spool/cron/crontabs/root

#cron reload
/sbin/crond reload