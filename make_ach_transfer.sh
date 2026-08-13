#! /usr/bin/env bash

ACCOUNT_ID="$1"
if [ -z "$ACCOUNT_ID" ]; then
    ACCOUNT_ID=$(jq -r .'id' account.json)
    echo "Using account ID from account.json: $ACCOUNT_ID"
    echo "Call this script as $0 <account_id> to specify a different account ID."
fi

RELATIONSHIP_ID=$(jq -r .'id' ach_relationship.json)

curl -X POST "$HOST/v1/accounts/$ACCOUNT_ID/ach_transfers" \
    -H "Content-Type: application/json" \
    -H "Authorization