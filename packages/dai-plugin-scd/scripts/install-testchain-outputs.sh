#!/usr/bin/env bash
set -e

CONTRACTS=$SCD/contracts
PLUGIN_ADDRESSES=$CONTRACTS/addresses/testnet.json

for file in $SCD_ABIS/*.abi; do
  cp $file $CONTRACTS/abis/$(basename $file .abi).json
done

cp $SCD_ADDRESSES $PLUGIN_ADDRESSES

add_prefix $PLUGIN_ADDRESSES

TUB=`jq ".SAI_TUB" "$PLUGIN_ADDRESSES"`
cat $PLUGIN_ADDRESSES | jq_inplace ".SAI_TUB_CONSTANT = $(echo $TUB)" $PLUGIN_ADDRESSES
