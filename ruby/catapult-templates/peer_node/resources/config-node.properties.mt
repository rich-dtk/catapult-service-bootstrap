[node]

port = {{port}}
apiPort = {{api_port}}
shouldAllowAddressReuse = false
shouldUseSingleThreadPool = false
shouldUseCacheDatabaseStorage = true

shouldEnableTransactionSpamThrottling = true
transactionSpamThrottlingMaxBoostFee = 10'000'000

maxBlocksPerSyncAttempt = 400
maxChainBytesPerSyncAttempt = 100MB

shortLivedCacheTransactionDuration = 10m
shortLivedCacheBlockDuration = 100m
shortLivedCachePruneInterval = 90s
shortLivedCacheMaxSize = 10'000'000

unconfirmedTransactionsCacheMaxResponseSize = 20MB
unconfirmedTransactionsCacheMaxSize = 1'000'000

connectTimeout = 10s
syncTimeout = 60s

socketWorkingBufferSize = 512KB
socketWorkingBufferSensitivity = 100
maxPacketDataSize = 150MB

blockDisruptorSize = 4096
blockElementTraceInterval = 1
transactionDisruptorSize = 16384
transactionElementTraceInterval = 10

shouldAbortWhenDispatcherIsFull = true
shouldAuditDispatcherInputs = true
shouldPrecomputeTransactionAddresses = false

outgoingSecurityMode = None
incomingSecurityModes = None

maxCacheDatabaseWriteBatchSize = 5MB
maxTrackedNodes = 5'000

[localnode]

host = {{host}}
friendlyName = {{friendly_name}}
version = 0
roles = Peer

[outgoing_connections]

maxConnections = 10
maxConnectionAge = 5
maxConnectionBanAge = 20
numConsecutiveFailuresBeforeBanning = 3

[incoming_connections]

maxConnections = 512
maxConnectionAge = 10
maxConnectionBanAge = 20
numConsecutiveFailuresBeforeBanning = 3
backlogSize = 512

[extensions]

# api extensions
#   (in order for precomputation to work in all cases when enabled, `addressextraction` must be registered first
#    because it precomputes addresses of rolled-back transactions)
extension.addressextraction = false
extension.mongo = false
extension.partialtransaction = false
extension.zeromq = false

# p2p extensions
extension.eventsource = true
extension.syncsource = true

# common extensions
extension.diagnostics = true
extension.filechain = true
extension.hashcache = true
extension.networkheight = true
extension.nodediscovery = true
extension.packetserver = true
extension.sync = true
extension.timesync = true
extension.transactionsink = true
extension.unbondedpruning = true
 

