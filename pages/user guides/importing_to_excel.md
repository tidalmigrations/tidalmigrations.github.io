---
title: Importing Data from Excel
keywords: excel, import, apps, data, servers, clusters, database instances
last_updated: August, 2018
summary: "Easily import your Excel spreadsheets into Tidal Migrations"
sidebar: user_guidesbar
permalink: import-from-excel.html
---

Tidal Migration's importer will guide you through mapping your columns to our fields, 
create your own fields and even make associations between dependencies 
if you have captured these.

You can import your Excel spreadsheets into Tidal Migrations by visiting:

`` https://your_subdomain.tidalmg.com/#/discover/import``


## Preparing

You should import your data in the following order:

1. Virtualization Clusters
2. Servers
3. Database Instances
4. Applications

This order is especially important if you are planning to import dependencies for your Databases and Applications.
Ie. If your Application has a dependency on a server, you need to have that server imported first for the dependency to be imported correctly. 


{% include note.html content="You can always update a dependency after importing too."  %}

You should have one sheet or file per type of record.

There are several default columns included for each record type, 
however if you have additional information you can add fields for a record and also track those. 
If this is the case you should do this before you import your data. 

## Importing your data

- Select the data type you wish to import.

{% include image.html file="step0.PNG" %}

- Select the sheet in your file that you want to import data from.

{% include image.html file="step1.PNG" %}

- Map the columns of your sheet to the fields from the drop down. If you have a column that is not present as a field and you want to import it, you can add that field.

{% include image.html file="step2.PNG" %}

- Click submit to import the data.

{% include tip.html content="There are several 'fields' that will map to other resources in Tidal. To find more about what fields Tidal Migrations supports checkout [Importing Servers, Importing Databases](import_servers.html) or [Importing Applications](importapps.html)" %}
{% include tip.html content="The Tags option can be used to generate multiple tags and associate them with the record. You can use this track any type of categorical data. Additionally you can search and filter for records based on tags. Multiple tags can be associated based on one column of data, they are parsed and split on any commas (,)" %}

### Importing Virtualization Clusters

Tidal Migration uses the following fields to map a virtualization cluster to other resources: _Hypervisor Technology, Servers_. For this field, you must select the property that the column will correspond to, generally this is _Name_.

### Importing Servers

Tidal Migrations uses the following fields to map a server to other resources: _FQDN, IP Addresses, Database Instances, Environment, Cluster_. For these fields, you must select the property that the column will correspond to, generally this is _Name_.

### Importing Databases

Tidal Migrations uses the following fields to map a database instance to other resources: _Servers and Environment_. For these fields, you must select the property that the column will correspond to, generally this is _Name_.

### Importing Applications

Tidal Migrations uses the following fields to map an application to other resources: _Servers, Database Instances, Environment, Customers_. For these fields, you must select the property that the column will correspond to, generally this is _Name_.
