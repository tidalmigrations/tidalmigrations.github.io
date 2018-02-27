---
toc: false
title: Importing Servers
keywords: sservers,import
last_updated: Feb 22, 2018
summary: "Importing Servers with the Tidal Migrations API"
sidebar: main_sidebar
permalink: import_servers.html
---

Tidal Migrations's API includes the import endpoint to help you import your servers.
Before using the endpoint, you must authenticate to the Tidal Migrations API: 
[Authentication Guide](index.html)

## Start using the endpoint!

Once you have authenticated with the Tidal API, utilising the endpoint is super simple.
For any additional details regarding the endpoint, checkout the Tidal API documentation.
(http://[your subdomain].tidalmg.com/docs/)

There are various parameters you can define about your server in the body:

*Name, Description, Operating System, Custom fields, Operating System Version, Ram Allocated gb, Ram Used gb,
Role, Storage Allocated gb, Storage Used gb, fqdn, Hostname, Virtual, Virtualization Cluster and Zone.*

A request to import an application into the Tidal Migrations API looks like this:

You will need:

1. Your subdomain
2. Your authentication access token
3. Your Server Data

```
curl -X POST \
  https://[insert your subdomain].tidalmg.com/api/v1/servers/import \
  -H 'authorization: bearer [insert your access_token] \
  -H 'content-type: application/json' \
  -d '{"servers":[{"name": "Server_name"
,"custom_fields": {"Technologies": "Approval Management System DB"}
,"description": "This is a general purpose server that has serveral functionalities. The first functionality is that it is a demo server. The second functionality is that it could be a real server as well."
,"fqdn": "this is the fqdn of the server"
,"host_name":"trpewrcapbiz02"
,"operating_system":"this is the operating system of the server"
,"operating_system_version": "this is the operating system version of the server"
,"ram_allocated_gb": 3
,"ram_used_gb": 6
,"role": "The role"
,"storage_allocated_gb": 5
,"storage_used_gb": 6
,"virtual": "virtual"
,"virtualization_cluster_id": "This is the virtualization_cluster_id of the server"
,"zone": "this is the zone of the server"}]}'
  
```

This will allow you to import your server to the Tidal Migrations API!

The response of the above request should be the following:

```
[
    {
        "id": 24016,
        "host_name": "trpewrcapbiz02",
        "created_at": "2018-02-27T14:52:28.127Z",
        "updated_at": "2018-02-27T14:52:28.127Z",
        "description": "This is a general purpose server that has serveral functionalities. The first functionality is that it is a demo server. The second functionality is that it could be a real server as well.",
        "custom_fields": {
            "Technologies": "Approval Management System DB"
        },
        "fqdn": "this is the fqdn of the server",
        "environment_id": null,
        "assigned_id": null,
        "zone": "this is the zone of the server",
        "ram_allocated_gb": 3,
        "storage_allocated_gb": 5,
        "storage_used_gb": 6,
        "cluster_id": null,
        "role": "The role",
        "cpu_count": null,
        "ram_used_gb": 6,
        "move_group_id": null,
        "virtualization_cluster_id": null,
        "virtual": null,
        "cpu_name": null,
        "operating_system": null,
        "operating_system_version": null
    }
]

```