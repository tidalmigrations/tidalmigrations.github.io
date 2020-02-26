---
toc: false
title: Using Tidal Migrations API with Postman
keywords: postman, swagger, docs, requests, routes
last_updated: Feb 22, 2018
summary: "Accessing all the requests in the Tidal Migrations API with Postman"
sidebar: main_sidebar
redirect_from: postman_docs.html
permalink: postman-docs.html
---

After you have authenticated with the Tidal Migrations API, you can easily
access all the requests that can be performed with the Tidal Migrations API using [Postman](https://www.getpostman.com/).
You will need:
1. Your Subdomain
2. Your Access Token

```
curl -X GET \
  https://[your subdomain].tidalmg.com/api_docs \
  -H 'authorization: bearer [insert your access_token] \

```
This will allow you to access the swagger documentation of the Tidal Migrations API.

1. Copy this documentation from the body.

2. Import a Postman Collection, and select 'Paste Raw Text'

Paste the documentation and you now have access to all the requests that can be performed in the Tidal Migrations API!

{% include image.html file="postman.png" caption="Importing API requests in Postman" %}




