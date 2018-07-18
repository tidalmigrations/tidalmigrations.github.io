---
toc: false
title: How to Assess... (title placeholder)
keywords: sync, import
last_updated: July, 2018
summary: "Layering discovery techniques to show value in 60sec, and dig deeper if/when needed"
sidebar: main_sidebar
permalink: discovery-techniques.html
---

... Consisting of 5 different layers: 

#### [ insert introduction ]

## 1) Import spreadsheet 

The first step to begin your cloud migration project is importing a spreadsheet of Servers,
Databases Instances and Applications. Tidal Migration's importer will guide you through mapping your columns to our fields, 
and even create the associations between dependencies if you have captured these.

Find here additional ways on importing your [applications](importapps.html) and [servers](import_servers.html).

## 2) Tidal sync servers/vsphere

Once you have imported your data, you can begin to sync your inventories via [`tidal sync servers`](syncservers.html).
Tidal sync supports many server inventory management tools such as VMWare, HyperV, and more.

If you have inventory within vSphere that you would like to sync, [`tidal sync vsphere`](#vsphere-sync) will do its job for you.

It is useful to setup this process of syncing your inventories on a daily basis, this will keep your resource inventory up to date and accurate over time.


## 3) Tidal sync servers with the machine_stats repo for windows server statistics

Tidal Migrations provides you with a simple and effective way to gather machine statistics (RAM, Storage, CPU) from a Windows Server environment.
It uses WinRM to Invoke-Command across your servers, creating a JSON file to securely send to your Tidal Migrations instance using the tidal command.

Checkout this [guide](sync_hyper-v.html) for a quick and clean approach on syncing your hypervisors.

## 4) Tidal discovery_plan - fingerprint web applications 

The innitial step in your cloud journey is discovering what you have.
Thousands of domains are registered on a daily basis 
and it can be hard to remain informed. Utlize the `tidal discover` tool 
with your customized Discovery Plan to obtain both private and public 
domains registered for your given datacentres in under 60 seconds.

[This](discover.html) will provide you guidance on creating your own Discovery Plan to scan multiple networks and DNS services.



## 5) tidal analyze source code
