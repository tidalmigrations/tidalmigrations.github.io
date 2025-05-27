---
title: Gather Machine Stats
parent: Discover
keywords: machine, stats, process, cron, job, windows, unix
last_updated: April, 2022
summary: "Gather machine stats from remote environments"
permalink: machine_stats.html
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

{: .tip }
As your cloud migration will likely take place
over many months or years, it's important to have current resource requirements
throughout your journey. To accomplish this, setup `machine_stats` in a [cron job](#run-machine-stats-on-a-cron-job) 
or [Scheduled Task](#run-machine-stats-in-a-scheduled-task) and synchronize your data on a _daily_ basis to Tidal
Migrations.

## Windows

### Introduction

Machine Stats for Windows is an open-source, simple and effective way to gather machine stats (RAM, Storage, CPU) from a Windows Server environment. For the best possible results, we recommend using it with [WinRM](https://docs.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management)
to `Invoke-Command` across your servers.

If WinRM is not the ideal solution for you, we offer an alternative approach backed by WMI. See [this section](#gather-machine-stats-without-winrm) for more information.

Machine Stats for Windows outputs JSON data, which can be saved and uploaded to the Tidal Platform, or piped there directly using Tidal Tools. You can also run Machine Stats in a Windows scheduled task, by following some [additional steps](#run-machine-stats-in-a-scheduled-task).

#### Data captured
By default, the following metrics are captured from the resources

```
CPU Count
CPU name
Host Name
Operating System
Operating System Version
RAM Allocated (GB)
RAM Used (GB)
Storage Allocated (GB)
Storage Used (GB)
```

You can find more information on additional data points [here](https://github.com/tidalmigrations/machine_stats/blob/master/windows/README.md#data-captured)

### Requirements and Dependencies

Prior to the steps on syncing your Windows machines, be sure to have the below
dependencies setup:

- If you want to upload the results of running Machine Stats to the Tidal Platform, you will need to be on a server which is connected to the internet and has Tidal Tools installed. You can check out the [Getting Started with Tidal Tools](tidal-tools.html) guide on how to install it.
- To gather additional data, such as peak and average CPU utilization and process stats, you
  will need [WinRM enabled](https://support.auvik.com/hc/en-us/articles/204424994-How-to-enable-WinRM-with-domain-controller-Group-Policy-for-WMI-monitoring)
  across your environment. See [this section](#gather-machine-stats-without-winrm) for an alternative approach using WMI.
- If you are using the WinRM approach, you will need to add the machines you are reading to your list of trusted hosts. You can trust all hosts with the following command:
  ```powershell
  Set-Item WSMan:localhost\client\trustedhosts -value *
  ```
- The scripts referenced here can be found in [Machine Stats for
  Windows GitHub
repository](https://github.com/tidalmigrations/machine_stats/tree/master/windows). Clone this and navigate to the `machine_stats\windows` directory.
- The main script you'll be executing, `runner.ps1`, is not digitally signed. This is intentional, so that you can make edits to the script if need be. You can change the execution policy of your current (powershell) session with the following command:
  ```powershell
  Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
  ```
  If you'd prefer, you can also bypass the execution policy for each invocation of the script. Simply prepend the following every time you run `runner.ps1`.
  ```powershell
  powershell -ExecutionPolicy Bypass -File runner.ps1
  ```
For more information on `Set-ExecutionPolicy` see Microsoft documentation [here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.2).
- Machine Stats uses the same credentials to connect to all your subject machines. Each machine should be accessible with the same username and password.

### Creating the Password and Servers File

To start, navigate to the `machine_stats\windows` directory and run the script `.\save_password.ps1`. Enter your password when prompted. This will save your credentials securely in a text file.

Next, Save a list of the server hostnames that you would like to sync into a text file (unicode/ascii). Hosts can be specified either as IP addresses or as hostnames that resolve via DNS. In either case, the hostnames and IP addresses must be resolvable (private or global DNS) and routable from the machine that Machine Stats is running on. By default, Machine Stats will search for a file called `servers.txt` in the current folder. If this list was saved in some other file, you can specify its path using the `-ServersPath` parameter.

### Run Machine Stats for Windows

Now that you have your password and `servers.txt` files, you have three options for how to run Machine Stats depending on your needs. You can run the program manually and save the output to a result file. You could use Machine Stats to capture data points on your inventory and send its output to your Tidal workspace. Finally, You can run Machine Stats in a scheduled task to capture statistics on your inventory for a period of time. The following 3 sections will guide you through these scenarios.


#### Execute Machine Stats Manually

Execute Machine Stats in your current working directory, and save the result to a `json` file of your choice.

This is useful for performing a test run to ensure you have Machine Stats set up correctly, or for saving the results of a single invocation when running Machine Stats on an offline server. Ensure you run the following command from the `machine_stats\windows` directory.
```powershell
./runner.ps1 | Out-File <path-to-result-file>
```
Running this will prompt you for a username. Alternatively, you can provide this with the `-UserName` parameter.

```powershell
./runner.ps1 -UserName <username> | Out-File <path-to-result-file>
```
#### Pipe Machine Stats Output to Tidal Platform 

On a machine with Tidal Tools installed and which is connected to the internet, you can execute Machine Stats and pipe its output to Tidal Tools with the following command.
```powershell
./runner.ps1 | tidal sync servers
```
As above, you can provide the username with the `-UserName` parameter.

This approach is useful when you want to take a snapshot of your infrastructure and upload it directly to the Tidal Platform in one command. Since we're uploading the result immediately, this approach will only work on a server which has `tidal tools` installed and which is connected to the internet.

#### Gather Process Stats

You also can optionally capture metrics about processes running on the server using the command-line flag `-ProcessStats`. It will capture the following metadata for each process.

- User
- Process Name
- Process Path
- Memory Used (MB)
- Max Memory Used (MB)
- Total Alive Time
- PID
- PPID

To enable capturing process metrics and pipe the output to Tidal Accelerator add the `-ProcessStats` flag to `runner.ps1`:
```powershell
./runner.ps1 -ProcessStats | tidal sync servers
```
With this, you can also access this information on the Tidal Accelerator platform from `https://my_workspace.tidal.cloud/servers/your_server_id/process-stats`

{% include image.html file="process_stats.png" %}

#### Capture CPU Utilization Time Series Data

To capture point-in-time CPU utilization data, you can use the `-CPUUtilizationOnlyValue` and `-CPUUtilizationTimeout` flags. When run this way, machine stats will capture the current CPU utilization of the machine, rather than peak and average over a given interval.
```powershell
./runner.ps1 -CPUUtilizationOnlyValue -CPUUtilizationTimeout 1
```
sssh-0cconfigYou can use the `-Measurements` flag along with `tidal request` to upload the result to Tidal Accelerator. 
```powershell
./runner.ps1 -CPUUtilizationOnlyValue -CPUUtilizationTimeout 1 -Measurements | tidal request -X POST /api/v1/measurements/import
```
When run in a scheduled task (as outlined in the following section), it's possible to use machine stats to continuously capture CPU utilization data for a given server over time. 

sssh-0cconfig#### Run Machine Stats in a Scheduled Task

To run Machine Stats in a Windows scheduled task, we must first create the script which the scheduled task will execute. If you want to save the results as json files to the current directory, with a timestamp in the filename, you can use something like this (remember to replace `<path>` with the correct path):

`run_default.ps1`:
```powershell
$timestamp = Get-Date -Format "HH-mm-ss"

<path>\runner.ps1 `
-UserName <username> `
-ServersPath "<path>\servers.txt" `
-ServerStatsPath "<path>\server_stats.ps1" `
-SecurePwdFilePath "<path>\SecuredText.txt" `
| Out-File "<path>\result_${timestamp}"

```

For piping the results straight to your Tidal workspace with Tidal Tools, you can use something like this:

`run_tidal_tools.ps1`:
``` powershell
<path>\runner.ps1 `
-UserName <username> `
-ServersPath <path-to-servers.txt> `
-ServerStatsPath "<path>\server_stats.ps1" `
-SecurePwdFilePath "<path>\SecuredText.txt" `
| tidal sync servers
```

If you plan on using this approach, remember to save your password locally using `tidal config set tidal.password 'your-password'`.

We recommend you run your script from the `machine_stats\windows` directory to ensure everything is working correctly. If this works, navigate to a different directory and run the script again, to ensure you have the paths set correctly. If this works, you should be ready to invoke the script using a scheduled task.

__Creating the Task__

1. Download the scheduled task XML file [here](https://s3.ca-central-1.amazonaws.com/vm-images.tidal/MS4W-scheduled-task.xml). With a few tweaks, we can use this to quickly create our own scheduled task.
2. Open `Task Scheduler` and select `import task`. Follow the prompts to import the XML file we just downloaded.
3. Select `Change User or Groups`. Under `Enter the object name to select`, enter the name of the user you’d like to run the script as (for example, `Administrator`).
4. Navigate to the `Triggers` tab and edit the trigger. Change the start datetime to whenever you’d like the task to start.
5. Navigate to the `Actions` tab and, if necessary, edit the script name (default is `run_default`).
6. Hit OK, you’ll be prompted to enter the password for the user you selected in step 3.
7. That’s it, your script should be executed at the time you chose in step 4, and will repeat every 5 minutes for 24 hours. You can edit this in the ‘Triggers’ section if you'd like to customize it further.

### Gather Machine Stats Without WinRM

By default, Machine Stats for Windows uses WinRM to connect to and read data from your machines. If you need to gather machine stats from a non-WinRM environment, we offer an alternative approach backed by Windows Management Instrumentation (WMI).

Using this approach, you will not be able to gather stats on running processes with the `-ProcessStats` flag. You will also not be able to gather peak and average CPU utilization over time. What you can capture is general machine information, as well as point-in-time CPU utilization using the `-CPUUtilizationOnlyValue` flag.

__Requirements__
- Your controller and subject machines should be on the same network, and you should populate the `servers.txt` file with the private IP addresses of your subject machines.
- Your subject machines should have the Windows Management Instrumentation (WMI) firewall rule group enabled. You can enable this with the following command:
  ```powershell
  netsh advfirewall firewall set rule group="Windows Management Instrumentation (WMI)" new enable=yes
  ```

After satisfying the above requirements, you can gather information on your subject machines with the following command:

```powershell
<path-to-machine-stats>/windows/runner.ps1 -NoWinRM
```

Note that this does not collect CPU utilization by default. To include point-in-time CPU utilization in your result, use the following command:

```powershell
<path-to-machine-stats>/windows/runner.ps1 -NoWinRM -CPUUtilizationOnlyValue -CPUUtilizationTimeout 1
```

As with the default behavior, this approach can be used with Tidal Tools, both in a single invocation or running in a scheduled task to gather information over time. You can upload the result file to Tidal Tools, or pipe the result directly, as covered in [this section](#run-machine-stats-for-windows). 

### How Many Subjects Can I Scan At Once?

It depends on how you plan to run Machine Stats.

#### Gather data continuously over time

If you plan to gather data by running Machine Stats on a recurring scheduled task the main limiting factor on the number of hosts that Machine Stats for Windows can scan at once is the period of time between scheduled task invocations.

If you want to invoke your scheduled task every 5 minutes as we recommend, you need to ensure that the scan across your total hosts can complete within 5 minutes. If the scan is still running when the next invocation occurs, after 5 minutes, the data collection will fail. To resolve this, you need to either increase the timing interval to something greater than 5 minutes, or decrease the number of hosts scanned at once.

You can scan up to 250 hosts every 5 minutes with a VM with the following specs: 2 vCPUs (3.1 GHz), 1 GB RAM (DDR4) and 8 GB storage.

If you’d like to gather data more frequently than 5 minutes, for example in 3 minute intervals, you will need to target fewer hosts. We encourage you to perform preliminary tests to determine the number hosts that your VM can effectively gather data from for your given invocation period.

#### Gather data at one point in time

If you are gathering general static information from the hosts, and only need to invoke Machine Stats for Windows once. You can scan up to 800 hosts, in around 15 minutes with a VM with 2 vCPUs (3.1 GHz), 1 GB RAM (DDR4) and 8 GB storage.

### Known Issues in Windows

#### If using local Administrator account, allow remote access

Temporarily set the `LocalAccountTokenFilterPolicy` registry value, located at `[HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]` to 1. This will disable the User Account Control (UAC) restrictions for members of the local administrators group who are accessing resources remotely via Remote Procedure Call (RPC).

## Unix-like systems

### Introduction

Machine Stats for Unix-like Systems leverages [Ansible](https://www.ansible.com/) to
gather facts in a cross-platform way.

#### Data captured
By default, the following metrics are captured from the resources

```
CPU Count
CPU name
FQDN
Host Name
IP Addresses
Operating System
Operating System Version
RAM Allocated (GB)
RAM Used (GB)
Storage Allocated (GB)
Storage Used (GB)
```

You can find more information on additional data points [here](https://github.com/tidalmigrations/machine_stats/blob/master/unix/README.md#data-captured)
### Requirements and Dependencies

Prior to the steps on syncing your Unix/Linux machines, be sure to have the below
dependencies setup:

- If you want to upload the results of running Machine Stats to the Tidal Platform, you will need to be on a server which is connected to the internet and has Tidal Tools installed. You can check out the
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

    ```ssh-config
    my-user@example.com ansible_ssh_private_key_file=path/to/key-file.pem
    ```

### Run Machine Stats

Now that you have created a hosts file, you have three options for how to run Machine Stats depending on your needs. You can run the program manually and save the output to a result file. You could use Machine Stats to capture data points on your inventory and send its output to your Tidal workspace. Finally, You can use Machine Stats to capture statistics on a host for a period of time. The following 3 sections will guide you through these scenarios.

#### Execute Machine Stats Manually

Execute `machine-stats` in your current working directory, and save the result to a `json` file of your choice.

This is useful for performing a test run to ensure you have Machine Stats set up correctly, or for saving the results of a single invocation when running Machine Stats on an offline server.
```bash
machine-stats > <path-to-result-file>
```
On an online server with `tidal tools` installed, you can upload this result file to Tidal Platform with the following command.
```bash
tidal sync servers <path-to-result-file>
```
#### Pipe Machine Stats Output to Tidal Platform 

Execute `machine-stats` and pipe its output to Tidal Tools:
```bash
machine-stats | tidal sync servers
```
This approach is useful when you want to take a snapshot of your infrastructure and upload it directly to the Tidal Platform in one command. Since we're uploading the result immediately, this approach will only work on a server which has `tidal tools` installed and which is connected to the internet.

#### Gather Process Stats

You also can optionally capture metrics about processes running on the server using the command-line flag `--process-stats`. It will capture the following metadata for each process.

- User
- Process Name
- Process Path
- Memory Used (MB)
- Max Memory Used (MB)
- Total Alive Time
- PID
- PPID

To enable capturing process metrics and pipe the output to Tidal Accelerator add the `--process-stats flag` to `machine-stats`:
```bash
machine-stats --process-stats | tidal sync servers
```
With this, you can also access this information on the Tidal Accelerator platform from `https://my_workspace.tidal.cloud/servers/your_server_id/process-stats`

{% include image.html file="process_stats.png" %}

#### Capture CPU Utilization Time Series Data

To capture point-in-time CPU utilization data, you can use the `--cpu-utilization-only-value` and `--cpu-utilization-timeout` flags. When run this way, machine stats will capture the current CPU utilization of the machine.
```bash
machine-stats --cpu-utilization-only-value --cpu-utilization-timeout 1
```
You can use the `-m` switch along with `tidal request` to upload the result to Tidal Accelerator.
```bash
machine-stats --cpu-utilization-only-value --cpu-utilization-timeout 1 -m | tidal request -X POST /api/v1/measurements/import
```
When run in a cron job (as outlined in the following section), it's possible to use machine stats to continuously capture CPU utilization data for a given server over time.

#### Run Machine Stats on a Cron Job

By leveraging cron, you can run Machines Stats on a schedule to gather data over a period of time.

Since we're not piping the result to Tidal Platform, and are instead saving the result files locally, this approach can be used on an offline server.

First, create a script for cron to execute, like the one below. Replace `<path-to-hosts-file>` and `<path-to-results-directory>` with the correct values. Ensure you use full paths, not relative paths. Save this script with a name like `run-machine-stats.sh`.
```bash
#!/bin/bash

timestamp_start=$(date +%T)
machine-stats <path-to-hosts-file> > <path-to-results-directory>/result-${timestamp_start}.json
```
Make the script executable by anyone, so that cron can execute it.
```bash
chmod +x <full-path-to-working-directory>/run-machine-stats.sh
```
Next, open a crontab with `crontab -e`. Copy the following into your crontab.

```cron
PATH=<full-path>
*/5 * * * * bash <full-path-to-working-directory>/run-machine-stats.sh
```
You can get the value for `<full-path>` by running `echo $PATH`.

The `*/5` means that cron will execute this script every 5 minutes. You can customize this to set the sampling interval of your choosing. 

Your results should appear in the existing `<path-to-results-directory>` that you specified in the `run-machine-stats.sh` script. Each result filename will contain a timestamp of when the invocation occurred.

### Recommended Specs

In general the specifications will depend on the number of hosts in your enivronment that you plan to scan with [Machine Stats](/machine_stats.html). We recommend the following server specifications below, depending on your environment size. These recommendations are intended as a guide only:

__Under 250 Hosts__

- 2 CPUs (3.1 GHz)
- 2 GB RAM (DDR4)
- 8 GB Storage

__250 - 800 Hosts__

- 4 CPUs (2.5 GHz)
- 16 GB RAM (DDR4)
- 8 GB Storage

__> 800 Hosts__

If you plan to discover over 800 at once, you can consider two options.

One option is to split your set of hosts into groups of 800 or less and then use one Tidal Tools VM while running Machine Stats for one set at a time. We recommend configuring Machine Stats to capture data every 24 hours, so it is very reasonable to have multiple scans occurring throughout a 24hr period.

The second option, is to also split your set of hosts into groups of 800 or less and then use one Tidal Tools VM for each set. This will allow you to run the discovery concurrently at the same time across all the hosts.

The current supported limit on scanning one group of hosts at once with Machine Stats is 800 hosts. It may be possible to scan more but it might not be reliable and will depend on the exact performance of the virtual hypervisor and network speeds in your environment.

If you need any help in deploying the VM or getting started with your discovery, [send us a message](mailto:support@tidalcloud.com) and we can help you get setup.

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

   ```bash
   virt-stats --connection qemu+ssh://myuser@myhost/system | tidal sync servers
   ```

For more details on configuration and usage, please check Machine Stats for
Hypervisors [technical
documentation](https://github.com/tidalmigrations/machine_stats/blob/master/libvirt/README.md).
