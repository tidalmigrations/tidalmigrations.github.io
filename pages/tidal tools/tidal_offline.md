---
title: Offline Discovery
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

This creates an archive file with Tidal configuration, and sets up the docker container images for offline use. It will have a name like:

`tidal-backup-xxxxxx-xxxxxx.zip`

Transfer this file over to your offline server.

### Run tidal restore on your offline server
Move to the offline server. 

Run the following command:

`tidal restore`

That's it! You're ready to use Tidal Tools offline.

# Usage

## Source Code Analysis

{% include note.html content="This feature is currently in beta." %}

Follow [these instructions](#tidal-tools) to install Tidal Tools on your offline server. 

Run this command:

`tidal analyze code --offline your-awesome-project`.

This will save the result to an output zip file, called `code_stats.zip` by default.

Send this file to Tidal Migrations support, and they'll upload it to your Tidal Migrations workspace for you.
