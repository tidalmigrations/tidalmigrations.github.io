---
title: Pre-Configured Virtual Machines
keywords: vm, virtual, machine, image, ova, ovf, aws, ami, tidal, tools
last_updated: February, 2022
summary: "Virtual machines pre-configured with Tidal Migrations software"
sidebar: main_sidebar
permalink: pre-configured-vms.html
---

To help you get your Tidal Migrations discovery phase up and running, we've created a pre-configured virtual machine image. This VM has the latest Tidal Migrations software and dependencies installed for you, so you can focus on getting things done.

## Ubuntu 18.04

The Ubuntu-18.04-server-amd64 image comes with the latest version of [Tidal Tools](https://tidalmigrations.com/tidal-tools/), [Machine Stats](https://pypi.org/project/machine-stats/) and [DNS Tools](https://dnstools.ninja/) installed. To get started, download the Virtual Machine image from the link given below. You can import this OVA file into your VirtualBox or VMware Workstation. Use the following credentials to login as an user.

```
Username: vagrant
Password: vagrant
```

The _server install_ images do not have a graphical user interface and are suitable for AMD64 or EM64T architecture-based systems. To know more about this image type, visit [Ubuntu 18.04.6 LTS (Bionic Beaver)](https://cdimage.ubuntu.com/ubuntu/releases/18.04.6/release/).

### Minimum System Requirements

- Memory: 2 GB
- vCPU: 2
- Free Storage Space: 8 GB

### Download link

- [tidal-ubuntu-18.04-server-amd64.ova](https://d2ny8m13pxxvfx.cloudfront.net/tidal-ubuntu-18.04-server-amd64.ova)
