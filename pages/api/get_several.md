---
toc: false
title: Getting Apps and Resources within your Move Group
keywords: databases, server, apps, movegroups
last_updated: Feb 22, 2018
summary: "Get all your Move Groups and their associated Applications, Databases and Servers."
sidebar: main_sidebar
redirect_from: getallmovegroups.html
permalink: get-all-move-groups.html
---

Before using each endpoint, you must authenticate to the Tidal Migrations API:
[Authentication Guide](index.html)

Once you have authenticated with the Tidal API, utilising each endpoint is super simple.
For any additional details regarding the endpoint, checkout the Tidal API documentation.
(https://[your subdomain].tidalmg.com/docs/)

## Getting all the Move Groups:
#### GET api/v1/move_groups {#getallmg}

Returns a collection of all the move groups and its applications, database instances, and servers.

### Example Request

You will need:

1. Your subdomain -> Refer: [Get Subdomain](https://app.tidalmg.com/?login) & type in your email in the prompt bar.
2. Your access token -> Refer: [Authentication Guide](index.html)

```
curl -X GET \
  https://[insert your subdomain].tidalmg.com/api/v1/move_groups \
  -H 'authorization: bearer [insert your access_token]' \
  -H 'content-type: application/json' \
```
### Example Response

You can access your Applications, Database Instances and Serves within all the move groups.

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
        }
    ],
    "apps": [
        {
            "id": 6645,
            "name": "Archive Information Data System",
            "description": "This is a general purpose application that has serveral functionalities. The first functionality is that it is a demo application. The second functionality is that it could be a real application as well.",
            "url": "https://archiveinformationdatasystem.com",
            "created_at": "2018-02-22T05:03:20.285Z",
            "updated_at": "2018-02-22T05:13:25.796Z",
            "custom_fields": null,
            "environment_id": 1,
            "move_group_id": 80,
            "transition_overview": null,
            "transition_plan_complete": null,
            "business_owner_id": null,
            "technical_lead_id": null,
            "transition_type": null,
            "contacts": [],
            "customers": [
                {
                    "id": 1,
                    "name": "ADA",
                    "created_at": "2018-01-03T05:04:14.970Z",
                    "updated_at": "2018-01-03T05:04:14.970Z"
                }
            ],
            "source_code_location": [
                "/filepath/location",
                "folder1/file1"
            ]
        }
    ],
    "database_instances": [
        {
            "id": 6640,
            "database_id": null,
            "server_id": 23149,
            "created_at": "2018-02-22T05:02:47.294Z",
            "updated_at": "2018-02-22T05:13:26.263Z",
            "name": "Archive Information Data System DB",
            "database_size_mb": 659,
            "database_path": "C:\\system\\databases\\Archive_Information_Data_System_DB",
            "description": "This is a general description for this database instance. This database primarily purpose it to server an application that needs this data.",
            "custom_fields": null,
            "environment_id": 2,
            "move_group_id": 80
        }

    ]
  },
  {
        "id": 81,
        "communications": "This can be used to track the number of contacts that *have* and *need* to be contacted.",
        "notes": "Here is a sample note. It **is** markdown friendly!",
        "created_at": "2018-02-22T05:13:26.356Z",
        "updated_at": "2018-02-22T05:13:26.356Z",
        "name": "Move Group - Nov 25",
        "servers": [
            {
                "id": 23238,
                "host_name": "trpewrcapmdw38",
                "created_at": "2018-02-22T05:02:04.016Z",
                "updated_at": "2018-02-22T05:13:26.389Z",
                "description": "This is a general description for this server. The server has several functions. One function is to serve serveral applications. Another is to store some databases.",
                "custom_fields": null,
                "fqdn": "trpewrcapmdw38.com",
                "environment_id": 3,
                "assigned_id": "73",
                "zone": "Logic",
                "ram_allocated_gb": 2,
                "storage_allocated_gb": 90,
                "storage_used_gb": 39.68,
                "cluster_id": 23150,
                "role": null,
                "cpu_count": 4,
                "ram_used_gb": 2,
                "move_group_id": 81,
                "virtualization_cluster_id": null,
                "virtual": null,
                "cpu_name": null,
                "operating_system": null,
                "operating_system_version": null
            }
        ],
        "apps": [
            {
                "id": 6646,
                "name": "Assessment Information System",
                "description": "This is a general purpose application that has serveral functionalities. The first functionality is that it is a demo application. The second functionality is that it could be a real application as well.",
                "url": "https://assessmentinformationsystem.com",
                "created_at": "2018-02-22T05:03:20.544Z",
                "updated_at": "2018-02-22T05:13:27.986Z",
                "custom_fields": null,
                "environment_id": 1,
                "move_group_id": 81,
                "transition_overview": null,
                "transition_plan_complete": null,
                "business_owner_id": null,
                "technical_lead_id": null,
                "transition_type": null,
                "contacts": [],
                "customers": [
                    {
                        "id": 1,
                        "name": "ADA",
                        "created_at": "2018-01-03T05:04:14.970Z",
                        "updated_at": "2018-01-03T05:04:14.970Z"
                    }
                ],
                "source_code_location": [
                    "/filepath/location",
                    "folder1/file1"
                ]
            }

        ]
    }
]

```
## Getting a *specific* Move Group:

#### GET api/v1/move_groups/[id]

Returns the selected move group and its applications, database instances, and servers.

### Example Request

You will need:

1. Your subdomain -> Refer: [Get Subdomain](https://app.tidalmg.com/?login) & type in your email in the prompt bar.
2. Your access token -> Refer: [Authentication Guide](index.html).
3. Your Move Group ID -> Refer to the [above request](#getallmg) to get your move group id.

```
curl -X GET \
  https://[insert your subdomain].tidalmg.com/api/v1/move_groups/[insert move_group id] \
  -H 'authorization: bearer [insert your access_token]' \
  -H 'content-type: application/json' \
```

### Example Response

You can access your Applications, Database Instances and Serves within the selected move group.

```

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
        }
    ],
    "apps": [
        {
            "id": 6645,
            "name": "Archive Information Data System",
            "description": "This is a general purpose application that has serveral functionalities. The first functionality is that it is a demo application. The second functionality is that it could be a real application as well.",
            "url": "https://archiveinformationdatasystem.com",
            "created_at": "2018-02-22T05:03:20.285Z",
            "updated_at": "2018-02-22T05:13:25.796Z",
            "custom_fields": null,
            "environment_id": 1,
            "move_group_id": 80,
            "transition_overview": null,
            "transition_plan_complete": null,
            "business_owner_id": null,
            "technical_lead_id": null,
            "transition_type": null,
            "contacts": [],
            "customers": [
                {
                    "id": 1,
                    "name": "ADA",
                    "created_at": "2018-01-03T05:04:14.970Z",
                    "updated_at": "2018-01-03T05:04:14.970Z"
                }
            ],
            "source_code_location": [
                "/filepath/location",
                "folder1/file1"
            ]
        }
    ],
    "database_instances": [
        {
            "id": 6640,
            "database_id": null,
            "server_id": 23149,
            "created_at": "2018-02-22T05:02:47.294Z",
            "updated_at": "2018-02-22T05:13:26.263Z",
            "name": "Archive Information Data System DB",
            "database_size_mb": 659,
            "database_path": "C:\\system\\databases\\Archive_Information_Data_System_DB",
            "description": "This is a general description for this database instance. This database primarily purpose it to server an application that needs this data.",
            "custom_fields": null,
            "environment_id": 2,
            "move_group_id": 80
        }

    ]
}

```

