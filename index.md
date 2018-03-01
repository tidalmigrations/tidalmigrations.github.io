---
title: Authentication
keywords: authentication, login
last_updated: Feb 13, 2018
summary: "Easily authenticate with the Tidal Migrations API"
sidebar: main_sidebar
permalink: index.html

## Authenticating a request
<font size="3"> <i> api/v1/authenticate </i> </font> <br>


The purpose of this document is to show you how to modify HTTP requests
to send authorized requests to the Tidal Migrations API.
However, to send these requests, you must authenticate into the Tidal Migrations
API.

In order to authenticate with the Tidal Migrations API, you must provide your
username and password in the body.

A request to authenticate into the Tidal Migrations API looks like this:

You will need:

1. Subdomain -> Refer to [Get Subdomain](https://app.tidalmg.com/?login) & type in your email in the prompt bar.
2. Username
3. Password

```
  curl -X POST \
  https://[your subdomain].tidalmg.com/api/v1/authenticate \
  -H 'content-type: application/json' \
  -d '{"username":"[insert your email]",
"password": "[insert your password]"}'

```


This should provide you with an access token. Tidal Migrations's implementation
requires that requests needing authorization contain an additional HTTP `Authorization`
header. There should be two headers present: `Authorization` and `Content-Type`.


| Key                 | Value                  | 
| --------------------|:----------------------:|
| `Authorization`     | `bearer` [acess_token] |
| `Content-Type`      | `application/json`     |


`Content-Type` should be included when performing any request that includes a body in JSON format.

## Utilising the Ping Endpoint
<font size="3"> <i> /ping </i> </font> <br>

Varify that your computer is connected to the Tidal API server utlising the `/ping` endpoint.

You will need:


## Refresing your token
<font size="3"> <i> api/v1/refresh </i> </font> <br>
