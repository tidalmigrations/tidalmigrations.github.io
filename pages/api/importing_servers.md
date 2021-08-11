---

title: Importing Servers
keywords: servers, import, multiple, endpoint, zone
last_updated: Feb 22, 2018
summary: "Importing Servers with the Tidal Migrations API"
sidebar: main_sidebar
redirect_from: import_servers.html
permalink: import-servers.html
---

Tidal Migrations's API includes the import endpoint to help you import your servers.
Before using the endpoint, you must authenticate to the Tidal Migrations API:
[Authentication Guide](index.html)

## Start using the endpoint!

Once you have authenticated with the Tidal API, utilising the endpoint is super simple.
For any additional details regarding the endpoint, checkout the Tidal API documentation.
(https://[your subdomain].tidalmg.com/docs/)

There are various parameters you can define about your server in the body:

*Name, Description, Operating System, Custom fields (custom fields can include any arbitrary data, as a set of key/value pairs), Operating System Version, Ram Allocated gb, Ram Used gb,
Role, Storage Allocated gb, Storage Used gb, fqdn, Hostname, Virtual, Virtualization Cluster and Zone.*

### Importing *one* Server

A request to import *one* server into the Tidal Migrations API looks like this:

You will need:

1. Your subdomain -> Refer to [Get Subdomain](https://get.tidalmg.com/workspaces) & type in your email in the prompt bar. Afterwards, You will receive an email with all of your workspaces.
2. Your authentication access token -> Refer to [Authentication Guide](index.html)
3. Your Server Data -> *A JSON object of your servers. The object should be a list with each element in the list being a server object.*

```
curl -X POST \
  https://[insert your subdomain].tidalmg.com/api/v1/servers/import \
  -H 'authorization: bearer [insert your access_token]' \
  -H 'content-type: application/json' \
  -d '{"servers": [{"custom_fields": {"Technologies": "Python"},"description": "This is a general purpose server that has several functionalities. The first functionality is that it is a demo server. The second functionality is that it could be a real server as well.","fqdn": "dnstools.ninja","host_name": "trpewrcapbiz02","operating_system": "Windows Server","operating_system_version": "Windows 10","ram_allocated_gb": 3,"ram_used_gb": 6,"role": "The role","storage_allocated_gb": 5,"storage_used_gb": 6,"virtual": "true","zone": "Datacenter 1"}]}'
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
        "description": "This is a general purpose server that has serveral functionalities.
        The first functionality is that it is a demo server.
        The second functionality is that it could be a real server as well.",
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
### Importing *multiple* servers

A request to import *multiple* servers into the Tidal Migrations API looks like this:

You will need:

1. Your subdomain -> Refer to [Get Subdomain](https://get.tidalmg.com/workspaces) & type in your email in the prompt bar. Afterwards, You will receive an email with all of your workspaces.
2. Your authentication access token -> Refer to [Authentication Guide](index.html)
3. Your Server Data -> *A JSON object of your servers. The object should be a list with each element in the list being a server object.*

```
curl -X POST \
  https://[insert your subdomain].tidalmg.com/api/v1/servers/import \
  -H 'authorization: bearer [insert your access_token]' \
  -H 'content-type: application/json' \
  -d '{
  "servers": [
    {
      "custom_fields": {
        "Technologies": "Python"
      },
      "description": "This is a general purpose server that has several functionalities.
      The first functionality is that it is a demo server.
      The second functionality is that it could be a real server as well.",
      "fqdn": "dnstools.ninja",
      "host_name": "trpewrcapbiz02",
      "operating_system": "Windows Server",
      "operating_system_version": "Windows 10",
      "ram_allocated_gb": 3,
      "ram_used_gb": 6,
      "role": "The role",
      "storage_allocated_gb": 5,
      "storage_used_gb": 6,
      "virtual": "true",
      "zone": "Datacenter 1"
    },
    {
      "custom_fields": {
        "Technologies": "Ruby"
      },
      "description": "This is a general purpose server that has several functionalities.
      The first functionality is that it is a demo server.
      The second functionality is that it could be a real server as well.",
      "fqdn": "dnstools.ninja",
      "host_name": "trpewrcapbiz02",
      "operating_system": "Windows Server",
      "operating_system_version": "Windows 7",
      "ram_allocated_gb": 3,
      "ram_used_gb": 6,
      "role": "The role",
      "storage_allocated_gb": 5,
      "storage_used_gb": 6,
      "virtual": "false",
      "zone": "Datacenter 1"
    }
  ]
}
'
```

This will allow you to import your servers to the Tidal Migrations API!

The response of the above request should be the following:

```
[
    {
        "id": 24018,
        "host_name": "trpewrcapbiz02",
        "created_at": "2018-02-28T17:28:53.322Z",
        "updated_at": "2018-02-28T17:28:53.322Z",
        "description": "This is a general purpose server that has several functionalities.
        The first functionality is that it is a demo server.
        The second functionality is that it could be a real server as well.",
        "custom_fields": {
            "Technologies": "Python"
        },
        "fqdn": "dnstools.ninja",
        "environment_id": null,
        "assigned_id": null,
        "zone": "Datacenter 1",
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
    },
    {
        "id": 24019,
        "host_name": "trpewrcapbiz02",
        "created_at": "2018-02-28T17:28:53.540Z",
        "updated_at": "2018-02-28T17:28:53.540Z",
        "description": "This is a general purpose server that has several functionalities.
        The first functionality is that it is a demo server.
        The second functionality is that it could be a real server as well.",
        "custom_fields": {
            "Technologies": "Ruby"
        },
        "fqdn": "dnstools.ninja",
        "environment_id": null,
        "assigned_id": null,
        "zone": "Datacenter 1",
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
