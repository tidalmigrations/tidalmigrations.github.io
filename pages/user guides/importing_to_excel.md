---
title: Importing Data from Excel
keywords: excel, import, apps, data, servers, clusters, database instances
last_updated: August, 2022
summary: "Easily import your Excel spreadsheets into Tidal Migrations"
sidebar: main_sidebar
permalink: import-from-excel.html
---

Tidal Migration's importer will guide you through mapping your columns to our fields,
create your own fields and even make associations between dependencies
if you have captured these.

You can import your Excel spreadsheets into Tidal Migrations by visiting:

`` https://your_workspace.tidalmg.com/#/discover/import``


## Preparing your Spreadsheet

If you'd like to try the process itself but don't have a file yet, you can use this <a href="https://s3.ca-central-1.amazonaws.com/tidal.assets/inventory_data.xlsx">sample spreadsheet</a>.

You should import your data in the following order:

1. Virtualization Clusters
2. Servers
3. Database Instances
4. Applications

This order is especially important if you are planning to import dependencies for your Databases and Applications.
Ie. If your Application has a dependency on a server, you need to have that server imported first for the dependency to be imported correctly.

{% include note.html content="You can always update a dependency after importing too."  %}

You should have one sheet or file per type of record.

There are several default columns values included for each record type, 
however if you have additional information on your inventory that would like to include, you can create custom fields for a record (Check step 3). 
Remember to add those fields before importing the data.

## How to import your data

1. Select the data type you wish to import.

{% include image.html file="step0.PNG" %}

2. Select the sheet in your file that you want to import data from.

{% include image.html file="step1.PNG" %}

3.  Map the columns of your sheet to the fields from the drop down. If you have a column that is not present as a field and you want to import it, you can add that field.

{% include image.html file="step2.PNG" %}

4. Click submit to import the data.

{% include note.html content="If you are importing applications, the _name_ field is required for each application in order to successfully import. For any of the other record types you are importing, there are no fields that are required in order for you to import them." %}

{% include tip.html content="The Tags option can be used to generate multiple tags and associate them with the record. You can use this track any type of categorical data. Additionally you can search and filter for records based on tags. Multiple tags can be associated based on one column of data, they are parsed and split on any commas (,)" %}

### Importing Virtualization Clusters

Default fields:
- Hypervisor Technology
- Servers

There is no required field when importing Virtualization clusters. 

* _Hypervisor Technology_, this field is used to list the technologies you have in your inventory. 

* _Servers_, this field is used to create associations as you import the rest of your inventory, in this instance, _Servers_ refers to the server (host name) hosting the hypervisor.

    {% include note.html content="Make sure your server inventory (when importing virtual servers) contains a field `Cluster` that points back to the Virtualization Cluster it is part of." %}



### Importing Servers

Default fields:
- Host Name
- FQDN
- Assigned ID
- Zone
- Role
- RAM Allocated (GB)
- RAM Used (GB)
- CPU Count
- CPU Name
- Storage Allocated (GB)
- Storage Used (GB)
- Description
- IP Addresses
- Database Instances
- Environment
- Cluster
- Tags
- Operating System Version
- Operating System


There is no required field when importing Servers. However, in order properly to map your inventory you must use the following fields.
* _Host Name_, This field is used to identify the server and to create association with Databases, Applications, and Virtualization Clusters.
* _Cluster -> host_name_, If a server is a Virtual Server, this field should match the value from the _Servers_ field in the Virtualization Cluster inventory. The **cluster** field is be used create the necessary association with its Virtual Cluster and its physical host.
* _Database Instances_, If a server is hosting a Database (or multiple), this field should contain the **name**(s) of such database(s).


### Importing Databases

Default fields:
- Name
- Description
- Database Size (MB)
- Database Path
- Server
- Environment
- Tags

There is no required field when importing Databases. However, in order to properly map your inventory you must use the following fields.
* _Name_, This field is used to identify and connect a Database to an Application and a Server.
* _Server_, represents the server hosting a Database. This field should contain the **Host Name** of such server.


### Importing Applications

Default fields:
- Name
- Description
- URLs
- Source Code Location
- Total Users
- Revenue
- Annual Hosting Costs
- Annual Staff Costs
- Uptime Requirements
- Data Sensitivity
- Frequency Of Deployments
- PII
- Legal Holds
- COTS
- Source Code Controlled
- Continuous Delivery
- Business Continuity Plan
- Can Run On Linux
- End Of Support Date
- Servers
- Database Instances
- Environment
- Customers
- Tags
- Technical Lead
- Business Owner

When importing Applications, only the **Name** field is required. However, in order to properly map your inventory you must use the following fields.
* _Servers_, represents the server hosting the Application. This field should contain the **Host Name** of such server(s).
* _Database Instances_, This field should contain the **Name** of the database(s) associated to the Application.
