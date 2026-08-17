#! /usr/bin/env bash

ACCOUNT_ID="$1"
if [ -z "$ACCOUNT_ID" ]; then
    ACCOUNT_ID=$(jq -r .'id' account.json)
    echo "Using account ID from account.json: $ACCOUNT_ID"
    echo "Call this script as $0 <account_id> to specify a different account ID."
fi

DATA=$(jq -r '.side = "buy"' order_template.json)


buy_stock() {
    SYMBOL="$1"
    LOCAL_DATA=$(jq --arg symbol "$SYMBOL" '.symbol = $symbol' <<< "$DATA")
    curl -X POST "$HOST/v1/trading/accounts/$ACCOUNT_ID/orders" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $API_TOKEN" \
        -d "$LOCAL_DATA"
}

buy_stock "AAPL"
buy_stock "GOOGL"
buy_stock "MSFT"
buy_stock "AMZN"
buy_stock "META"
buy_stock "NFLX"
buy_stock "NVDA"
buy_stock "TLSA"
buy_stock "ORCL"
buy_stock "CRM"
buy_stock "JPM"
