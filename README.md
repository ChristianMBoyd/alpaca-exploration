# alpaca-exploration
These are some simple tests of using [the Alpaca Broker API](https://docs.alpaca.markets/us/docs/getting-started-with-broker-api).

## Quick start

### .envrc

This repo assumes that you have client key and secret values stored in a local .envrc file, with direnv activated.  Otherwise, you must have the values demonstrated in .envrc_demo defined in the environment you use to run any scripts.

### Python and a venv

A requirements.txt is provided for use in a python venv.  The update_api_token.sh script defers to the python script get_api_token.py, which needs the requests package.

### Token bootstrapping through update_api_token.sh

The helper script update_api_token.sh will update your .envrc with a new `API_TOKEN` if your credentials are otherwise valid for use in the Alpaca broker API sandbox.  This is a necessary step in order to make API calls, which use a separate token with a 15 minutes TTL.