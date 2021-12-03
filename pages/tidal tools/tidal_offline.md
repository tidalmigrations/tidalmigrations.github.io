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

## Installation

### Tidal Tools

First, install Docker on both your connected and offline server.

Follow [this guide](https://guides.tidalmg.com/tidal-tools.html) to install Tidal Tools on your internet connected server.

{% include note.html content="Tidal Tools is just a single binary, so if you already have it installed on one machine it’s simple to use SCP to copy the binary onto your offline server! Alternatively, you can use our offline installer by following the steps below." %}

Obtain the offline installer for your operating system from [this page](https://get.tidal.sh/) under 'Offline Installer' and move this to your offline server. 

On your internet-connected server, with Tidal Tools already installed, run `tidal backup`. This creates an archive file with Tidal configuration, and sets up the docker container images for offline use. This will output a single archive (.zip) file. Transfer this file over to your offline server.

Move to the offline server. 

Unzip the Tidal Tools offline installer file, for example on linux: 

`tar xzvf tidal-linux-amd64-*latest-release*.tar.gz`

Next, we need to add the Tidal Tools binary to your system path. 

On linux, move into the unzipped directory you just created and run: 

`mv ./tidal ~/bin/`

Run the following command: 

`tidal restore`

That's it! You're ready to use Tidal Tools offline.

## Usage

### Source Code Analysis

{% include note.html content="This feature is currently in beta." %}

Follow [these instructions](#tidal-tools) to install Tidal Tools on your offline server. 

Run `tidal analyze code --offline your-awesome-project`.

This will save the result to an output zip file, called `code_stats.zip` by default.

Send this file to Tidal Migrations support, and they'll upload it to your Tidal Migrations workspace for you.
