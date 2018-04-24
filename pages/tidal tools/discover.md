---
title: Tidal Discover
last_updated: April 24, 2018
summary: "Discovering your applications domains and URLs"
sidebar: tidal_toolsbar
permalink: discover.html
folder: tidaltools
---

## Discover Your Applications

The first step in your cloud migration project is discovering what you have.

- Scan multiple networks and DNS services with a *discovery plan*

    `` tidal discover --plan my_plan.yml ``

<br>
The file *my_plan.yml* must be of the following format:

```
discovery:
  - name: Q9 Datacenter front-ends
    networks: 10.83.2.0/24
    tcp_ports:
      - 80
      - 443
    dns_service: aws

  - name: NYC Datacenter front-ends
    networks: 
      - 10.83.3.0/24
      - 10.130.241.0/24 
    tcp_ports:
      - 80
      - 443
    path_to_bind: "/etc/bind/named.conf"

  - name: Tokyo flat-network
    networks: 192.168.0.0/16
    tcp_ports:
      - 80
      - 443
      - 8080
      - 8443
    path_to_zone_files: "~/tokyo_zones/*/**"

```

It consists of the following keys:


| Key               | Information                                                                                                                                            | Format                      |
| --------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| `networks`          | One or more subnets that you want to include in the process.                                                                                           | [Cidr block notation](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)       
| `name`              | Arbitrary name of the network.                                                                                                                         | Text                      
| `tcp_ports`         | One or more ports used on any of the networks that you want to include.                                                                                | Integer             
| `path_to_bind`      | The location of a [named.conf file](https://www.centos.org/docs/5/html/Deployment_Guide-en-US/s1-bind-namedconf.html) for a bind server configuration. | File Path         
| `dns_service`       | Name of a DNS service to be analyzed with DNS tools, currently only "aws" service is avaliable which extracts information from route53 zones.          | "aws"                  
| `path_to_zone_files`| The location of a [zone file](https://help.dyn.com/how-to-format-a-zone-file/) which contains a list of DNS records with mappings between domain names and IP addresses. | File Path

{% include note.html content="`networks`, `name` and `tcp_ports` are required keys. <br/><br/> Either `path_to_bind`, `path_to_zone_files` **or** `dns_service` must be defined." %}

This will output a set of FQDNs for your defined discovery plan. Be sure to verify the outputted FQDNs that you'd want to analyze.
Once you have verified the list of FQDNs, you have the option to save the results to a file with the flag: `-f my_urls.txt`.

## Next Step

Having discovered your applications, here is a [guide](analyze.html) on analyzing your FQDNs.