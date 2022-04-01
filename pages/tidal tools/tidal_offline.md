---
title: Using Tidal Software Offline
keywords: tools, tidal-tools, tidal, offline, airgap, discovery
last_updated: November, 2021
summary: "Use Tidal software on offline servers for air gapped discovery"
sidebar: main_sidebar
permalink: tidal-offline.html
---

Sometimes in the discovery process, you need to work on servers which are air-gapped or isolated from the public internet. This guide is a central place for installation and usage of all Tidal Migrations offline capable tools.

For these processes, you will also need a server connected to the public internet to build artifacts necessary for the installation and usage of these tools. These guides are written with the assumption that you have a public instance which is connected to your offline instance via SCP, though you could also copy these artifacts over using physical storage media (ie. a USB stick).

# Installation

## Tidal Tools

First, install Docker on both your internet-connected and offline server, and ensure that the docker daemon is running on both servers. To install docker on your offline server from binaries, see [this guide](https://docs.docker.com/engine/install/binaries/).

Follow [this guide](https://guides.tidalmg.com/tidal-tools.html) to install Tidal Tools on your internet connected server.

Next, install Tidal Tools on your offline server with one of two options:

### Option 1: Use SCP to transfer the binary
Tidal Tools is a single binary file, so it's simple to transfer this over to your offline server with SCP.

`scp -r ~/bin/tidal your-user@your-offline-server:target-bin-location`

Ensure that you transfer the binary over to the `bin` directory of your offline server.

### Option 2: Use the offline installer 
As an alternative to using SCP to transfer the tidal tools binary, you can use our offline installer.

Obtain the offline installer for your operating system from [this page](https://get.tidal.sh/) under 'Offline Installer' and move this to your offline server.

Navigate to your offline server, and unzip this file. For example, on linux:

`tar xzvf tidal-linux-amd64-*latest-release*.tar.gz`

Next, we need to add the Tidal Tools binary to your system path.

On linux, move into the unzipped directory you just created and run:

`mv ./tidal ~/bin/`

### Create the Tidal Tools archive file for offline use
After completing the above steps, navigate to your online server.

Run the following command:

`tidal backup`

This creates an archive file with Tidal Tools configuration, and sets up the docker container images for offline use. It will have a name like:

`tidal-backup-DATE.zip`

Transfer this file over to your offline server.

### Run tidal restore on your offline server
Move to the offline server. 

Run the following command, replacing `tidal-backup-DATE.zip` with your backup file:

`tidal restore tidal-backup-DATE.zip`

That's it! You're ready to use Tidal Tools offline.

## Machine Stats (For Unix-Like Systems)

{% include note.html content="Creating the packages archive for offline installation and the actual
offline installation process must be performed on machines with the same OS and
Python versions." %}

On the machine with an internet connection create the packages archive using the following commands:

```console
$ python3 -m pip download -d machine-stats-offline machine-stats
$ tar czf machine-stats-offline.tar.gz machine-stats-offline
```

Transfer the archive to the machine where you need to perform the offline
installation (replace `<remote-host>` and `<remote-dir>` with the
appropriate values):

```console
$ scp machine-stats-offline.tar.gz <remote-host>:/<remote-dir>/
```

On the remote host, extract the archive and switch to extracted directory:

```
$ tar xf machine-stats-offline.tar.gz
$ cd machine-stats-offline
```

Install Machine Stats and its dependencies:

```
$ python3 -m pip install --no-index --find-links . machine_stats-*.whl
```

# Usage

## Source Code Analysis

{% include note.html content="This feature is currently in beta." %}

Follow [these instructions](#tidal-tools) to install Tidal Tools on your offline server. 

Run this command:

`tidal analyze code --offline your-awesome-project`.

This will save the result to an output zip file, called `code_stats.zip` by default.

Send this file to [Tidal Migrations support](mailto:support@tidalmigrations.com), and they'll upload it to your Tidal Migrations workspace for you.

## Database Analysis

Follow [these instructions](#tidal-tools) to install Tidal Tools on your offline server. 

You can now run the database analysis without any external network connectivity, except to your database host itself:

`tidal analyze db --offline databases.yaml`

This will output a zip file called, `tidal-dba-results_DATE.zip` that can then be uploaded (on the online server) to the application for a given database in order to complete the analysis:

`tidal analyze db --upload tidal-dba-results_DATE.zip`

You should receive confirmation that the upload has completed and can navigate to Tidal Migrations to see the results.

## Gather Machine Stats (For Unix-Like Systems)

Follow [these instructions](#machine-stats-for-unix-like-systems) to install Machine Stats on an offline server.

Next, follow [these instructions](https://guides.tidalmg.com/machine_stats.html#creating-the-hosts-file) to create a `hosts` file on your offline server.

From here you have two approaches. You can take a single snapshot of your servers and save this to a `result` file. This file can then be moved to an online server with Tidal Tools installed, and uploaded to Tidal Migrations Platform from there. The instructions for this approach are found [here](https://guides.tidalmg.com/machine_stats.html#execute-machine-stats-manually).

Alternatively, you can set up a `cron` job on your offline server to record data on a schedule over a period of time. The instructions for this are found [here](https://guides.tidalmg.com/machine_stats.html#run-machine-stats-on-a-cron-job).
