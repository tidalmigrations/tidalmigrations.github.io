---
toc: false
title: Layering Discovery Techniques
keywords: sync, import
last_updated: July, 2018
summary: "A quick guide on the various discovery techniques and how to layer them together to quickly and accurately discover your environment"
sidebar: main_sidebar
permalink: discovery-techniques.html
---

Cloud migration is the process of moving data, applications, or other elements to the cloud. However, the path to the cloud can be long and painful without proper planning and execution.
By following Tidal Migration's five different layering techniques, we can help you migrate to the cloud with ease!


## 1) Import spreadsheet 

The first step to begin your cloud migration project is importing a spreadsheet of Servers, Virtualization Clusters,
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

## 4) Tidal Discovery Plan - fingerprint web applications 

**a.)** The initial step in your cloud journey is discovering what you have.
It can be hard to remain informed about all the domains registered. Utlize the `tidal discover` tool 
with your customized Discovery Plan to obtain both private and public 
domains registered for your given datacentres in under 60 seconds.

[This](discover.html) will provide you guidance on creating your own Discovery Plan to scan multiple networks and DNS services.

**b.)** The following step in your cloud journey is to analyze the domains obtained from `tidal discover`.
Tidal Analyze will fingerprint the technology on both your internet sites and intranet applications behind your firewall in seconds, without needing to install agents. 
Whether you have 1 or 1 million end points, Tidal Tools will centralize the data gathered in our platform for you to analyze.

Simplify your application centric discovery with Tidal Analyze.

After doing so, you have the option to import these results to the Tidal API, where your domains will appear on the right 
hand side navigation bar under _Assess -> URLs_.

For detailed information and steps on analyzing your FQDNs, be sure to checkout this [guide](analyze.html).





