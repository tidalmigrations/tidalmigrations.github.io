---
title: Sync your Server Inventory (and other resources)
keywords: servers, sync, transform, apps, database instances
last_updated: July 12, 2019
summary: "Sync your data with Tidal Migrations"
sidebar: main_sidebar
permalink: sync-servers.html
folder: tidaltools
---

After having [installed](tidal-tools.html#install) Tidal Tools, begin to sync your inventories with `tidal sync servers`. Tidal sync supports many server inventory management tools such as
VMWare, HyperV, and more.

## What is Syncing?

Syncing is a process that transfers your inventories to your Tidal Migrations account.
When importing your servers to the API, Tidal Migrations's sync tool will check for existing servers, based on their hostname
and update the changed data for those servers.
If the given server to sync does not exist already, it will add that server to the Tidal Migrations platform.


## How do I manually sync my servers?

You can sync any data source with Tidal Migrations by generating a simple JSON document of the data.

This data can be passed as standard input to the `tidal sync servers` command and your servers data will be
synchronized via the API.


The JSON document must be created in the specified format. The top-level key must be "servers",
with a value of an array. The array can consist of the various keys as shown below, describing the server to be synced.
You can also include any other arbitrary fields in the key "custom_fields".

```
{
  "servers": [
    {
        "host_name": "ewrfceapcfg03",
        "description": "This is a general description for this server. The server has several functions. One function is to serve serveral applications. Another is to store some databases.",
        "custom_fields": {
          "tcp_port": 11441,
          "database_software": "SQL 2008 SP3",
          "database_version": "10.0.5538.0"
         },
        "fqdn": "ewrfceapcfg03.com",
        "environment_id": 2,
        "assigned_id": "198",
        "zone": "Data",
        "ram_allocated_gb": 8,
        "storage_allocated_gb": 83.8,
        "storage_used_gb": 52.06,
        "cluster_id": 48337,
        "role": "Administrator",
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

We recommend that you setup your inventories to sync *every 24 hours*, this will keep your resource inventory up to date and accurate over time.

### Transforming your data

If your document is not formatted as the above, not to worry.

Suppose you have a [**csv** file](servers.csv).


Below is a **sample** Ruby script _transform.rb_ that will read the data within the file
passed in as standard input, transform it to the JSON format above and output it as [standard output](serv.json).

```
#!/usr/bin/env ruby
require 'json'
require 'csv'

def to_bool(str)
  if str == "true" || str == "yes"
    str = true
  else
    str = false
  end
  str
end

def transform(input)
    # convert input to proper csv format
    csv = CSV.parse(input,{ encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all} )
    # convert csv to hashmap with key value pairs
    json = csv.map { |row| row.to_hash }
    data = {servers: []}
    json.each do |vm|
        props = {}
        props[:cluster] = {:host_name => vm[:cluster_host_name]}
        props[:custom_fields] = {:tcp_port          => vm[:custom_fields_tcp_port],
                                 :database_software => vm[:custom_fields_database_software],
                                 :database_version  => vm[:custom_fields_version]}

        props[:assigned_id]  = vm[:assigned_id].to_s
        props[:virtual] = to_bool(vm[:virtual])
        c = vm.merge(props)
        data[:servers].push c
    end
    # display data in pretty json format
    puts JSON.pretty_generate(data)
end
data = STDIN.read
transform data
```

The script above is an example of how to easily transform your data into the necessary JSON object. It can be altered to work with your data or it could be rewritten in any language of your choice.

Change the file permissions to make the script executable using:

``` chmod +x ./transform.rb ```

You can now utlise your script with a given CSV file and it will be synced to your account via the API. Utlise the command below:

``` cat some_file.csv | ./transform.rb | tidal sync servers ```

## How do I sync my servers in more automated fashion?

Instead of manually providing all of your servers details, you can utilize [Machine Status](https://github.com/tidalmigrations/machine_stats) utility to gather all the stats from your servers environment. Follow the Machine Stats installation and configuration steps available on the tool's [GitHub page](https://github.com/tidalmigrations/machine_stats).

## How do I sync other resources?

You also have the option of syncing your **Applications** and **Database Instances**.

### Sync your Applications

You can sync your Applications with the following command:

`` cat some_file.json | tidal sync apps ``

When importing your applications to the API, Tidal Migrations's sync tool will check for existing applications, based on their name, and update the changed data for those applications.
If the given application to sync does not exist already, it will add that application to the Tidal Migrations API.

The syncronization of your Applications can be performed by following the above procedure with a simple JSON document of the data:

```
{
"apps": [
    {
      "name": "App_name",
      "custom_fields": {
        "Technologies": "Approval Management System DB"
      },
      "description": "This is a general purpose application that has several functionalities.
      The first functionality is that it is a demo application. The second functionality is
      that it could be a real application as well.",
      "servers": [{
        "host_name": "trpewrcapbiz02"
      }],
      "host_name": "trpewrcapbiz02",
      "urls": "https://approvalmanagementsystem.com",
      "transition_overview": "this is the transition_overview of the application",
      "transition_type": 3,
      "transition_plan_complete": true,
      "source_code_location": [
            "/filepath/location",
            "folder1/file1"
      ]
    }
  ]
}
```

{% include note.html content="[This](https://github.com/tidalmigrations/data-transform/blob/master/scripts/csv_transform.rb) is a similar script as the one above to transform your data into the necessary JSON object for applications." %}
{% include note.html content = "There is also [sample data](https://github.com/tidalmigrations/data-transform/blob/master/data/apps.csv) for applications." %}

### Sync your Database Instances


You can sync your Database Instances with the following command:

`` cat some_file.json | tidal sync dbs ``

When importing your database instances to the API, Tidal Migrations's sync tool will check for existing database instances, based on their name, and update the changed data for those database instances.
If the given database instance to sync does not exist already, it will add it to the Tidal Migrations API.

The syncronization of your Database Instances can be performed by following the above procedure with a simple JSON document of the data:
```
{
  "database_instances" : [
  {
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
    "move_group_id": 3
  }
 ]
}
```
