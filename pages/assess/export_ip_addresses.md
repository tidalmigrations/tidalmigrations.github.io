---
title: Exporting IP Addresses
parent: Assess
keywords: export, ip, address, api
last_updated: February 2020
summary: "How to export all your IP addresses"
sidebar: main_sidebar
redirect_from: export_ip_addresses.html
permalink: export-ip-addresses.html
---

## Using the API

If you haven't used the API yet or need a quick refresh, you [should get setup first](/api_getting_started.html).

## Exporting IP Addresses

- You will want to use this API endpoint:

  `GET /ip_addresses`

  A full request via cURL would look similar to this:

  ```bash
  export API_TOKEN=PUT_YOUR_TOKEN_HERE
  export SUBDOMAIN=PUT_YOUR_SUBDOMAIN_HERE
  curl -H "Authorization: Bearer $API_TOKEN" "https://$SUBDOMAIN.tidal.cloud/api/v1/ip_addresses" > my_ip_addresses.json
  ```
  This will save the results to a json file, `my_ip_addresses.json`

- You can then use `jq` (or any other tool of your choice) to transform the data. For example to extract only all the addresses, you could:

  ```bash
  cat my_ip_addresses.json | jq '.[] | .address' > ip_addresses.csv
  ```

  Which should create a file, `ip_addresses.csv` that has something like this in it:

  ```
  "10.195.215.39"
  "10.195.215.37"
  "10.195.215.33"
  "10.195.216.35"
  "10.195.216.33"
  "10.195.216.33"
  "10.195.216.47"
  "10.195.216.47"
  "10.195.216.43"
  ```

- The entire command all at once would be:

  ```bash
  export API_TOKEN=PUT_YOUR_TOKEN_HERE
  export SUBDOMAIN=PUT_YOUR_SUBDOMAIN_HERE
  curl -H "Authorization: Bearer $API_TOKEN" "https://$SUBDOMAIN.tidal.cloud/api/v1/ip_addresses" | jq '.[] | .address' > ip_addresses.csv
  ```
