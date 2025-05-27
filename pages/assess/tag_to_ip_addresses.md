---
title: Get All IP addresses for applications by their tag
parent: Assess
keywords: ip, address, tags, export
last_updated: February 2020
summary: "How to use the API to retrieve all IP addresses for all applications with a given tag."
permalink: tag-to-ip-addresses.html
---

# Setup

First you will need to have:

- jq and cURL installed

- have access to the internet and your account at https://get.tidal.cloud

- and a terminal with bash.

To get setup you will need to [get an API token](/authenticate.html). With that and your account subdomain, you can set these two variables:

```bash
export API_TOKEN=eyJhbG...TkVRdyJ9.eyJpc3...gZW1hafQ.Ozwb...fE7DiaA

export SUBDOMAIN=demo
```

_NB: If you would rather use [nodejs you can use this script](https://github.com/tidalmigrations/gists/blob/master/fetch_ip_addresses.js) to do the same task._

You can find also get a copy of all the code for the [two](https://github.com/tidalmigrations/gists/blob/master/search_tags.sh) [scripts](https://github.com/tidalmigrations/gists/blob/master/fetch_ip_addresses.sh) below from the [gists](https://github.com/tidalmigrations/gists).

# Get the Tag

First step is to find the tag we want to filter our applications by, here we search for a tag with `dev`:

```bash
curl -sS "https://$SUBDOMAIN.tidal.cloud/api/v1/tags?search=dev" -H "Authorization: Bearer $API_TOKEN" | jq .
```

In this case it returns all the tags with `dev` included, here we will need the tag id, `197`.
```json
[
  {
    "id": 197,
    "name": "Development",
    "created_at": "2019-09-13T15:08:03.227Z",
    "updated_at": "2019-09-13T15:08:03.227Z"
  }
]
```

# Get the IP addresses

Now we get all the applications with this tag, their associated server dependencies, and those servers IP addresses.

Set the tag ID you want to use from above:

```bash
# Set this from above
TAG_ID=187
```

Run the following and the results will be in `ip_addresses.txt`
```bash
# Get all the applications with that tag:
app_ids=$(curl -sS "https://$SUBDOMAIN.tidal.cloud/api/v1/apps?tag_id=$TAG_ID" -H "Authorization: Bearer $API_TOKEN" | jq ".[] | .id" )

# 3 - For each app ID get all the dependencies for each application
server_ids=()
while IFS= read -r id ; do
  server_ids+=$(curl -sS "https://$SUBDOMAIN.tidal.cloud/api/v1/apps/$id/dependencies" -H "Authorization: Bearer $API_TOKEN" | jq '.children | .[] | select(.type == "Server") | .id')
done <<< "$app_ids"

# Format ids
server_ids=$(echo $server_ids | jq -Rr 'gsub(" "; "\n")')

# 4 - For each server dependencies for the application, get all it's IP addresses
ip_addresses=()
while IFS= read -r id ; do
  ip_addresses+=$(curl -sS "https://$SUBDOMAIN.tidal.cloud/api/v1/servers/$id" -H "Authorization: Bearer $API_TOKEN"  | jq '.ip_addresses | .[] | .address')
done <<< "$server_ids"

# Format ids
ip_addresses=$(echo $ip_addresses | jq -Rr 'gsub(" "; "\n")')

echo "All the IP addresses for given tag, are in the file: ip_addresses.txt"
echo $ip_addresses > ip_addresses.txt
```
