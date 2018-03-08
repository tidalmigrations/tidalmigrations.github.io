---
title: Authentication
keywords: authentication, login
last_updated: Feb 13, 2018
summary: "Easily authenticate with the Tidal Migrations API"
sidebar: main_sidebar
permalink: index.html
---

## Authenticating a request {#getaccess}
<font size="3"> <i> api/v1/authenticate </i> </font> <br>


The purpose of this document is to show you how to modify HTTP requests
to send authorized requests to the Tidal Migrations API.
However, to send these requests, you must authenticate with the Tidal Migrations
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


This should provide you with an access token and a refresh token. Tidal Migrations's implementation
requires that requests needing authorization contain an additional HTTP `Authorization`
header. There should be two headers present: `Authorization` and `Content-Type`.


| Key                 | Value                  | 
| --------------------|:----------------------:|
| `Authorization`     | `bearer` [acess_token] |
| `Content-Type`      | `application/json`     |


`Content-Type` should be included when performing any request that includes a body in JSON format.

The lifetime of `access_token` and `refresh_token` token is 8 hours. The `expires_in` parameter tells you the token expiration time in seconds.
Once the token is expired, you must re-authenticate. However, it is possible to have permanent access to the API with the use of `refresh_token`.
The Refresh Token can be used to retrieve a brand new Access Token by utilising the [*api/v1/refresh*](#getrefresh) endpoint. 

The Access Token is generated in *JSON Web Tokens (JWTs)* format. It is used to obtain the user's resources.

The response of the request is:

```
{"access_token":"[access_token]",
"refresh_token":"[refresh_token]",
"expires_in":28800,
"token_type":"Bearer"}
```

## Utilising the Ping Endpoint
<font size="3"> <i> api/v1/ping </i> </font> <br>

Verify that you are able to connect to the Tidal Migrations API utilising the `api/v1/ping` endpoint.
This endpoint can also be used to ensure you are authenticated.

You will need:

1. Subdomain -> Refer to [Get Subdomain](https://app.tidalmg.com/?login) & type in your email in the prompt bar.
2. Your access token -> Refer: [api/v1/authenticate](#getaccess)

```
curl -X GET \
  https://[insert your subdomain].tidalmg.com/ping \
  -H 'authorization: bearer [insert your access token]' \
  -H 'content-type: application/json' \
```

This will allow you to successfully connect to the Tidal API!

The response of the above request should be the following:

```
{
    "authenticated": true
}
```


## Refreshing your token {#getrefresh}
<font size="3"> <i> api/v1/refresh </i> </font> <br> 

Refresh the Tidal API.

You will need:

1. Subdomain -> Refer to [Get Subdomain](https://app.tidalmg.com/?login) & type in your email in the prompt bar.
2. Your access token -> Refer: [api/v1/authenticate](#getaccess)
3. Your refresh token -> Refer: [api/v1/authenticate](#getaccess)

```
curl -X POST \
  https://[insert your subdomain].tidalmg.com/api/v1/refresh \
  -H 'authorization: bearer [insert your access token]' \
  -H 'content-type: application/json' \
  -d '{"refresh_token":"[insert your refresh token]"}'
```

The response of the request is:

```
{
    "access_token": "[acess_token]",
    "scope": "offline_access",
    "expires_in": 28800,
    "token_type": "Bearer"
}
```
