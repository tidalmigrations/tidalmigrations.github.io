---
title: Sync your Server Inventory (and other resources)
keywords: servers, sync
last_updated: May 25, 2018
summary: "Sync your data with Tidal Migrations"
sidebar: tidal_toolsbar
permalink: sync-servers.html
folder: tidaltools
---

After having [installed](tidal-tools.html#install) Tidal Tools, begin to sync your inventories with `tidal sync servers`. Tidal sync supports many server inventory management tools such as 
VMWare, HyperV, Active Directory connected inventory and more.

## What is Syncing?

Syncing is a process that transfers your inventories to your Tidal Migrations account.
When importing your servers to the API, Tidal Migrations's sync tool will check for existing servers, based on their hostname
and update the changed data for those servers.
If the given server to sync does not exist already, it will add that server to the Tidal Migrations API.


## How do I manually sync my servers?

You can sync any data source with Tidal Migrations by generating a simple JSON document of the data.

This data can be passed as standard imput to `tidal sync servers` command and your records will be
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
        "role": Administrator,
        "cpu_count": 4,
        "ram_used_gb": 2,
        "virtual": true,
        "environment": "Production",
        "cluster": {
          "host_name": "rrfedfds"
        }
    }
  ]
}

```
The syncronization of your servers to Tidal Migrations can be performed with the following command:

`` cat some_file.json | tidal sync servers ``


You can easily set this to run periodically so that your servers are synced on a daily basis and the data is up to date.
This is a [great resource](https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-on-a-vps)
on setting the command as a cron job.

### Transforming your data

If your document is not formatted as the above, not to worry. 

Suppose you have a [**csv** file](servers.csv).


Below is a **sample** Ruby script _transform.rb_ that will read the data
of your specified CSV file, transform it to the JSON format above and output it to a JSON file.

```
#!/usr/bin/env ruby
require 'json'
require 'csv'

def transform()
    csv = CSV.table("servers.csv")
    json = csv.map { |row| row.to_hash }
    File.open('servers.json', 'w') do |file|
        puts json.class
        json.each{|h| 
            h.merge!(key: "cluster")
            h[:cluster] = {:host_name => h[:cluster_host_name]}
            h.delete(:cluster_host_name)
            h.merge!(key: "custom_fields")
            h[:custom_fields] = {:tcp_port => h[:custom_fields_tcp_port],
            :database_software => h[:custom_fields_database_software],
            :database_version => h[:custom_fields_version]}
            h.delete(:custom_fields_tcp_port)
            h.delete(:custom_fields_database_software)
            h.delete(:custom_fields_version)
        }
        file.puts JSON.pretty_generate("servers"=>json)
    end
end

transform()
```

The following script should output the desired [**JSON** file](servers.json).

The script can be altered and written in any language of your choice.

Change the file permissions to make the script executable using:

``` chmod +x ./transform.rb ```

You can now utlise your script with a given JSON file and it will be synced to your account via the API. Utlise the command below:

``` cat some_file.json | ./transform.rb | tidal sync servers ```

## How do I sync other resources?

You also have the option of syncing your **Applications** and **Database Instances**.

### Sync your Applications

You can sync your Applications with the following command:

`` cat some_file.json | tidal sync apps ``

The syncronization of your Applications can be performed by following the above procedure with a simple JSON document of the data:

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

### Sync your Database Instances


You can sync your Database Instances with the following command:

`` cat some_file.json | tidal sync database-instances ``

The syncronization of your Database Instances can be performed by following the above procedure with a simple JSON document of the data:
```
"database_instances" : [
  {
    "id": 13748,
    "database_id": 2,
    "server_id": 48287,
    "created_at": "2018-05-25T05:01:48.533Z",
    "updated_at": "2018-05-25T05:01:48.588Z",
    "name": "720 TASK DB",
    "database_size_mb": 1870,
    "database_path": "C:\\system\\databases\\720_TASK_DB",
    "description": "This is a general description for this database instance. This database primarily purpose it to server an application that needs this data.",
    "custom_fields": {
            "Technologies": "Approval Management System DB"
      },
    "environment_id": 2,
    "move_group_id": 3,
    "environment": {
      "id": 2,
      "name": "Test",
      "created_at": "2018-01-02T16:19:45.213Z",
      "updated_at": "2018-01-02T16:19:45.213Z"
    }
  }
]
```
