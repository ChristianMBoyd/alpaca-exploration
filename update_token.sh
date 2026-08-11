#! /usr/bin/env bash

# This script retrieves the API token using the get_api_token.py script and updates the .envrc file with the new token.

API_TOKEN=$(python3 get_api_token.py)
if [ -z "$API_TOKEN" ]; then
    echo "Failed to retrieve API token."
    exit 1
fi

sed -i "s|^export API_TOKEN=.*|export API_TOKEN='$API_TOKEN'|" .envrc