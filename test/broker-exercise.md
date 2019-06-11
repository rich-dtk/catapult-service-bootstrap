
## Testing Broker Resiliency

Using this page to track testing and steps to exercise the broker and how it behaves on start/stop/restart/recover.

Currently getting odities on restarts where the broker appears to not work and while running correctly based on whats printed to the logs and console, it stops writing info to mongo.

Due to the behavior in dragon+ the previous approach of all-in-one compose files seems to not be feasible, and instead we are starting to migrate into isolated/managed services.

There is a new cmds/ folder that has all the "commands" to run, this includes the previous original `clean-all` and `clean-data` commands

## Test Case 1

### Steps for Setup and Run

 1) ./cmds/setup-network          (create the nemesis and configs for a 2 peer, one api node network
 2) ./cmds/start-catapult-peers   (starts the peer-0 and peer-1 serverices in the foreground)
 3) ./cmds/start-api-db           (starts the mongo db as a detached background process)
 4) ./cmds/start-catapult-broker  (starts up just the api node broker)
 5) ./cmds/start-catapult-api     (starts the api node and the REST gateway)

At this point the network should be setup and running, harvesting is set to happen on peer 0, peer 1 and api node should sync blocks being produced, with the broker emitting messages that it is preparing to process messages. You should be able to see blocks via a `curl localhost:3000/block/xxx` request for any that have been produced.

### Steps for Stop and Restart of API/Broker

 1) ctrl-c gracefull stop of the broker
 2) ctrl-c gracefull stop of the api + rest gateway
 3) `ls data/api-node-0` to verify there is no server.lock or broker.lock file, which means services shut down okay
 4) ./cmds/start-catapult-broker
 5) ./cmds/start-catapult-api

NOTE: observe the output of the broker log/console, see if it processes any new messages, in testing it appears 2 log messages about processing will be emitted and that is all, no new data written to mongo so is not accessible via the REST gateway
