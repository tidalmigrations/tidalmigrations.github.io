---
title: Integrate Tidal Migrations with vSphere
keywords: vsphere, login, configure, sync, environment
last_updated: Feb 13, 2018
sidebar: tidal_toolsbar
permalink: vsphere.html
folder: tidaltools
---



## Getting Started
To get started you will need to have Tidal Tools installed. You can download a copy from https://get.tidal.sh and check out this [article](tidal-tools.html) on how to install.

 

## Supported Versions
### vSphere 5.5
NB: When you set the vsphere.server you will likely need to include the default port, 443, in the url. Ex. 192.168.1:443

### vSphere 6.0

## vSphere Login

If you have not logged on to the Tidal API yet, the [`tidal login` command](#login) will prompt you to login to the *Tidal API*  with your credentials, and
then it will also prompt you to login to *vSphere*.

However, if you are already logged on to the Tidal API, you can skip to execute the `tidal login vsphere` command, which will _only_ prompt you to 
login to vSphere.

If you do wish to login to your vSphere account, you can select the option `y`:

After which, a set of prompts will appear to help you connect to your vSphere account:

1. vSphere Server
2. vSphere Username
3. vSphere Password
4. vSphere API Endpoint
5. Use SSL/TLS? 
6. Skip HTTPS certificate checks?

After answering the above prompts, you will see the message _"Login to vSphere successful. Saving config file...Done!"_


## Configure 
Once you have Tidal Tools installed you need to configure access to vSphere and Tidal Migrations.

The credentials can be defined using (1) the tidal config command, (2) with a config file or (3) via environment variables. If a config file is present it will be used, if it is not present environment variables will be used. If none of these are defined, you will be prompted to enter the required details.

 

### 1) Set interactively

You can set your vSphere credentials with the following commands:

``` tidal config set vsphere.username [your username] ```

``` tidal config set vsphere.password [your password] ```

``` tidal config set vsphere.server 192.168.1.12 ```

 

### 2) Config file

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

### 3) Environment Variables

If you would like to set these credentials and settings via environment variables, you can use these variables:

- VSPHERE_USERNAME
- VSPHERE_PASSWORD
- VSPHERE_SERVER
- VSPHERE_TLS
- VSPHERE_INSECURE

## Sync {#vsphere-sync}
Syncronizing your vSphere inventory with Tidal Migrations is simple with:

`` tidal sync vsphere ``

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
You can easily split this into two commands to allow you to inject other metadata about your inventory, if needed. To do this simply use the get command to get your inventory. Modify it as you need and then you can use the sync command to upload your data.

1. `tidal get vsphere`, will fetch your vSphere inventory and output JSON (check it out!).

2. Modify the data as you like from Standard Input and then send it to Standard Output.

3. `tidal sync servers`, will take that JSON from STDIN and send it to Tidal Migrations.  

`` tidal get vsphere | ./modify_script.rb | tidal sync servers ``

## Repeat

You can easily set this to run periodically. The integration updates records if they already exist, or creates new records if they don't. Look at setting this command up as a cron job, [here is a great resource on how to do that](https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-on-a-vps).

