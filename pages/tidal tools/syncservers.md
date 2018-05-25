---
title: Sync your Server Inventory (and other resources)
keywords: servers, sync
last_updated: May 25, 2018
summary: "Sync any data source with Tidal Migrations"
sidebar: tidal_toolsbar
permalink: sync-servers.html
folder: tidaltools
---

After having [installed](tidal-tools.html#install) Tidal Tools, begin to sync your inventories with `tidal sync servers`. Tidal sync supports many server inventory management tools such as 
VMWare, HyperV, Active Directory connected inventory and more.

## What is Syncing

Syncing is a process that transfers your inventories to your Tidal Migrations account.
When importing your servers to the API, Tidal Migrations's sync tool will check for existing servers 
and update the changed data for those servers.
If the given server to sync does not exist already, it will add that server to the Tidal Migrations API.

The syncronization of your servers to Tidal Migrations can be performed with the following command:

`` cat some_file.json | tidal sync servers ``


You can easily set this to run periodically so that your servers are synced on a daily basis and the data is up to date.
This is a [geat resource](https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-on-a-vps)
on setting the command as a cron job.

## How do I manually sync my servers?

You can sync any data source with Tidal Migrations by generating a simple JSON document of the data.

This data can be passed as standard imput to the `tidal sync servers` command and the records will be
synchronized on the Tidal API.


The JSON document must be created in the specified format. The top-level key must be "servers",
with a value of an array. The array can consist of various keys describing the server to be synced, as shown.
You can also include any other arbitrary fields in the key "custom_fields".

```
{
  "servers": [
    {
        "id": 48719,
        "host_name": "ewrfceapcfg03",
        "created_at": "2018-05-25T05:00:48.521Z",
        "updated_at": "2018-05-25T05:00:48.615Z",
        "description": "This is a general description for this server. The server has several functions. One function is to serve serveral applications. Another is to store some databases.",
        "custom_fields": {
            "Technologies": "Approval Management System DB"
        },
        "fqdn": "ewrfceapcfg03.com",
        "environment_id": 2,
        "assigned_id": "198",
        "zone": "Data",
        "ram_allocated_gb": 8,
        "storage_allocated_gb": 83.8,
        "storage_used_gb": 52.06,
        "cluster_id": 48337,
        "role": null,
        "cpu_count": 4,
        "ram_used_gb": 2,
        "virtual": null,
        "environment": {
          "id": 2,
          "name": "Test",
          "created_at": "2018-01-02T16:19:45.213Z",
          "updated_at": "2018-01-02T16:19:45.213Z"
        },
        "cluster": {
          "host_name": "rrfedfds"
        }
    }
  ]
}

```


### Alternative

If your JSON document is not formatted as the above, not to worry. Below is a **sample** Ruby script _transform.rb_ that will read the data
from standard input, transform it to the JSON format above and display it to standard output.

The script can be altered and written in any language of your choice.

```
require 'json'

def transform(input)
 json = JSON.parse(input)
 data = {servers: []}
 json.each do |vm|
   props = {}
   config = vm["Summary"]["Config"]
   run = vm["Runtime"]
   props[:host_name] = config["Name"]
   props[:assigned_id] = config["InstanceUuid"]
   props[:ram_allocated_gb] = config["MemorySizeMB"] / 1024
   props[:cpu_count] = config["NumCpu"]
   props[:ram_used_gb] = run["MaxMemoryUsage"] / 1024
   props[:virtual] = true
   # You can pull in data from other sources here
   # or you can generate it conditionally based on the input data
   custom = {:owner "John"}
   props[:custom_fields] = custom
   props[:cluster] = {host_name: "cls1"}
   data[:servers].push props
 end
 puts JSON.generate data
end

data = STDIN.read
transform data

```

Change the file permissions to make the script executable using:

``` chmod +x ./transform.rb ```

You can now utlise your script with a given JSON file and it will be synced to your account via the API.

## How do I sync other resources?

You also have the option of syncing your **Applications** and **Database Instances**.

#### Sync your Applications

The syncronization of your Applications can be performed by following the above procedure with a simple JSON document of the following data:

```
"apps": [
    {
      "name": "App_name",
      "custom_fields": {
        "Technologies": "Approval Management System DB"
      },
      "description": "This is a general purpose application that has serveral functionalities. 
      The first functionality is that it is a demo application. The second functionality is 
      that it could be a real application as well.",
      "servers": {
        "host_name": "trpewrcapbiz02"
      },
      "host_name": "trpewrcapbiz02",
      "urls": "https://approvalmanagementsystem.com",
      "transition_overview": "this is the transition_overview of the application",
      "transition_type": 3,
      "transition_plan_complete": true
    }
  ]
```
#### Sync your Database Instances

The syncronization of your Database Instances can be performed by following the above procedure with a simple JSON document of the following data:

```
"database_instances" : [
  {
    "id": 13748,
    "database_id": null,
    "server_id": 48287,
    "created_at": "2018-05-25T05:01:48.533Z",
    "updated_at": "2018-05-25T05:01:48.588Z",
    "name": "720 TASK DB",
    "database_size_mb": 1870,
    "database_path": "C:\\system\\databases\\720_TASK_DB",
    "description": "This is a general description for this database instance. This database primarily purpose it to server an application that needs this data.",
    "custom_fields": null,
    "environment_id": 2,
    "move_group_id": null,
    "environment": {
      "id": 2,
      "name": "Test",
      "created_at": "2018-01-02T16:19:45.213Z",
      "updated_at": "2018-01-02T16:19:45.213Z"
    }
  }
]

```




