# What is the hash of block 654,321?
# 000000000000000000058452bbe379ad4364fe8fda68c45e299979b492858095
#!/bin/bash
block_hash=$(bitcoin-cli getblockhash 654321)

echo "o hash do bloco e: $block_hash"
