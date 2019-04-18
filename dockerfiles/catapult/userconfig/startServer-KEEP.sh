#!/bin/bash

ulimit -c unlimited
cd /catapult
id -a
ls -alh /data

if [ ! -d /data ]; then
  echo "/data directory does not exist"
  exit 1
fi

if [ ! -d /data/00000 ]; then
  echo "data directory is empty, initializing"
  cp -r seed/testnet/* /data*
  echo -ne "\01\0\0\0\0\0\0\0" > /data/index.dat
fi

cd /data
mkdir -p startup
rm -f /data/startup/mongo-initialized
touch /data/startup/datadir-initialized
