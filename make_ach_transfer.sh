#! /usr/bin/env bash

ACCOUNT_ID="$1"
if [ -z "$ACCOUNT_ID" ]; then
    ACCOUNT_ID=$(jq -r .'id' account.json)
    echo "Using account ID from account.json: $ACCOUNT_ID"
    echo "Call this script as $0 <account_id> to specify a different account ID."
fi

RELATIONSHIP_ID=$(jq -r .'id' ach_relationship.json)
echo "Using ACH relationship ID from ach_relationship.json: $RELATIONSHIP_ID"

PAYLOAD='{
        "transfer_type": "ach",
        "relationship_id": "placeholder",
        "amount": "1234.56",
        "direction": "INCOMING"
        }'

PAYLOAD=$(echo "$PAYLOAD" | jq --arg relationship_id "$RELATIONSHIP_ID" '.relationship_id = $relationship_id')

curl -X POST "$HOST/v1/accounts/$ACCOUNT_ID/transfers" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $API_TOKEN" \
    -d "$PAYLOAD"
