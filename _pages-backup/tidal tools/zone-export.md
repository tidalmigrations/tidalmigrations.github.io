---
title: Exporting a Zonefile from Windows DNS
keywords: zonefile, discovery bind, zone files, dns
last_updated: March 9th, 2021
summary: "This will cover how to export DNS records from a Windows Server that is resolving DNS queries for your environment."
sidebar: main_sidebar
permalink: windows-zone-export.html
folder: tidaltools
---

This command can be run from a Powershell terminal on the Windows DNS server:

```
dnscmd [<servername>] /zoneexport <zonename> <zoneexportfile>
```

The arguments for the command are:
- `servername`	Specifies the DNS server to manage, represented by IP address, FQDN, or host name. If this parameter is omitted, the local server is used.
- `zonename`	Specifies the name of the zone.
- `zoneexportfile`	Specifies the name of the file to create.

There is also the [offical documentation](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/dnscmd#dnscmd-zoneexport-command) from Microsoft.

This command will generate a file that is named what you provided for `zoneexportfile` and it will be located in the `%systemroot%/System32/Dns` directory by defaullt.

# DNS Discovery

Once you have a zonefile generated, you can continue with your discovery by following the [DNS Discovery Guide](/discover.html).
