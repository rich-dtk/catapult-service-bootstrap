[extensions]

# api extensions
# extension.filespooling = false
# extension.partialtransaction = false

# addressextraction must be first because mongo and zeromq depend on extracted addresses
extension.addressextraction = false
extension.mongo = false
extension.zeromq = false

# p2p extensions
extension.eventsource = true
{{#harvesting_is_on}}
extension.harvesting = true
{{/harvesting_is_on}}
extension.syncsource = true

# common extensions
extension.diagnostics = true
extension.filechain = true
extension.hashcache = true
extension.networkheight = true
extension.nodediscovery = true
extension.packetserver = true
extension.pluginhandlers = true
extension.sync = true
extension.timesync = true
extension.transactionsink = true
extension.unbondedpruning = true
