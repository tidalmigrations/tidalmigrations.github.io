---
title: Tidal Discover
last_updated: April 24, 2018
summary: "Discovering your applications domains and URLs"
sidebar: tidal_toolsbar
permalink: discover.html
folder: tidaltools
---

## Discover Your Applications

The first step in your cloud migration project is discovering what you have. Thousands of domains are registered on a daily basis and it can be hard to remain
informed. Utlize the `tidal discover` tool with your customized Discovery Plan to obtain both private and public domains registered for your given datacentres. 

- Scan multiple networks and DNS services with a *discovery plan*

    `` tidal discover --plan my_plan.yml ``

<br>
*Your* Discovery plan can include three different ways that you want to scan your networks and DNS services. You may choose to provide a DNS service to extract information, a *named.conf* file for binary configuration, or a zone file to get a representation of all the records of a particular domain.

## via DNS Service
An example of a discovery plan to obtain FQDNs by specifying a DNS Service.
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
```
## via Binary Configuration
An example of a discovery plan to obtain FQDNs by specifying a named.conf file.
<br>
The file *my_plan.yml* must be of the following format:

```
  - name: NYC Datacenter front-ends
    networks: 
      - 10.83.3.0/24
      - 10.130.241.0/24 
    tcp_ports:
      - 80
      - 443
    path_to_bind: "/etc/bind/named.conf"
```
## via Zone files
An example of a discovery plan to obtain FQDNs by specifying a named.conf file.
<br>
The file *my_plan.yml* must be of the following format:

```  
  - name: Tokyo flat-network
    networks: 192.168.0.0/16
    tcp_ports:
      - 80
      - 443
      - 8080
      - 8443
    path_to_zone_files: "~/tokyo_zones/*/**"

```

Here is some brief information regarding the keys defined in the *my_plan.yaml* file:


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

Having discovered your applications, here is a [guide](analyze.html) on analyzing your FQDNs. Tidal Analyze will review the outputted FQDNs and give you a detailed analysis on what technologies are being in use for each domain.