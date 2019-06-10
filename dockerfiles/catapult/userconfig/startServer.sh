#!/bin/bash

ulimit -c unlimited
cd /catapult
id -a
ls -alh /data

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


if [ -e "/data/server.lock" ]; then
  echo "!!!! Have lock file present, going to run recovery...."
  ./catapult/bin/catapult.recovery /userconfig
  echo "!!!! Finished running recovery, should be moving on to start server..."
else
  echo "!!!! DO NOT HAVE ANY LOCk FILE.."
fi

echo "!!!! Going to start server now...."

exec /catapult/bin/catapult.server /userconfig
