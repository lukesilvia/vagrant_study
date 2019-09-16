#!/bin/sh

FLAG_FILE="/var/provisioned_redis"

if [ -f $FLAG_FILE ]; then
  echo "redis is provisioned."
  exit 0
fi

echo "Installing redis..."
apt-get update > /dev/null 2>&1
apt-get install -y redis > /dev/null 2>&1

touch $FLAG_FILE
