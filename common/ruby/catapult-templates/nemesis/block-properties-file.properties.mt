[nemesis]

networkIdentifier = {{network_identifier}}
nemesisGenerationHashSeed = {{nemesis_generation_hash}}
nemesisSignerPrivateKey = {{nemesis_signer_private_key}}

[cpp]

cppFileHeader =

[output]

cppFile =
binDirectory = {{bin_directory}}

[transactions]
transactionsDirectory = {{transactions_directory}}

[namespaces]

symbol = true
symbol.xym = true

[namespace>symbol]

duration = 0

[mosaics]

symbol:xym = true

[mosaic>symbol:xym]

divisibility = 6
duration = 0
supply = 7'831'975'436'000'000
isTransferable = true
isSupplyMutable = false
isRestrictable = false

[distribution>symbol:xym]
{{#currency_distribution}}
{{address}} = {{amount}}
{{/currency_distribution}}

{{#harvesting_distribution}}
{{address}} = {{amount}}
{{/harvesting_distribution}}

