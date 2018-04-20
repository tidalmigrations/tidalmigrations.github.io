---
title: Tidal Analyze
keywords: install, login
last_updated: Feb 13, 2018
summary: "Analyze Tidal Tools"
sidebar: tidal_toolsbar
permalink: analyze.html
folder: tidaltools
---

## Analyze Applications
Rapidly capture what technologies are in use, on which networks and with what DNS configuration.

tidal analyze will fingerprint the technology on both your internet sites and intranet applications behind your firewall in seconds, without needing to install agents. Whether you have 1 or 1 million end points, tidal-tools will centralize the data gathered in our platform for you to analyze.

Simplify your application centric discovery.

## Analyzing more than one URL

As it happens, most folks have multiple applications in their environment that they would like to assess and migrate to the cloud. There are a couple of ways to assess multiple applications, depending on what data you have, you might try these options:

 

Simply save a list of URLs in a text file and use that as input.

`` tidal analyze my_urls.txt --upload ``

You can also utlise [(link to tidal discover - which will output the urls )] as input.

`` tidal discover [urls output] | tidal analyze ``

Scan multiple networks and DNS services with a "discovery plan"

`` tidal analyze --plan my_plan.yml ``

The file *my_plan.yml* must be of the following format:

```
discovery:
  - networks: 10.83.2.0/24
    name: My Datacenter front-end
    tcp_ports:
      - 80
      - 443
    dns_service: route53

  - networks: 10.83.3.0/24
    name: My Other Datacenter front-end
    tcp_ports:
      - 80
      - 443
    path_to_bind: "/etc/bind"

```

It consists of the following "fields"?

| Key                 | Value                       | 
| --------------------|:---------------------------:|
| `networks`           | [definition/info]           |
| `name`              | Name of the application    |
| `tcp_ports`         | [definition/info]           |   
| `path_to_bind`      | [definition/info]           |
| `dns_service`       | [definition/info]           |


## Uploading to Tidal API

After recieving these results, you can upload it to the Tidal API with the following flag:

`--upload `

You also have the option to save the results in a JSON file to upload at a later time. This can be done with the flag:

`--upload-file string`

