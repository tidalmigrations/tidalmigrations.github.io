---
toc: false
title: Importing Applications
keywords: apps, import, request, data
last_updated: Feb 13, 2018
summary: "Easily import your applications with the Tidal Migrations API"
sidebar: main_sidebar
redirect_from: importapps.html
permalink: import-apps.html
---

Tidal Migrations's API includes the import endpoint to help you import your applications.
Before using the endpoint, you must authenticate to the Tidal Migrations API:
[Authentication Guide](index.html)

## Start using the endpoint!

Once you have authenticated with the Tidal API, utilising the endpoint is super simple.
For any additional details regarding the endpoint, checkout the Tidal API documentation.
(https://[your subdomain].tidalmg.com/docs/)


A request to import an application into the Tidal Migrations API looks like this:

### You will need:

1. Your subdomain -> Refer to [Get Subdomain](https://get.tidalmg.com/workspaces) & type in your email in the prompt bar. Afterwards, you will receive an email with all of your workspaces.
2. Your authentication access token -> Refer to [Authentication Guide](index.html)
3. Your Application Data -> *A JSON object of your applications. The object should be a list with each element in the list being an application object.*

There are various parameters you can define about your application in the body:

*Name, Description, URL, Custom fields (custom fields can include any arbitrary data, as a set of key/value pairs), Transition Overview, Transition Plan Complete, and Transition
Type.*

```
curl -X POST \
  https://[insert your subdomain].tidalmg.com/api/v1/apps/import \
  -H 'authorization: bearer [insert your access_token] \
  -H 'content-type: application/json' \
  -d '{
  "apps": [
    {
      "name": "App_name",
      "custom_fields": {
        "Technologies": "Approval Management System DB"
      },
      "description": "This is a general purpose application that has serveral functionalities.The first functionality is that it is a demo application. The second functionality is that it could be a real application as well.",
      "servers": {
        "host_name": "trpewrcapbiz02"
      },
      "host_name": "trpewrcapbiz02",
      "urls": "https://approvalmanagementsystem.com",
      "transition_overview": "this is the transition_overview of the application",
      "transition_type": 3,
      "transition_plan_complete": true,
      "source_code_location": "filepath1, filepath2"
    }
  ]
}'
```
This will allow you to import your application to the Tidal Migrations API!

The response of the above request should be the following:

```
[
    {
        "id": 7291,
        "name": "App_name",
        "description": "This is a general purpose application that has serveral functionalities. The first functionality is that it is a demo application. The second functionality is that it could be a real application as well.",
        "url": null,
        "created_at": "2018-02-26T21:27:42.232Z",
        "updated_at": "2018-02-26T21:27:42.232Z",
        "custom_fields": {
            "Technologies": "Approval Management System DB"
        },
        "environment_id": null,
        "move_group_id": null,
        "transition_overview": "this is the transition_overview of the application",
        "transition_plan_complete": null,
        "business_owner_id": null,
        "technical_lead_id": null,
        "transition_type": null,
        "source_code_location": [
            "filepath1",
            "filepath2"
        ]
    }
]
 ```
