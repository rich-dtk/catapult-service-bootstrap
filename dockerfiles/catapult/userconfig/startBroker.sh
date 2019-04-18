#!/bin/bash

ulimit -c unlimited

cd /catapult
id -a
ls -alh /data
cd /data
rm /data/startup/datadir-initialized

exec /catapult/bin/catapult.broker /userconfig
