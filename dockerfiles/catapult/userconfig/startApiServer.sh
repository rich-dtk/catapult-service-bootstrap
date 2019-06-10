#!/bin/bash

ulimit -c unlimited
cd /catapult
id -a
ls -alh /data

if [ -e "/state/api-node-0" ]; then
  rm -f /state/api-node-0
fi

sleep 4

if [ ! -d /data ]; then
  echo "/data directory does not exist"
  exit 1
fi

if [ ! -d /data/00000 ]; then
   echo "nemgen boostrap needs to be run"
   exit 1
fi

if [ ! -f "/data/index.dat" ]; then
  echo "No index.dat file, creating now...."
  echo -ne "\01\0\0\0\0\0\0\0" > /data/index.dat
fi

cd /data
mkdir -p startup
rm -f /data/startup/mongo-initialized
touch /data/startup/datadir-initialized

echo "TESTING PWD HERE....."
pwd

if [ -e "/data/broker.lock" ] || [ -e "/data/server.lock" ]; then
  echo "!!!! Have lock file present, going to run recovery...."
  exec /catapult/bin/catapult.recovery /userconfig; touch /state/api-node-0; /catapult/bin/catapult.server /userconfig
  echo "!!!! Finished running recovery, should be moving on to start server..."
else
  echo "!!!! DO NOT HAVE ANY LOCk FILE.."
fi

echo "!!!! Going to start server now...."

touch /state/api-node-0

exec /catapult/bin/catapult.server /userconfig
