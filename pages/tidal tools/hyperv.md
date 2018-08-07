---
title: Gather Windows Machine Statistics
keywords: hyperv, windows, hypervisor, powershell, servers
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

## Requirements and Dependencies

Prior to the steps on syncing your hypervisors, be sure to have the below dependencies installed:

- [Dos2Unix](https://waterlan.home.xs4all.nl/dos2unix.html) is used to convert line breaks in a text file from Unix format to DOS format.
- You will also need [WinRM enabled](https://support.auvik.com/hc/en-us/articles/204424994-How-to-enable-WinRM-with-domain-controller-Group-Policy-for-WMI-monitoring) across your environment for this.
- The scripts needed for this process can be found in [this github repository](https://github.com/tidalmigrations/machine_stats).

## Running the Script

Start syncing your HyperV with Tidal Migrations, by running the script: `runner.ps1`.

{% include note.html content="Be sure to set PowerShell's Execution policy to execute this script before running it. [This guide](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-6) will help you in doing so." %}


1. It will prompt you to set your username.

2. Then, run the script: `save_password.ps1` and enter your password when prompted. This will save your credentials securely in a text file.

3. Save a list of the server hostnames that you would like to sync in a file called: _servers.txt_. 
The data of these servers will be shown in a table, with numerical values rounded to the nearest second decimal.

{% include note.html content="We recommend that you set this script to run periodically so that your HyperV servers are synced on a daily basis and the data is up to date. Here is an [example]( https://docs.microsoft.com/en-us/windows/desktop/taskschd/daily-trigger-example--scripting-) of a scripting task in powershell that runs daily."%}

And there you have it! Your HyperV servers will be synced to Tidal Migrations.
