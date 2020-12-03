---
title: Integrate Tidal Migrations with vSphere
keywords: vsphere, login, configure, sync, environment
last_updated: Dec 2, 2020
sidebar: main_sidebar
permalink: vsphere.html
folder: tidaltools
---
## Getting Started
To get started you will need to make sure you have a copy of [Tidal Tools](https://get.tidal.sh) and it is [installed](tidal-tools.html).

## Supported Versions
### vSphere 5.5
NB: When you set the vsphere.server you will likely need to include the default port, 443, in the url. Ex. 192.168.1:443
### vSphere 6.0

## vSphere Login
If you have not logged on to the Tidal API yet, run `tidal login` to do so.

Once you are logged on to the Tidal API, execute the `tidal login vsphere` command

A set of prompts will appear to help you connect to your vSphere account:

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
Syncronizing your vSphere inventory with Tidal Migrations is simple with:

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

#### Set Manually
You can create a file, for example `config.yml`, with content similar to this:

```
vsphere:
  username: my_user_name_here
  password: my_secure_vsphere_password
  server: 1.1.1.1
tidal:
  email: my_user_name_here
  password: my_secure_password_here
  url: https://my_instance_name_here.tidalmg.com
```
That can be used with a command: `tidal sync vsphere --config config.yml`

### 2) Environment Variables

Another alternative is to set the following environment variables with the needed values and Tidal Tools will use them:

- VSPHERE_USERNAME
- VSPHERE_PASSWORD
- VSPHERE_SERVER
- VSPHERE_TLS
- VSPHERE_INSECURE
