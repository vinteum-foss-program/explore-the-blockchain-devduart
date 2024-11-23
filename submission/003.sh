# How many new outputs were created by block 123,456?

#!/bin/bash
BLOCKHASH=$(bitcoin-cli getblockhash 123456)
OUTPUT_COUNT=$(bitcoin-cli getblock $BLOCKHASH 2 | jq '[.tx[].vout[]] | length')
echo "Total outputs in block 123,456: $OUTPUT_COUNT"
