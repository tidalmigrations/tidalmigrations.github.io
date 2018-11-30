---
title: Tidal Discover
keywords: discover, discovery plan, bind, zone files, dns
last_updated: April 24, 2018
summary: "Discovering your applications domains and URLs"
sidebar: tidal_toolsbar
permalink: discover.html
folder: tidaltools
---

## Discover Your Applications

The first step in your cloud migration project is discovering what you have. Thousands of domains are registered on a daily basis and it can be hard to remain
informed. Utilize the `tidal discover` tool with your customized Discovery Plan to obtain both private and public domains registered for your given datacentres. 

- Scan multiple networks and DNS services with a *discovery plan*

    `` tidal discover my_plan.yml > my_urls.txt``
    
{% include note.html content="In order to utilize this command, [install DNS Tools](https://dnstools.ninja/download/)." %}


With this command, Tidal Discover will output a set of <a href="#" data-toggle="tooltip" data-original-title="{{site.data.glossary.FQDNs}}">FQDNs</a> for your defined discovery plan and store it in the file *my_urls.txt*.

*Your* Discovery plan is a [YAML](http://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html) file which can include three different ways that you want to scan your networks and DNS services. You may choose to provide a DNS service to extract information, a *named.conf* file for binary configuration, or a collection of zone files to be scanned and generate all the affected domains.

### via DNS Service
An example of a discovery plan to obtain FQDNs by specifying a DNS Service.


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
### via Bind Configuration
An example of a discovery plan to obtain FQDNs by specifying a named.conf file.


The file *my_plan.yml* must be of the following format:

```
discovery:
  - name: NYC Datacenter front-ends
    networks: 
      - 10.83.3.0/24
      - 10.130.241.0/24 
    tcp_ports:
      - 80
      - 443
    path_to_bind: "/etc/bind/named.conf"
```
### via Zone files
An example of a discovery plan to obtain FQDNs by specifying a zone file.


The file *my_plan.yml* must be of the following format:

```  
discovery:
  - name: Tokyo flat-network
    networks: 192.168.0.0/16
    tcp_ports:
      - 80
      - 443
      - 8080
      - 8443
    zonefiles: "~/tokyo_zones/*/**"

```
You may also choose to include all three of the ways in your Discovery plan like so:

```
discovery:
  - name: Tokyo flat-network
    networks: 192.168.0.0/16
    tcp_ports:
      - 80
      - 443
      - 8080
      - 8443
    zonefiles: "~/tokyo_zones/*/**"
    
  - name: NYC Datacenter front-ends
    networks: 
      - 10.83.3.0/24
      - 10.130.241.0/24 
    tcp_ports:
      - 80
      - 443
    path_to_bind: "/etc/bind/named.conf"
    
  - name: NYC Datacenter front-ends
    networks: 
      - 10.83.3.0/24
      - 10.130.241.0/24 
    tcp_ports:
      - 80
      - 443
    dns_service: aws

```
You can also combine all as the following:

```
discovery:
  - name: NYC Datacenter front-ends
    networks: 
      - 10.83.3.0/24
      - 10.130.241.0/24 
    tcp_ports:
      - 80
      - 443
    path_to_bind: "/etc/bind/named.conf"
    zonefiles: "~/path/to/my/zonefiles"
    dns_service: aws
```

## Creating your Discovery Plan {#plan}

Here is some brief information regarding the keys defined in the *my_plan.yaml* file: 


| Key               | Information                                                                                                                                            | Format                      |
| --------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| `networks`          | One or more subnets that you want to include in the process.                                                                                           | [Cidr block notation](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)       
| `name`              | A friendly name for your network, e.g. "Tokyo DC-1 Front-End"                                                                                                                         | Text                      
| `tcp_ports`         | One or more TCP Ports that you frequently run web servers on and would like to interrogate: e.g. 80,443,8080,8443 etc.                                  | Integer             
| `path_to_bind`      | The location of a [named.conf file](https://www.centos.org/docs/5/html/Deployment_Guide-en-US/s1-bind-namedconf.html) for a bind server configuration. | File Path         
| `dns_service`       | Name of a DNS service to be analyzed with DNS tools, currently only "aws" service is avaliable which extracts information from Amazon Route 53 zones.          | "aws"                  
| `path_to_zone_files`| The location of a [zone file](https://help.dyn.com/how-to-format-a-zone-file/) which contains a list of DNS records with mappings between domain names and IP addresses. | File Path

{% include note.html content="`networks`, `name` and `tcp_ports` are required keys that you must include. <br/><br/> Specify one or more of `path_to_bind`, `path_to_zone_files` **or** `dns_service` in your Discovery file." %}

Be sure to verify the outputted FQDNs that you'd want to analyze.

## Next Step

Having discovered your applications, here is a [guide](analyze.html) on analyzing your FQDNs. Tidal Analyze will review the outputted FQDNs and give you a detailed analysis on what technologies are being in use for each domain.
