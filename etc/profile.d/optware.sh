# Profile for optware
# Created automatically by /ffp/start/optware.sh for ffp 0.5
if [ -d "/opt" ]; then
    PATH=/opt/bin:$PATH
    if [ $(/ffp/bin/id -u) -eq 0 ]; then
	PATH=/opt/sbin:$PATH
    fi
    export PATH
fi
