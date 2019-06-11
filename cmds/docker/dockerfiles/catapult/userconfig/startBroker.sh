#!/bin/bash

ulimit -c unlimited

if [ -e "/state/api-node-broker" ]; then
  rm -f /state/api-node-broker
fi

cd /catapult
id -a
ls -alh /data
cd /data
rm /data/startup/datadir-initialized

touch /state/api-node-broker

exec /catapult/bin/catapult.broker /userconfig
