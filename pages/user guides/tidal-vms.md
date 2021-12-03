---
title: Pre-Configured Virtual Machines
keywords: vm, virtual, machine, image, ova, ovf, aws, ami, tidal, tools
last_updated: November, 2021
summary: "Virtual machines pre-configured with Tidal software"
sidebar: main_sidebar
permalink: pre-configured-vms.html
---

To help you get your Tidal Migrations discovery phase up and running, we've created a series of pre-configured virtual machines with common operating systems. These VMs have the latest Tidal software and dependencies installed for you, so you can focus on getting things done.

## Ubuntu 18.04

The Ubuntu-18.04-server-amd64 image comes with [Tidal tools](https://tidalmigrations.com/tidal-tools/) and [Machine Stats](https://pypi.org/project/machine-stats/) installed. To get started, download the Virtual Machine image from the link given below. You can import this OVA file into your VirtualBox or VMware Workstation. Use the following credentials for SSH.

```
Username: vagrant
Password: vagrant
```

The server install images do not have a graphical user interface and are suitable for AMD64 or EM64T architecture-based systems. To know more about this image type, visit [Ubuntu 18.04.6 LTS (Bionic Beaver)](https://cdimage.ubuntu.com/ubuntu/releases/18.04.6/release/).

### Minimum System Requirements

- Memory: 2 GB
- Processors: 2
- Free Storage Space: 64 GB

### Download link

- [tidal-ubuntu-18.04-server-amd64.ova](https://itis2203-home.s3.ap-southeast-2.amazonaws.com/rickroll.jpg)
