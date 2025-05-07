---
toc: false
title: API
keywords: introduction API
last_updated: Feb 22, 2018
summary: "Get started using the Tidal API"
redirect_from: api_getting_started.html
permalink: api-getting-started.html
---

## Tidal API

The guides are designed to help you get familiarized with the necessities of the Tidal API, giving you a quick and clean approach on getting started.
They will help you in understanding the fundamental components the API offers and how to use them.


## What the guides cover

These guides cover common tasks that we find users use the API to complete. If there is something you are looking to do with the API and you are having trouble send us a message at support@tidalcloud.com and we'll help you.

## Tools

You will need to have access to a software that will allow you to make HTTP requests to the API. There are many different tools to choose from. The main functionality you will need is the ability to change the HTTP request method type (`GET`, `POST`, `PUT`, etc), and specifying Headers for the request.

Two tools that we would recommend are either cURL or Postman.

- [cURL](https://curl.haxx.se/download.html) is a CLI utility that is preinstalled on most Linux and macOS OSs, and is also available for Windows. cURL is fully CLI driven, if you are comfortable on the command line then this is a good option.
- [Postman](https://www.getpostman.com/docs/v6/postman/launching_postman/installation_and_updates) is a GUI based application that can run on most major OSs. If APIs are new to you and you aren't comfortable on the command line, this is a better option than cURL.

## Your First (and second) API Request

- The first request you should make is the `/ping` request. Checkout the [Authentication guide](authenticate.html#ping) to try the ping request.

- Once you can ping the API. Give the `/authenticate` request a [try](authenticate.html#getaccess) and authenticate with the API.

## Full API Documentation

You can access all of the API documents via https://[your_subdomain].tidal.cloud/docs/
Replace start of the address above with your Tidal subdomain.
For additional help on getting your subdomain, refer to [Get Subdomain](https://get.tidal.cloud/workspaces) & type in your email in the prompt bar. Afterwards, you will receive an email with all of your workspaces.

{: .toc }
