---
title: Getting Started with Tidal Tools on Google Cloud Platform
keywords: Google, marketplace, tidal tools, gcp
last_updated: November 2, 2020
summary: Configure and use Tidal Tools from the Google Cloud Marketplace
sidebar: main_sidebar
permalink: tidal-tools-gcp.html
folder: tidaltools
---

Using Tidal Tools you can easily discover and assess your applications and their infrastructure. You can get started and rapidly capture what technologies are in use, on which networks and with what DNS configuration.

{% include note.html content="This page describes how to configure and use Tidal Tools from the Google Cloud Marketplace, it can also be [installed on many other systems](tidal-tools.html)." %}

## Deploying Tidal Tools from the GCP Marketplace

1. Starting at the Tidal Tools page in Google Cloud Marketplace, click the `Launch` button:

    {% include image.html file="gcp_launch.png" %}

2. In the deployment section, enter your preferred zone and machine time, or use the defaults. Click `Deploy`:

    {% include image.html file="deploy.png" %}

3. GCP will deploy a VM Instance in your account, once it is done, you can access it via the `SSH` option:

    {% include image.html file="deployed.png" %}

4. Once logged into the VM instance you can run Tidal Tools, with the `tidal` command:

    {% include image.html file="ssh.png" %}

## Using Tidal Tools

Tidal Tools is used as a command-line interface (CLI) application. To verify and use Tidal Tools, connect to your Tidal Tools GCP Virtual Machine (VM), via SSH, and run the following command:

```
tidal
```

The output from the above command should list all the available Tidal Tools subcommands.

Running `tidal help <subcommand>` (change `<subcommand>` with the actual subcommand
from the list) will show more information about that subcommand.

A useful first step can be to setup [shell completion with Tidal Tools](autocompletion.html), by running:

```
echo "source <(tidal completion bash)" >> ~/.bashrc
```

Some of the subcommands, for example `tidal analyze web`, work independently and immediately provide results.
While some other subcommands, for example `tidal analyze code`,
require access to the [Tidal API](tidal-tools.html#connecting-to-the-api).

To see what you can do with `tidal`, checkout some of our other articles about
[creating sync jobs](sync-servers.html) or [analyzing your
applications](analyze.html) via their URLs.

## Troubleshooting

If you are having problems related to Tidal Tools, [the following tips](troubleshooting.html)
should help you getting things working. If you still need help feel free
to [reach out to us directly](mailto:support@tidalcloud.com) and we would be happy to help.
