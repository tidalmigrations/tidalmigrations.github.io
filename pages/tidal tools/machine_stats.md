---
title: Gather Machine Stats
keywords:
last_updated: December, 2021
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

This is a simple and effective way to gather machine stats (RAM, Storage, CPU)
from a Windows Server environment. For better results, we recommend using it
with
[WinRM](https://docs.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management)
to `Invoke-Command` across your servers. However, it is also possible to
execute in non-WinRM environments, though not all of the stats will be
available to gather in such case. As a result it outputs JSON data which can be
securely sent to your Tidal Migrations workspace using the `tidal` command.

### Requirements and Dependencies

Prior to the steps on syncing your hypervisors, be sure to have the below
dependencies setup:

- To get started you will need to have Tidal Tools installed. You can check out
  [Getting Started with Tidal Tools](tidal-tools.html) guide on how to install
  it.
- To gather additional data, such as CPU utilization and process stats, you
  will need [WinRM
enabled](https://support.auvik.com/hc/en-us/articles/204424994-How-to-enable-WinRM-with-domain-controller-Group-Policy-for-WMI-monitoring)
  across your environment for this.
- The scripts needed for this process can be found in [Machine Stats for
  Windows GitHub
repository](https://github.com/tidalmigrations/machine_stats/tree/master/windows).

### Running the Script

{% include note.html content="Be sure to set PowerShell's Execution policy to
execute this script before running it. [This
guide](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.2)
will help you in doing so." %}

1. To start, run the script `.\save_password.ps1` and enter your password when
   prompted. This will save your credentials securely in a text file.

2. Save a list of the server hostnames that you would like to sync in a file.
   By default, Machine Stats script will search for file called `servers.txt`
   in the current folder. If a list was saved in some other file, you can specify
   its path using the `-ServersPath` parameter for `runner.ps1` script.

3. Run the script `.\runner.ps1`. It will prompt for username. Alternatively,
   you can specify the username using the `-UserName` parameter. The data of
   the list of servers will be shown as a JSON.

4. You can pipe the output of the Machine Stats script directly to the Tidal
   Tools: `.\runner.ps1 | tidal sync servers`

{% include note.html content="We recommend that you set this script to run
periodically so that your servers are synced on a daily basis and the
data is up to date. Here is an [example](
https://docs.microsoft.com/en-us/windows/desktop/taskschd/daily-trigger-example--scripting-)
of a scripting task in PowerShell that runs daily."%}

And there you have it! Your servers will be synced to Tidal Migrations.

### How Many Subjects Can I Scan At Once?

The short answer is that this depends on how you plan to run Machine Stats. If you plan to gather data over time by running Machine Stats on a scheduled job, then particular care needs to be taken choosing the number of subject machines a single controller machine can scan.

This is because under our testing conditions, we have found that the main limiting factor on the number of subjects that Machine Stats for Windows can scan at once is the period of time between scheduled job invocations.

In other words, if you want to invoke your scheduled job every 5 minutes, you need to ensure that the program can complete its scan of your desired number of subject machines within this 5 minutes. If the scan is still running when the next invocation occurs, that scan will fail.

Testing on virtual machines in AWS, we found that a t3.micro instance (full stats below) can scan roughly 250 subject instances safely in 5 minutes. If you’d like to invoke Machine Stats more frequently, for example in 3 minute intervals, you may need to target fewer subjects per controller machine.

If on the other hand you are gathering general information on your servers and need to invoke Machine Stats for Windows only once, we found that an AWS t3.micro instance can scan 800 subject instances in around 15 minutes.

This is intended as a general guide, and your mileage may vary. If you want to run Machine Stats on a scheduled job, we encourage you to perform preliminary tests to determine the number of subject machines your controller machine can safely handle within your invocation period.

__AWS t3.micro__
- vCPUs: 2
- RAM (GB): 1
- Baseline Performance/vCPU: 10%
- Network burst bandwidth (Gbps): 5

## Unix-like systems

### Introduction

Machine Stats for Unix-like Systems leverages [Ansible](https://www.ansible.com/) to
gather facts in a cross-platform way.

### Requirements and Dependencies

Prior to the steps on syncing your Unix/Linux machines, be sure to have the below
dependencies setup:

- If you want to upload the results of running Machine Stats to the Tidal Migrations Platform, you will need to be on a server which is connected to the internet and has Tidal Tools installed. You can check out
  [Getting Started with Tidal Tools](tidal-tools.html) guide on how to install
  it.
- You need to install **Python 3.6+** on your local workstation (control node)
  and **Python 2.6+** or **Python 3.5+** on the machines you need to gather
  stats from (managed nodes). Please refer to the Machine Stats for Unix-like
  systems [technical
  documentation](https://github.com/tidalmigrations/machine_stats/blob/master/unix/README.md)
  for installation instructions.

### Creating the Hosts File

1. Create a file named `hosts` in the current directory.

2. Add connection strings in the form of `ssh-user@ip-address` or
   `ssh-user@domain` to the `hosts` file, one per line. If the `ssh-user@` part
   is omitted, then the current user name is used.

3. If you need to use a custom SSH identity file for some particular host,
   provide it as the following:

    ```
    my-user@example.com ansible_ssh_private_key_file=path/to/key-file.pem
    ```

### Run Machine Stats

Now that you have created a hosts file, you have three options for how to run Machine Stats depending on your needs. You can run the program manually and save the output to a result file. You could use Machine Stats to capture data points on your inventory and send its output to your Tidal workspace. Finally, You can use Machine Stats to capture statistics on a host for a period of time. The following 3 sections will guide you through these scenarios.
#### Execute Machine Stats Manually

Execute `machine-stats` in your current working directory, and save the result to a `json` file of your choice.

This is useful for performing a test run to ensure you have Machine Stats set up correctly, or for saving the results of a single invocation when running Machine Stats on an offline server.

    $ machine-stats > <path-to-result-file>

On an online server with `tidal tools` installed, you can upload this result file to Tidal Migrations Platform with the following command.

    $ tidal sync servers <path-to-result-file>

#### Pipe Machine Stats Output to Tidal Migrations Platform 

Execute `machine-stats` and pipe its output to Tidal Tools:

    $ machine-stats | tidal sync servers

This approach is useful when you want to take a snapshot of your infrastructure and upload it directly to the Tidal Migrations Platform in one command. Since we're uploading the result immediately, this approach will only work on a server which has `tidal tools` installed and which is connected to the internet.

#### Run Machine Stats on a Cron Job

By leveraging cron, you can run Machines Stats on a schedule to gather data over a period of time. This is useful if you want to gather utilization data, for example recording the CPU utilization of your machines over a set period.

Since we're not piping the result to Tidal Migrations Platform, and are instead saving the result files locally, this approach can be used on an offline server.

First, create a script for cron to execute, like the one below. Replace `<path-to-hosts-file>` and `<path-to-results-directory>` with the correct values. Ensure you use full paths, not relative paths. Save this script with a name like `run-machine-stats.sh`.

    #!/bin/bash

    timestamp_start=$(date +%T)
    machine-stats <path-to-hosts-file> > <path-to-results-directory>/result-${timestamp_start}.json

Make the script executable by anyone, so that cron can execute it.

    $ chmod +x <full-path-to-working-directory>/run-machine-stats.sh

Next, open a crontab with `crontab -e`. Copy the following into your crontab.

    PATH=<full-path>
    */5 * * * * bash <full-path-to-working-directory>/run-machine-stats.sh

You can get the value for `<full-path>` by running `echo $PATH`.

The `*/5` means that cron will execute this script every 5 minutes. You can customize this to set the sampling interval of your choosing. 

Your results should appear in the existing `<path-to-results-directory>` that you specified in the `run-machine-stats.sh` script. Each result filename will contain a timestamp of when the invocation occurred.

### Technical Documentation

For more details on configuration and usage, please check Machine Stats for
Unix-like systems [technical
documentation](https://github.com/tidalmigrations/machine_stats/blob/master/unix/README.md).

## Hypervisors (QEMU/KVM) <span class="label label-info">new</span>

### Introduction

Machine Stats for Hypervisors is built on top of [libvirt](https://libvirt.org)
and it gathers facts from virtual machines within a QEMU/KVM environment.

### Requirements and Dependencies

- To get started you will need to have Tidal Tools installed. You can check out
  [Getting Started with Tidal Tools](tidal-tools.html) guide on how to install
  it.
- You need to install **Python 3.6+** on your local workstation.
- You need to have **libvirt 3.0+** on your local workstation and on a remote machine which hosts the QEMU/KVM environment.

Please refer to the Machine Stats for Hypervisors [technical
documentation](https://github.com/tidalmigrations/machine_stats/blob/master/libvirt/README.md)
for installation instructions.

### Running the Script

1. Make up the [connection URI](https://libvirt.org/uri.html) to communicate with a remote environment.

2. Execute `virt-stats` and pipe its output to Tidal Tools:

   ```
   virt-stats --connection qemu+ssh://myuser@myhost/system | tidal sync servers
   ```

For more details on configuration and usage, please check Machine Stats for
Hypervisors [technical
documentation](https://github.com/tidalmigrations/machine_stats/blob/master/libvirt/README.md).
