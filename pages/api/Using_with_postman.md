---
title: Using Tidal Migrations API with Postman
tags: [postman]
keywords: postman, swagger, docs
last_updated: Feb 22, 2018
summary: "Accessing all the requests in the Tidal Migrations API with Postman"
sidebar: main_sidebar
permalink: postman_docs.html
---

# Guide to using Tidal Migrations API with Postman

After you have authenticated with the Tidal Migrations API, you can easily
access all the requests that can be performed with the Tidal Migrations API using Postman.
You will need: 
1. Your Subdomain
2. Your Access Token

```
curl -X GET \
  https://{your subdomain}.tidalmg.com/api_docs \
  -H 'authorization: bearer [insert your access_token] \
  
```
This will allow you to access the swagger documentation of the Tidal Migrations API.

[Step 1] Copy this documentation from the body.

[Step 2] Import a Postman Collection, and select 'Paste Raw Text'

Paste the documentation and you now have access to all the requests that can be performed in the Tidal Migrations API!




