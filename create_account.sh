#! /usr/bin/env bash

PAYLOAD='{
    "contact": {
        "country": "USA",
        "email_address": "test1@gmail.com",
        "phone_number": "7065912538",
        "street_address": [
            "NG"
        ],
        "city": "San Mateo",
        "postal_code":"33345",
        "state":"CA"
    },
    "identity":      {   "given_name": "John",
        "family_name": "Doe",
        "date_of_birth": "1990-01-01",
        "tax_id_type": "USA_SSN",
        "tax_id": "661-010-666",
        "country_of_citizenship": "USA",
        "country_of_birth": "USA",
        "country_of_tax_residence": "USA",
        "funding_source": [
            "employment_income"
        ],
        "annual_income_min": "10000",
        "annual_income_max": "10000",
        "total_net_worth_min": "10000",
        "total_net_worth_max": "10000",
        "liquid_net_worth_min": "10000",
        "liquid_net_worth_max": "10000",
        "liquidity_needs": "does_not_matter",
        "investment_experience_with_stocks": "over_5_years",
        "investment_experience_with_options": "over_5_years",
        "risk_tolerance": "conservative",
        "investment_objective": "market_speculation",
        "investment_time_horizon": "more_than_10_years",
        "marital_status":"MARRIED",
        "number_of_dependents":5
        },
    "disclosures": {
        "is_control_person": false,
        "is_affiliated_exchange_or_finra": false,
        "is_affiliated_exchange_or_iiroc": false,
        "is_politically_exposed": false,
        "immediate_family_exposed": false
    },
    "agreements": [
        {
            "agreement": "customer_agreement",
            "signed_at": "2024-08-27T10:39:34+01:00",
            "ip_address": "185.11.11.11"
        },
        {
      "agreement": "margin_agreement",
      "signed_at": "2020-09-11T18:09:33Z",
      "ip_address": "185.13.21.99"
    }
    ],
    "documents": [
        {
            "document_type": "identity_verification",
            "document_sub_type": "passport",
            "content": "/9j/Cg==",
            "mime_type": "image/jpeg"
        }
    ],
    "trusted_contact": {
        "given_name": "xyz",
        "family_name": "wyz",
        "email_address": ""
    },
    "additional_information": "",
    "account_type": ""
}'

curl -X POST https://broker-api.sandbox.alpaca.markets/v1/accounts \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $API_TOKEN" \
    -d "$PAYLOAD"