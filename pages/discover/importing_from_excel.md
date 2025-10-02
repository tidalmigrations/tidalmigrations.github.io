---
title: Importing Data from Excel
layout: pages
parent: Discover
keywords: excel, import, apps, data, servers, clusters, database instances
last_updated: September, 2025
summary: "Easily import your Excel spreadsheets into Tidal"
permalink: import-from-excel.html
---

Tidal's importer will guide you through mapping your columns to our
fields, creating your own fields, and even making associations between
dependencies if you have captured these. When using the Tidal
importer, it will create or update records depending on the names or
host names uniqueness.

You can import your Excel spreadsheets into Tidal by visiting:

``https://your_workspace.tidal.cloud/import/``

## Preparing your Spreadsheet

If you'd like to try the process itself but don't have a file yet, you can use this <a href="https://s3.ca-central-1.amazonaws.com/tidal.assets/inventory_data.xlsx">sample spreadsheet</a>.

You should import your data in the following order:

1. Servers
2. Database Instances
3. Applications

This order is especially important if you are planning to import dependencies for your Databases and Applications.
Ie. If your Application has a dependency on a server, you need to have that server imported first for the dependency to be imported correctly.

{: .note }
You can always update a dependency after importing too.

You should have one sheet or file per type of record.

There are several default columns values included for each record type,
however if you have additional information on your inventory that would like to include, you can create custom fields for a record (Check step 3).
Remember to add those fields before importing the data.

## How to import your data

1. Select the data type you wish to import.

    {% include image.html file="import_step0.png" %}

2. Select the sheet in your file that you want to import data from.

    {% include image.html file="import_step1.png" %}

3. Map the columns of your sheet to the fields from the drop down. If you have a column that is not present as a field and you want to import it, you can create a custom field, then map the spreadsheet column to your new field. Custom fields can be created in the importer by clicking 'Create Custom Field'.

    {% include image.html file="import_step2.png" %}

4. Click submit to import the data.

{: .tip }
The Tags option can be used to generate multiple tags and associate them with the record. You can use this to track any type of categorical data. Additionally you can search and filter for records based on tags. Multiple tags can be associated based on one column of data, they are parsed and split on any commas (,)


### Importing Servers

When importing servers, the only required field is 'Host Name'. The Host Name is the name that your server is identified with throughout Accelerator.

The following server fields are present in Accelerator by default.
- Host Name (*)
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
- IP Addresses -> Address (*)
- Database Instances -> Name (*)
- Environment -> Name (*)
- Cluster -> Host Name (*)
- Tags
- Operating System Version
- Operating System

**(*)** Associative fields.
* _Host Name_, This field is used to identify the server and to create association with Databases and Applications,
* _Cluster -> Host Name_, This field is used to indicate that the Server that belongs to a virtual machine cluster with _Host Name_.
* _Database Instances -> Name_, If a server is hosting a Database (or multiple), this field should contain the **name**(s) of such database(s).
* _Environment -> Name_, This field is used to represent the server's environment.

### Importing Databases

When importing database instances, the only required field is 'Name'. The Name is how your database instance is identified throughout Accelerator.

The following database instance fields are present in Accelerator by default.
- Name (*)
- Description
- Database Size (MB)
- Database Path
- Server -> Host Name (*)
- Environment -> Name (*)
- Tags

**(*)** Associative fields.
* _Name_, When you are importing other records, Applications and Servers, and you provide a set of dependent databases with them, the Name field for Database Instances is used to identify those databases and associate the databases as dependencies for those other records. This is helpful when you have some existing dependencies, between Databases and Servers or Applications, in your Excel files and want to capture and leverage them.
* _Server -> Host Name_, represents the server hosting a Database. This field should contain the **Host Name** of such server.
* _Environment -> Name_, This field is used to associate a Database to an environment.


### Importing Applications

When importing applications, the only required field is 'Name'. The Name is how your application is identified throughout Accelerator.

The following application fields are present in Accelerator by default.
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
- Servers -> Host Name (*)
- Database Instances -> Name (*)
- Environment -> Name (*)
- Customers
- Tags
- Technical Lead
- Business Owner

**(*)** Associative fields.
In order to properly map your inventory you must use the following fields.
* _Servers -> Host Name_, represents the server hosting the Application. This field should contain the **Host Name** of such server(s).
* _Database Instances -> Name_, This field should contain the **Name** of the database(s) associated to the Application.
* _Environment -> Name_, This field is used to associate an Application to an environment.
