#!/bin/sh

echo 'cron check start'
for i in /ffp/scripts/*.sh; do $i & done
echo 'cron check finish'