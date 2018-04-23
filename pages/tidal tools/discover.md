---
title: Tidal Discover
last_updated: Feb 13, 2018
summary: "Get a list of FQDNs with Tidal Tools"
sidebar: tidal_toolsbar
permalink: discover.html
folder: tidaltools
---

## Discover Your Applications

The first step in your cloud migration project is discovering what you have.

- Scan multiple networks and DNS services with a *discovery plan*

    `` tidal analyze --plan my_plan.yml ``

<br>
The file *my_plan.yml* must be of the following format:

```
discovery:
  - networks: 10.83.2.0/24
    name: My Datacenter front-end
    tcp_ports:
      - 80
      - 443
    dns_service: aws

  - networks: 10.83.3.0/24
    name: My Other Datacenter front-end
    tcp_ports:
      - 80
      - 443
    path_to_bind: "/etc/bind"

```

It consists of the following fields:


| Field               | Information                                                                                                                                            | Format                      |
| --------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| `networks`          | One or more subnets that you want to include in the process.                                                                                           | [Cidr block notation](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)       
| `name`              | Arbitrary name of the network.                                                                                                                         | Text                      
| `tcp_ports`         | One or more ports used on any of the networks that you want to include.                                                                                | Integer             
| `path_to_bind`      | The location of a [named.conf file](https://www.centos.org/docs/5/html/Deployment_Guide-en-US/s1-bind-namedconf.html) for a bind server configuration.                                                                 | File Path         
| `dns_service`       | Name of a DNS service to be analyzed with DNS tools, currently only "aws" service is avaliable which extracts information from route53 zones.          | "aws"                  


This will output a set of FQDNs for your defined discovery plan. Be sure to varify the outputted FQDNs that you'd want to analyze.
Once you have varified the list of FQDNs, you have the option to save it as a file with the flag: `-f my_urls.txt`.

## Next Step

Having discovered your applications, here is a [guide](analyze.html) on analyzing your FQDNs.