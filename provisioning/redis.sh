#!/bin/sh

set -eu

FLAG_FILE="/var/provisioned_redis"
REDIS_CONF="/etc/redis/redis.conf"

if [ -f $FLAG_FILE ]; then
  echo "redis is provisioned."
  exit 0
fi

echo "Installing redis..."
apt-get update > /dev/null 2>&1
apt-get install -y redis > /dev/null 2>&1

echo "Configuring enable accessing from other hosts..."
sed -i -e 's/^\(bind 127.0.0.1 ::1\)/# \1/' $REDIS_CONF
sed -i -e 's/^\(protected-mode\) yes/\1 no/' $REDIS_CONF

echo "Restarting redis..."
systemctl restart redis

touch $FLAG_FILE
