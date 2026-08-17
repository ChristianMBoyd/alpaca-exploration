#! /usr/bin/env bash

ACCOUNT_ID="$1"
if [ -z "$ACCOUNT_ID" ]; then
    ACCOUNT_ID=$(jq -r .'id' account.json)
    echo "Using account ID from account.json: $ACCOUNT_ID"
    echo "Call this script as $0 <account_id> to specify a different account ID."
fi

DATA=$(jq -r '.side = "sell"' order_template.json)


sell_stock() {
    LOCAL_DATA=$(jq --arg symbol '.symbol = "$symbol"' <<< "$DATA")
    curl -X POST "$HOST/v1/trading/accounts/$ACCOUNT_ID/orders" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $API_TOKEN" \
        -d "$LOCAL_DATA"
}

sell_stock "AAPL"