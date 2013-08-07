#!/bin/bash
HOSTLINE=$(echo $(ip -f inet addr show eth0 | grep 'inet' | awk '{ print $2 }' | cut -d/ -f1) $(hostname) $(hostname -s))
sed -i "s/^172.*/$HOSTLINE/" /etc/hosts
/usr/sbin/mysqld &
/usr/sbin/apache2ctl -D FOREGROUND
