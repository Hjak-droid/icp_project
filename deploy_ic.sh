#!/bin/bash

IDENTITY=$(dfx identity whoami)

echo "Checking wallet for identity: $IDENTITY"

if ! dfx wallet --network ic balance > /dev/null 2>&1; then
  echo "Wallet not found. Creating wallet canister..."
  dfx wallet --network ic create
else
  echo "Wallet exists."
fi

echo "Deploying canisters to Internet Computer..."
dfx deploy --network ic
