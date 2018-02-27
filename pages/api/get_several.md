---
title: Getting Apps and Resources
keywords: databases, server, apps, movegroups
last_updated: Feb 22, 2018
summary: "Getting all movegroups, apps, databases and servers in the Tidal Migrations API."
sidebar: main_sidebar
permalink: getall.html
---

Before using each endpoint, you must authenticate to the Tidal Migrations API: 
[Authentication Guide](index.html)

Once you have authenticated with the Tidal API, utilising each endpoint is super simple.
For any additional details regarding the endpoint, checkout the Tidal API documentation.
(http://[your subdomain].tidalmg.com/docs/)

## GET api/v1/move_groups

Returns a collection of all the move groups that are created by the authenticating user.

### Example Request

You will need:

1. Your subdomain -> Refer to [Get Subdomain](https://app.tidalmg.com/?login) & type in your email in the prompt bar.
2. Your access token -> Refer to [Authentication Guide](index.html)

```
curl -X GET \
  https://[insert your subdomain].tidalmg.com/api/v1/move_groups \
  -H 'authorization: bearer [insert your access_token]' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
```
### Example Response

```
[
    {
        "id": 80,
        "communications": "This can be used to track the number of contacts that *have* and *need* to be contacted.",
        "notes": "Here is a sample note. It **is** markdown friendly!",
        "created_at": "2018-02-22T05:13:25.591Z",
        "updated_at": "2018-02-22T05:13:25.591Z",
        "name": "Move Group - Oct 25",
        "servers": [
            {
                "id": 23156,
                "host_name": "rrfedtogcls14",
                "created_at": "2018-02-22T05:01:56.763Z",
                "updated_at": "2018-02-22T05:13:25.674Z",
                "description": null,
                "custom_fields": null,
                "fqdn": null,
                "environment_id": null,
                "assigned_id": null,
                "zone": null,
                "ram_allocated_gb": null,
                "storage_allocated_gb": null,
                "storage_used_gb": null,
                "cluster_id": null,
                "role": null,
                "cpu_count": null,
                "ram_used_gb": null,
                "move_group_id": 80,
                "virtualization_cluster_id": null,
                "virtual": null,
                "cpu_name": null,
                "operating_system": null,
                "operating_system_version": null
            },
            {
                "id": 23155,
                "host_name": "trpewrcapbiz07",
                "created_at": "2018-02-22T05:01:56.712Z",
                "updated_at": "2018-02-22T05:13:25.684Z",
                "description": "This is a general description for this server. The server has several functions. One function is to serve serveral applications. Another is to store some databases.",
                "custom_fields": null,
                "fqdn": "trpewrcapbiz07.com",
                "environment_id": 1,
                "assigned_id": "7",
                "zone": "Data",
                "ram_allocated_gb": 4,
                "storage_allocated_gb": 80,
                "storage_used_gb": 52.69,
                "cluster_id": 23156,
                "role": null,
                "cpu_count": 2,
                "ram_used_gb": 2,
                "move_group_id": 80,
                "virtualization_cluster_id": null,
                "virtual": null,
                "cpu_name": null,
                "operating_system": null,
                "operating_system_version": null
            }
        ]
    }
]
```

## GET api/v1/apps

Returns a collection of all the apps that are created by the authenticating user.

### Example Request

You will need:

1. Your subdomain -> Refer to [Get Subdomain](https://app.tidalmg.com/?login) & type in your email in the prompt bar.
2. Your access token -> Refer to [Authentication Guide](index.html)

```
curl -X GET \
  https://[insert your subdomain].tidalmg.com/api/v1/apps \
  -H 'authorization: bearer [insert your access_token]' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
```
### Example Response

```
[
    {
        "id": 7047,
        "name": "720 TASK",
        "description": "This is a general purpose application that has serveral functionalities. The first functionality is that it is a demo application. The second functionality is that it could be a real application as well.",
        "url": null,
        "created_at": "2018-02-23T16:45:00.297Z",
        "updated_at": "2018-02-23T16:45:00.297Z",
        "custom_fields": null,
        "environment_id": null,
        "move_group_id": null,
        "transition_overview": null,
        "transition_plan_complete": null,
        "business_owner_id": null,
        "technical_lead_id": 2,
        "transition_type": null,
        "app_database_size_mb": null,
        "customers": [],
        "database_instances": [],
        "servers": [
            {
                "id": 23249,
                "host_name": "trpewrcaprep03",
                "created_at": "2018-02-22T05:02:04.957Z",
                "updated_at": "2018-02-22T05:02:05.010Z",
                "description": "This is a general description for this server. The server has several functions. One function is to serve serveral applications. Another is to store some databases.",
                "custom_fields": null,
                "fqdn": "trpewrcaprep03.com",
                "environment_id": 1,
                "assigned_id": "84",
                "zone": "Data",
                "ram_allocated_gb": 4,
                "storage_allocated_gb": 40,
                "storage_used_gb": 39.95,
                "cluster_id": 23172,
                "role": null,
                "cpu_count": 4,
                "ram_used_gb": 2,
                "move_group_id": null,
                "virtualization_cluster_id": null,
                "virtual": null,
                "cpu_name": null,
                "operating_system": null,
                "operating_system_version": null
            }
        ],
        "contacts": [],
        "urls": [
            {
                "id": 243,
                "scheme": "https",
                "path": "",
                "host": "720task.com",
                "app_id": 7047,
                "created_at": "2018-02-23T16:45:00.425Z",
                "updated_at": "2018-02-23T16:45:00.425Z",
                "url": "https://720task.com",
                "port": 443,
                "query": null
            }
        ],
        "technical_lead": {
            "id": 2,
            "name": "720 TASK DB",
            "email": null,
            "created_at": "2018-02-23T16:44:47.988Z",
            "updated_at": "2018-02-23T16:44:47.988Z"
        },
        "clouds": []
    }
]
```
## GET api/v1/databases

Returns a collection of all databases that are created by the authenticating user.

### Example Request

You will need:

1. Your subdomain -> Refer to [Get Subdomain](https://app.tidalmg.com/?login) & type in your email in the prompt bar.
2. Your access token -> Refer to [Authentication Guide](index.html)

```
curl -X GET \
  https://[insert your subdomain].tidalmg.com/api/v1/databases \
  -H 'authorization: bearer [insert your access_token]' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
```
### Example Response 

```
[
    {
        "id": 1,
        "name": "App_name",
        "created_at": "2018-02-27T16:02:19.670Z",
        "updated_at": "2018-02-27T16:02:19.670Z"
    }
]

```
## GET api/v1/servers

Returns a collection of all servers that are imported by the authenticating user.

### Example Request

You will need:

1. Your subdomain -> Refer to [Get Subdomain](https://app.tidalmg.com/?login) & type in your email in the prompt bar.
2. Your access token -> Refer to [Authentication Guide](index.html)

```
curl -X GET \
  https://[insert your subdomain].tidalmg.com/api/v1/databases \
  -H 'authorization: bearer [insert your access_token]' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
```
### Example Response 

```
[
    {
        "id": 23936,
        "host_name": "720 task",
        "created_at": "2018-02-27T14:38:11.212Z",
        "updated_at": "2018-02-27T14:38:11.212Z",
        "description": null,
        "custom_fields": null,
        "fqdn": "This is a general purpose application that has serveral functionalities. The first functionality is that it is a demo application. The second functionality is that it could be a real application as well.",
        "environment_id": null,
        "assigned_id": null,
        "zone": "720 TASK DB",
        "ram_allocated_gb": 0,
        "storage_allocated_gb": null,
        "storage_used_gb": null,
        "cluster_id": null,
        "role": null,
        "cpu_count": 0,
        "ram_used_gb": null,
        "move_group_id": null,
        "virtualization_cluster_id": null,
        "virtual": null,
        "cpu_name": null,
        "operating_system": null,
        "operating_system_version": null,
        "ip_addresses": []
    }
]

```