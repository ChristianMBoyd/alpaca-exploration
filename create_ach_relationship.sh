#! /usr/bin/env bash

ACCOUNT_ID="$1"
if [ -z "$ACCOUNT_ID" ]; then
    ACCOUNT_ID=$(jq .'id' test_account.json)
    echo "Using account ID from test_account.json: $ACCOUNT_ID"
    echo "Call this script as $0 <account_id> to specify a different account ID."
fi


