#! /usr/bin/env bash

ACCOUNT_ID="$1"
if [ -z "$ACCOUNT_ID" ]; then
    ACCOUNT_ID=$(jq -r .'id' account.json)
    echo "Using account ID from account.json: $ACCOUNT_ID"
    echo "Call this script as $0 <account_id> to specify a different account ID."
fi

curl -X POST "$HOST/v1/accounts/$ACCOUNT_ID/ach_relationships" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $API_TOKEN" \
    -d '{
        "account_owner_name": "Awesome Alpaca",
        "bank_account_type": "CHECKING",
        "bank_account_number": "32131231abc",
        "bank_routing_number": "121000358",
        "nickname": "Bank of America Checking"
        }'

