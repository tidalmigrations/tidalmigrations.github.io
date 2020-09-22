---
title: Getting Started with Tidal Tools on Google Cloud Platform</span>
keywords: Google, marketplace, tidal tools
last_updated: November 2, 2020
summary: Configure and use Tidal Tools on Google Cloud Platform (GCP)
sidebar: main_sidebar
permalink: tidal-tools-gcp.html
folder: tidaltools
---

{% include note.html content="
This page describes how to configure and use Tidal Tools on Google Cloud Platform. For general
installation and configuration instructions please refer to [Getting Started
with Tidal Tools](tidal-tools.html) guide.
" %}

## Using Tidal Tools

Tidal Tools is a command-line application. Such applications are also called
CLI (command-line interface) applications. To operate it needs to be run from a
terminal or command-line prompt. Connect to your Tidal Tools Google Cloud Platform Virtual
Machine (VM) and run the following command (i.e type the text written with
monospaced font and press Enter key):

```
tidal
```

The output from the above command should list all the available Tidal Tools
subcommands. Running `tidal help <subcommand>` or `tidal <subcommand> --help`
(change `<subcommand>` with the actual subcommand from the list) will show more
information about that subcommand.

Some of the subcommands, for example `tidal analyze web`, work independently and
immediately provide results. While some other subcommands, for example `tidal
analyze code`, require access to the Tidal Migrations API.

To summarize,

* Tidal Tools seamlessly integrates with the [Tidal Migrations
  API](tidal-tools.html#connecting-to-the-api) and SaaS platform;
* Tidal Tools can be used independently of the API for some features, while
  some features do require access to the API to be used;
* Signing up and using the API is optional when using Tidal Tools.

To see what you can do with `tidal`, checkout some of our other articles about
[creating sync jobs](sync-servers.html) or[ analyzing your
applications](analyze.html) via their URLs.

## Troubleshooting

If you are having problems related to Tidal Tools, [the following
tips](troubleshooting.html) should help you getting things working.
