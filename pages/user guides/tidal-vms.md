---
title: Tidal Tools Virtual Machine Image
keywords: vm, virtual, machine, image, ova, ovf, aws, ami, tidal, tools, ubuntu, windows
last_updated: April, 2022
summary: "Tidal Tools virtual image for your migration discovery"
sidebar: main_sidebar
permalink: tidal-discovery-vm.html
---

To help you get your Tidal Migrations discovery done easily and quickly you can use the Tidal Tools virtual machine image. This VM has the latest Tidal Migrations software and dependencies installed for you, so you can focus on getting things done.
It can also perform discovery without any network connectivity to the public internet. To run a discovery in an 'offline' mode checkout [this guide](https://guides.tidalmg.com/tidal-offline.html).

## Ubuntu Server 18.04

The image runs standard [Ubuntu Server (18.04.6)](https://cdimage.ubuntu.com/ubuntu/releases/18.04.6/release/) and has a CLI only interface. It comes with the latest version of [Tidal Tools](https://tidalmigrations.com/tidal-tools/), [Machine Stats](https://pypi.org/project/machine-stats/) and [DNS Tools](https://dnstools.ninja/) installed.

It can be deployed into any virtual environment that is compatible with OVA based images, and is compatible with AMD64 or EM64T architectures.

To get started:

1. [Download the image](https://d2ny8m13pxxvfx.cloudfront.net/tidal-ubuntu-18-04-server-amd64.ova)
2. Deploy the downloaded OVA file into your VMware (or VirtualBox, or any OVA compatible virtual environment)
3. Once the VM is running, log in with the following credentials:

```text
Username: ubuntu
Password: tidal
```

Once you are logged in, we recommend you [change the password](https://www.tomshardware.com/how-to/change-passwords-in-linux) to a unique and secure password.

You can now get started with your [migration discovery](/index.html)!

### Minimum System Requirements

In general the specifications will depend on the number of hosts in your environment that you plan to scan with [Machine Stats](/machine_stats.html). We recommend the following server specifications below, depending on your environment size. These recommendations are intended as a guide only:

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

If you need any help in deploying the VM or getting started with your discovery, [send us a message](mailto:support@tidalmigrations.com) and we can help you get setup.

## Windows Server 2022

The image runs [Windows Server (2022 Datacenter Evaluation)](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022). It comes with the latest version of [Tidal Tools](https://tidalmigrations.com/tidal-tools/) and [Machine Stats](https://pypi.org/project/machine-stats/) installed.

It can be deployed into any virtual environment that is compatible with OVA based images.

To get started:

1. [Download the image](https://d2ny8m13pxxvfx.cloudfront.net/tidal-windows-server-2022.ova)
2. Deploy the downloaded OVA file into your VMware (or VirtualBox, or any OVA compatible virtual environment)
3. Once the VM is running, you can log in with either the following credentials:

```text
Username: vagrant
Password: vagrant
```

```text
Username: Administrator
Password: vagrant
```

Once you are logged in, we recommend you change the password to a unique and secure password.

You can now get started with your [migration discovery](/index.html)!

### Minimum System Requirements

- Memory: 4 GB
- Processors: 2
- Storage space: 40 GB

### Additional features

- Disabled Windows update
- Turned off Hibernation
- Turned off monitor timeout
- Disabled screensaver
- Installed VM tools
- Enabled file sharing
- Enabled remote desktop
