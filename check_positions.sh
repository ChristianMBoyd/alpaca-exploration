#! /usr/bin/env bash

ACCOUNT_ID="$1"
if [ -z "$ACCOUNT_ID" ]; then
    ACCOUNT_ID=$(jq -r .'id' account.json)
    echo "Using account ID from account.json: $ACCOUNT_ID"
    echo "Call this script as $0 <account_id> to specify a different account ID."
fi

curl "$HOST/v1/trading/accounts/$ACCOUNT_ID/positions" \
    -H "Authorization: Bearer $API_TOKEN"