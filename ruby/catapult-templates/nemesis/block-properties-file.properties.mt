[nemesis]

networkIdentifier = {{network_identifier}}
nemesisGenerationHash = {{nemesis_generation_hash}}
nemesisSignerPrivateKey = {{nemesis_signer_private_key}}

[cpp]

cppFileHeader =

[output]

cppFile =
binDirectory = ../seed/public-test

[namespaces]

nem = true
nem.xem = true

[namespace>nem]

duration = 0

[mosaics]

nem:xem = true

[mosaic>nem:xem]

divisibility = 6
duration = 0
supply = 8'998'999'998'000'000
isTransferable = true
isSupplyMutable = false
isRestrictable = false

[distribution>nem:xem]
{{#cat_currency_distribution}}
{{address}} = {{amount}}
{{/cat_currency_distribution}}

