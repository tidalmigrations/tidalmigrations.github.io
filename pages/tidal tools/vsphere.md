---
title: Integrate Tidal Migrations with vSphere
keywords: vsphere, login, configure, sync, environment
last_updated: August, 2022
sidebar: main_sidebar
permalink: vsphere.html
folder: tidaltools
---

## Overview

As part of your Cloud Migration journey, it is very important to have a reliable inventory of your infrastructure. Tidal Tools is able to connect to a Hypervisor to synchronize your inventory of virtual machines from vSphere.

This guide will walk you through the steps and necessary configuration to properly integrate with vSphere and capture the following data points on its VMs.

```
- FQDN
- IP Addresses
- HostName
- AssignedID (InstanceUuid)
- RAM Used (gb)
- RAMAllocated (gb)
- CPU Name
- CPU Count
- Storage Used (gb)
- Storage Allocated (gb)
- Operating System
- Operating System Version
- CreatedAt
- UpdatedAt
```


## Requirements
- Tidal Tools. You can check out the [Getting Started with Tidal Tools](tidal-tools.html) guide on how to install it.
- vSphere Credentials.

## Supported Versions

Tidal Tools is able to integrate with the following versions:

| vSphere Version       | Supported  | Notes |
|-----------------------|------------|-------|
| 5.5                   | Yes        | When you set the vsphere.server you will likely need to include the default port, 443, in the url. Ex. 192.168.1:443 |
| 6.0                   | Yes        |       |
| 7.0                   | Yes        |       |



# Authentication

First, you need to login into your workspace. On your Terminal run the login command.

`tidal login`

Once you are logged on to the Tidal API, You can connect to your vSphere account. 
The following command will guide you through a set of prompts:

`tidal login vsphere`


1. vSphere Server - Either an IP address or a FQDN that resolves to the correct IP for the ESXi or vCenter instance
2. vSphere Username - A username that has read access to the vCenter or ESXi instance.
3. vSphere Password - Corresponding password for the user.
4. vSphere API Endpoint - The default is `/sdk`, It can be left as is, unless you know your setup does not use the default.
5. Use SSL/TLS? - The default is to use SSL (y), which can be left unless you know you can't use it.
6. Skip HTTPS certificate checks? - The default is to not skip (n), which can be left unless you know they need to be skipped.

After answering the above prompts, you will see the message:

```
Login to vSphere successful. Saving config file...Done!
```

## Sync {#vsphere-sync}

Synchronizing your vSphere inventory with Tidal Migrations is simple with:

`tidal sync vsphere`

```
Loading data..
Transforming data..
Validating JSON...
Valid.
Logging in to server at https://demo.tidalmg.com as info@tidalmigrations.com
Logged in.
Updating via API..
Update successful
```

You can easily split this into two commands to allow you to inject other metadata about your inventory, if needed.
To do this simply use the get command to get your inventory.
Modify it as you need and then you can use the sync command to upload your data.

1. `tidal get vsphere`, will fetch your vSphere inventory and output JSON (check it out!).

2. Modify the data as you like from Standard Input and then send it to Standard Output.

3. `tidal sync servers`, will take that JSON from STDIN and send it to Tidal Migrations.

```
tidal get vsphere | ./modify_script.rb | tidal sync servers
```

## Repeat
You can easily set this to run periodically. The integration updates records if they already exist, or creates new records if they don't.
Look at [setting this command up as a cron job](https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-on-a-vps) that runs once per day.

## Additional Configuration Options
The integration can be configured with several other methods besides `tidal login`.
You can use these alternate approaches if they better suite your use case.

The other configuration options available are to set values in the configuration file (either interactively or manually) or set environment variables.

The credentials and configuration settings take precedence in the following order:

1. [Environment Variables](#2-environment-variables)
2. [Configuration file](#1-configuration-file)
3. [Prompt in the terminal](#vsphere-login) - If neither are present, you will be prompted to enter the required details and they are stored in the [default configuration file](/tidal-tools.html#configuration-file).

### 1) Configuration File

#### Set Interactively
You can set your vSphere credentials with the following commands:

`tidal config set vsphere.username [your username]`

`tidal config set vsphere.password [your password]`

`tidal config set vsphere.server 192.168.1.12`

The set values are stored in the [default configuration file](/tidal-tools.html#configuration-file).

{% include note.html content="Your configuration file is not encrypted. Only your Tidal Migrations password and vSphere password are encrypted using AES 256 bit encryption." %}


#### Set Manually
You can create a file, for example `config.yml`, with content similar to this:

```
vsphere:
  username: my_user_name_here  
  server: 1.1.1.1
tidal:
  email: my_user_name_here  
  url: https://my_instance_name_here.tidalmg.com
```

{% include note.html content="You can not manually set or edit any passwords in the configuration file. They are stored here only as encrypted values. To persist a password, it must be added by using the `tidal config set` command."%}


That can be used with a command: `tidal sync vsphere --config config.yml`

### 2) Environment Variables

Another alternative is to set the following environment variables with the needed values and Tidal Tools will use them:

- VSPHERE_USERNAME
- VSPHERE_PASSWORD
- VSPHERE_SERVER
- VSPHERE_TLS
- VSPHERE_INSECURE
