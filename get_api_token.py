#! /usr/bin/env python3

import os
import requests

def get_client_credentials():
    """
    Loads the client ID and client secret from environment variables.
    Throws a ValueError if either is not set.
    Returns a tuple of (client_id, client_secret).
    """
    client_id = os.environ.get('CLIENT_ID')
    client_secret = os.environ.get('CLIENT_SECRET')

    if not client_id or not client_secret:
        raise ValueError("CLIENT_ID and CLIENT_SECRET must be set in environment variables.")

    return client_id, client_secret

def get_api_token(client_id, client_secret):
    """
    Makes an API request to Alpaca's sandbox broker authentication endpoint to retrieve an API token using the provided credentials.
    """
    url = "https://authx.sandbox.alpaca.markets/v1/oauth2/token"
    headers = {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
    }
    payload = {
        "client_id": client_id,
        "client_secret": client_secret,
        "grant_type": "client_credentials"
    }

    response = requests.post(url, data=payload, headers=headers)

    if response.status_code == 200:
        return response.json().get("access_token")
    else:
        raise Exception(f"Failed to get API token: {response.status_code} - {response.text}")


if __name__ == "__main__":
    client_id, client_secret = get_client_credentials()
    api_token = get_api_token(client_id, client_secret)
    print(api_token)
