---
toc: false
title: Using Tidal API with Postman
parent: API
keywords: postman, swagger, docs, requests, routes
last_updated: Feb 22, 2018
summary: "Accessing all the requests in the Tidal API with Postman"
sidebar: main_sidebar
redirect_from: postman_docs.html
permalink: postman-docs.html
---

After you have authenticated with the Tidal API, you can easily
access all the requests that can be performed with the Tidal API using [Postman](https://www.getpostman.com/).
You will need:
1. Your Subdomain
2. Your Access Token

```bash
curl -X GET \
  https://[your subdomain].tidal.cloud/api_docs \
  -H 'authorization: bearer [insert your access_token] \

```
This will allow you to access the swagger documentation of the Tidal API.

1. Copy this documentation from the body.

2. Import a Postman Collection, and select 'Paste Raw Text'

Paste the documentation and you now have access to all the requests that can be performed in the Tidal API!

{% include image.html file="postman.png" alt="Importing API requests in Postman" %}
