---
title: Gather Machine Stats
keywords:
last_updated: February, 2021
summary: "Gather machine stats from remote environments"
sidebar: main_sidebar
permalink: machine_stats.html
folder: tidaltools
---

## Overview

Getting an accurate view of your infrastructure needs is useful when planning a
cloud migration.  Most datacenter operations groups have a good view of their
overall storage utilization from various SAN and virtualization management
tools, but relying on these aggregated data points often causes teams to
underestimate the storage needs of their applications in the cloud.

When taking an _application-centric_ approach to cloud migration, getting the
resource utilization from each individual server gives you a more accurate view
of each application's resource requirements in the cloud and ignores the
trickery of thin-provisioning from SAN tools.  This allows you to confidently
plan data replication time, or other migration metrics on an app-by-app basis.

{% include tip.html content="As your cloud migration will likely take place
over many months or years, it's important to have current resource requirements
throughout your journey. To accomplish this, setup `machine_stats` in a cron
job or Scheduled Task and synchronize your data on a _daily_ basis to Tidal
Migrations." %}

## Windows

### Introduction

This is a simple and effective way to gather machine stats (RAM, Storage,
CPU) from a Windows Server environment. It uses
[WinRM](https://docs.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management)
to `Invoke-Command` across your servers, creating a JSON file to securely send
to your Tidal Migrations instance using the tidal command.

### Requirements and Dependencies

Prior to the steps on syncing your hypervisors, be sure to have the below
dependencies setup:

- To get started you will need to have Tidal Tools installed. You can check out
  [Getting Started with Tidal Tools](tidal-tools.html) guide on how to install
  it.
- You will need [WinRM
  enabled](https://support.auvik.com/hc/en-us/articles/204424994-How-to-enable-WinRM-with-domain-controller-Group-Policy-for-WMI-monitoring)
  across your environment for this.
- The scripts needed for this process can be found in [Machine Stats for
  Windows GitHub
  repository](https://github.com/tidalmigrations/machine_stats/tree/master/windows).

### Running the Script

Start syncing your Hyper-V with Tidal Migrations, by running the script:
`runner.ps1`.

{% include note.html content="Be sure to set PowerShell's Execution policy to
execute this script before running it. [This
guide](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-6)
will help you in doing so." %}

1. It will prompt you to set your username.

2. Then, run the script: `save_password.ps1` and enter your password when
   prompted. This will save your credentials securely in a text file.

3. Save a list of the server hostnames that you would like to sync in a file
   called: _servers.txt_.  The data of these servers will be shown in a table,
   with numerical values rounded to the nearest second decimal.

{% include note.html content="We recommend that you set this script to run
periodically so that your Hyper-V servers are synced on a daily basis and the
data is up to date. Here is an [example](
https://docs.microsoft.com/en-us/windows/desktop/taskschd/daily-trigger-example--scripting-)
of a scripting task in PowerShell that runs daily."%}

And there you have it! Your Hyper-V servers will be synced to Tidal Migrations.

## Unix-like systems

### Introduction

Machine Stats for Linux/Unix leverages [Ansible](https://www.ansible.com/) to
gather facts in a cross-platform way.

### Requirements and Dependencies

Prior to the steps on syncing your Unix/Linux machines, be sure to have the below
dependencies setup:

- To get started you will need to have Tidal Tools installed. You can check out
  [Getting Started with Tidal Tools](tidal-tools.html) guide on how to install
  it.
- You need to install Python on your local workstation and on the machines you
  need to gather stats from. Please refer to the Machine Stats for Unix-like
  systems [technical
  documentation](https://github.com/tidalmigrations/machine_stats/blob/master/unix/README.md)
  for installation instructions.
- The scripts needed for this process can be found in [Machine Stats for
  Unix-like systems GitHub
  repository](https://github.com/tidalmigrations/machine_stats/tree/master/unix).

### Running the Script

1. Create a `hosts` file in the current directory.

2. Add connection strings in the form of `ssh-user@ip-address` or
   `ssh-user@domain` to the `hosts` file one per line If the `ssh-user@` part
   is omitted, then the current user name is used.

3. If you need to use a custom SSH identity file for some particular host,
   provide it as the following:

    ```
    my-user@example.com ansible_ssh_private_key_file=path/to/key-file.pem
    ```

4. Execute `runner` and pipe its output to Tidal Tools:

    ```
    $ ./runner | tidal sync servers
    ```

For more details on configuration and usage, please check Machine Stats for
Unix-like systems [technical
documentation](https://github.com/tidalmigrations/machine_stats/blob/master/unix/README.md).
