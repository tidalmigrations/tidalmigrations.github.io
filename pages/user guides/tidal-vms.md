---
title: Tidal Virtual Machine Image
keywords: vm, virtual, machine, image, ova, ovf, aws, ami, ubuntu, windows, server, vmware, virtualbox
last_updated: August, 2022
summary: "Tidal virtual image for your migration discovery"
sidebar: main_sidebar
permalink: tidal-discovery-vm.html
---

To help you speed up your discovery process, you can use a pre-configured Tidal Virtual Machine. These VMs have the latest Tidal software and dependencies installed for you, so you can focus on getting things done.

The Ubuntu Server image can also perform discovery without any network connectivity to the public internet. To run a discovery in an 'offline' mode checkout [this guide](https://guides.tidal.cloud/tidal-offline.html).

{% include note.html content="We recommend you to use the [Ubuntu Server](#ubuntu-server-1804) image unless you want to you want to run Machine Stats on Windows." %}

## Ubuntu Server 18.04

The image runs standard [Ubuntu Server (18.04.6)](https://cdimage.ubuntu.com/ubuntu/releases/18.04.6/release/) and has a CLI only interface. It comes with the latest version of [Tidal Tools](https://tidalcloud.com/tidal-tools/), [Machine Stats](https://pypi.org/project/machine-stats/) and [DNS Tools](https://dnstools.ninja/) installed.

It can be deployed into any virtual environment that is compatible with OVA, VMDK or VHD-based images, and is compatible with AMD64 or EM64T architectures. Like VMware Workstation/Fusion.

To get started:

1. Download the [OVA image](https://d2ny8m13pxxvfx.cloudfront.net/tidal-ubuntu-18-04-server-amd64.ova) or the [VHD image](https://d2ny8m13pxxvfx.cloudfront.net/tidal-ubuntu-server-18-04-amd64-hyperv-disk.vhd)
2. Deploy the downloaded OVA file into your VMware (or VirtualBox, or any OVA-compatible virtual environment) or VHD file into your Hyper-V Manager.
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

If you need any help in deploying the VM or getting started with your discovery, [send us a message](mailto:support@tidalcloud.com) and we can help you get setup.

## Windows Server 2022

The image runs [Windows Server (2022 Datacenter Evaluation)](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022) and comes with a 180-day trial. It can be deployed into any virtual environment that is compatible with OVA, VMDK or VHD-based images. Like VMware Workstation/Fusion.

{% include note.html content="This image comes only with the latest version of
[Tidal Tools](https://tidalcloud.com/tidal-tools/) and [Machine Stats](https://pypi.org/project/machine-stats/)
installed. The Windows image does not contain all the software and tools that are included in the Ubuntu Server image,
since it is only intended to be used when capturing metrics with Machine Stats on a Windows environment." %}

To get started:

1. Download the [OVA image](https://d2ny8m13pxxvfx.cloudfront.net/tidal-windows-server-2022.ova) or the [VHD image](https://d2ny8m13pxxvfx.cloudfront.net/tidal-windows-server-2022-hyperv-disk.vhd)
2. Deploy the downloaded OVA file into your VMware (or VirtualBox, or any OVA-compatible virtual environment) or VHD file into your Hyper-V Manager.
3. Once the VM is running, you can log in with either of the following credentials:

```text
Username: tidal
Password: tidal
```

```text
Username: Administrator
Password: tidal
```

Once you are logged in, we recommend you change the password to one that's more unique and secure.

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
