---
title: Gather Windows Machine Statistics
keywords: hyperv, password
last_updated: July, 2018
summary: "Gather windows machine statistics from a Windows Server environment"
sidebar: tidal_toolsbar
permalink: sync_hyper-v.html
folder: tidaltools
---

To get started you will need to have Tidal Tools installed. You can check out this [article](tidal-tools.html) on how to install it.


Tidal sync supports many server inventory management tools such as VMWare, HyperV, and more. Here we outline the process to sync your HyperV to Tidal Migrations.

## Introduction

This is a simple and effective way to gather machine statistics (RAM, Storage, CPU) from a Windows Server environment. 
It uses WinRM to Invoke-Command across your servers, creating a JSON file to securely send to your Tidal Migrations instance using the tidal command.

## Running the Script

Start syncing your HyperV with Tidal Migrations, by running the script: `runner.ps1`.

{% include note.html content="Be sure to set the permission of this script to be executable before running it." %}

1. It will then prompt you to set your username and password?, and will save your credentials securely in a text file.

    _Note that this is specific to the machine where you encrypted it, therefore, you cannot decrypt with the same account from another machine._

2. Save a list of the server hostnames that you would like to sync in a file called: _servers.txt_. 
The data of these servers will be showed in a table, with numerical values rounded to the nearest second decimal.?

3. This script is set to run periodically so that your HyperV servers are synced on a daily basis and the data is up to date. The integration updates records if they already exist, or creates new records if they don't. ?

And there you have it! Your HyperV servers will be synced to Tidal Migrations.

{% include note.html content="You do need [WinRM enabled](https://support.auvik.com/hc/en-us/articles/204424994-How-to-enable-WinRM-with-domain-controller-Group-Policy-for-WMI-monitoring) across your environment for this." %}