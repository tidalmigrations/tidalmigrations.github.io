---
title: Using Tidal Software Offline
parent: Introductions
keywords: tools, tidal-tools, tidal, offline, airgap, discovery
last_updated: November, 2021
summary: "Use Tidal software on offline servers for air gapped discovery"
sidebar: main_sidebar
permalink: tidal-offline.html
---

Sometimes in the discovery process, you need to work on servers which are air-gapped or isolated from the public internet. This guide is a central place for installation and usage of all Tidal offline capable tools.

For these processes, you will also need a server connected to the public internet to build artifacts necessary for the installation and usage of these tools. These guides are written with the assumption that you have a public instance which is connected to your offline instance via SCP, though you could also copy these artifacts over using physical storage media (ie. a USB stick).

# Installation

## Tidal Tools

First, install Docker on both your internet-connected and offline server, and ensure that the docker daemon is running on both servers. To install docker on your offline server from binaries, see [this guide](https://docs.docker.com/engine/install/binaries/).

Follow [this guide](https://guides.tidal.cloud/tidal-tools.html) to install Tidal Tools on your internet connected server.

Next, install Tidal Tools on your offline server with one of two options:

### Option 1: Use SCP to transfer the binary
Tidal Tools is a single binary file, so it's simple to transfer this over to your offline server with SCP.

```bash
scp -r ~/bin/tidal your-user@your-offline-server:target-bin-location
```

Ensure that you transfer the binary over to the `bin` directory of your offline server.

### Option 2: Use the offline installer
As an alternative to using SCP to transfer the tidal tools binary, you can use our offline installer.

Obtain the offline installer for your operating system from [this page](https://get.tidal.sh/) under 'Offline Installer' and move this to your offline server.

Navigate to your offline server, and unzip this file. For example, on linux:

```bash
tar xzvf tidal-linux-amd64-*latest-release*.tar.gz
```

Next, we need to add the Tidal Tools binary to your system path.

On linux, move into the unzipped directory you just created and run:

```bash
mv ./tidal ~/bin/
```

### Create the Tidal Tools archive file for offline use
After completing the above steps, navigate to your online server.

Run the following command:

```bash
tidal backup
```

This creates an archive file with Tidal Tools configuration, and sets up the docker container images for offline use. It will have a name like:

```
tidal-backup-DATE.zip
```

Transfer this file over to your offline server.

### Run tidal restore on your offline server
Move to the offline server.

Run the following command, replacing `tidal-backup-DATE.zip` with your backup file:

```bash
tidal restore tidal-backup-DATE.zip
```

That's it! You're ready to use Tidal Tools offline.

## Machine Stats (For Unix-Like Systems)

{: .note }
Creating the packages archive for offline installation and the actual
offline installation process must be performed on machines with the same OS and
Python versions.

On the machine with an internet connection create the packages archive using the following commands:

```bash
python3 -m pip download -d machine-stats-offline machine-stats
tar czf machine-stats-offline.tar.gz machine-stats-offline
```

Transfer the archive to the machine where you need to perform the offline
installation (replace `<remote-host>` and `<remote-dir>` with the
appropriate values):

```bash
scp machine-stats-offline.tar.gz <remote-host>:/<remote-dir>/
```

On the remote host, extract the archive and switch to extracted directory:

```bash
tar xf machine-stats-offline.tar.gz
cd machine-stats-offline
```

Install Machine Stats and its dependencies:

```bash
python3 -m pip install --no-index --find-links . machine_stats-*.whl
```

# Usage

## Source Code Analysis

{: .note }
This feature is currently in beta.

Follow [these instructions](#tidal-tools) to install Tidal Tools on your offline server.

Run this command:

```bash
tidal analyze code --offline your-awesome-project
```

This will save the result to an output zip file, called `code_stats.zip` by default.

Send this file to [Tidal support](mailto:support@tidalcloud.com), and they'll upload it to your Tidal workspace for you.

## Gather Machine Stats (For Unix-Like Systems)

### Installation

Follow [the steps outlined above](#machine-stats-for-unix-like-systems) to install Machine Stats on an offline server.

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

Now that you have created a hosts file, you have two options for how to run Machine Stats depending on your needs. For example, you could use Machine Stats to capture data points on your inventory, and then send the result from an online server to your Tidal workspace. Alternatively, You can use Machine Stats to capture statistics on a host for a period of time. The following 2 sections will guide you through both scenarios.

#### Execute Machine Stats Manually

Execute `machine-stats` in your current working directory, and save the result to a `json` file of your choice.

This is useful for performing a test run to ensure you have Machine Stats set up correctly, or for taking a single snapshot of your machines to then upload from your online server to Tidal Platform.

```bash
machine-stats > <path-to-result-file>
```

On an online server with `tidal tools` installed, you can upload this result file to Tidal Platform with the following command.

```bash
tidal sync servers <path-to-result-file>
```
#### Run Machine Stats on a Cron Job

By leveraging cron, you can run Machines Stats on a schedule to gather data over a period of time. This is useful if you want to gather utilization data, for example recording the CPU utilization of your machines over a set period.

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

```
PATH=<full-path>
*/5 * * * * bash <full-path-to-working-directory>/run-machine-stats.sh
```
You can get the value for `<full-path>` by running `echo $PATH`.

The `*/5` means that cron will execute this script every 5 minutes. You can customize this to set the sampling interval of your choosing.

Your results should appear in the existing `<path-to-results-directory>` that you specified in the `run-machine-stats.sh` script. Each result filename will contain a timestamp of when the invocation occurred.
