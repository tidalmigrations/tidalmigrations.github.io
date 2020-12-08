---
title: Analyze your Databases
keywords: source, assessment, readiness, analyze
last_updated: July, 2018
summary: "Use the Tidal Tools database analyzer to measure your databases’ cloud migration difficulty."
sidebar: main_sidebar
permalink: analyze_database.html
folder: tidaltools
---
Not sure how ready you are to move to the cloud? With Tidal Migrations you have the option to analyze the databases associated with your applications.

The analysis will calculate the difficulty of migrating your databases to each target platform, and give details on database features that may complicate the migration.

It is capable of analyzing both **Oracle and SQL Server databases**. Providing analysis on migrating a database to a **variety of services on AWS, Azure and Google Cloud**.

> NB: The entire analysis never queries or reads user or application data and does not collect database source code.

## Supported Database Versions

Tidal Tools is able to analyze Oracle and SQL Server databases with the following versions:

| Oracle                | SQL Server |
|-----------------------|
| [Beta](mailto:info@tidalmigrations.com?subject=Interested in Oracle 8i Database Analysis) Oracle Database 8i (8.1) | SQL Server 2008R2 |
| Oracle Database 9i Release 2 (9.2)   | SQL Server 2016 |
| Oracle Database 10g Release 2 (10.2) | SQL Server 2017 |
| Oracle Database 11g Release 1 (11.1) |
| Oracle Database 11g Release 2 (11.2) |
| Oracle Database 12c Release 1 (12.1) |
| Oracle Database 12c Release 2 (12.2) |
| Oracle Database 18c (18.1) |

If you have a use case for a different version, definitely let us know at [info@tidalmigrations.com](mailto:info@tidalmigrations.com), we are always adding new capabilities.

## Migration Complexity
The databases are analyzed to look for patterns and feature usage that may be difficult to migrate due to lack of support or compatibility in their new environment. The databases are analyzed based on their metadata, looking at specific schema objects that are used within your databases as well as the usage of proprietary features that will not be available in the target platforms.

For example, in Oracle databases, the Data Dictionary and AWR repository tables are read and analyzed. The scoring is calculated based on the type of attributes, features or schema objects that are used and the frequency of use throughout the database.

 - Over 100 unique characteristics are considered
 - Feature-fit is executed against all supported cloud data platforms.
 - Migration difficulty score is calculated based on a weighted model

## Getting Started
- Enable the Database Analysis feature for your account:
  https://yoursubdomainhere.tidalmg.com/#/settings - See the Database Analysis section, under Preferences.
- `tidal login`
  Be sure to have [installed](tidal-tools.html) and [logged in](tidal-tools.html#login) to your Tidal Migrations account via Tidal Tools.
- Install [Docker CE](https://docs.docker.com/v17.12/install/), it is compatible with most OSs, select the one you need. Version 17.12 or later will work with Tidal Tools. [Why Docker?](#why-docker)
- You will also need a few authentication and configuration details for the database:
  - id - The id of the database from your Tidal Migrations account. You can find it in the URL bar when looking at a database instance. ex. If you are viewing a database instance in Tidal Migrations, the URL will show https://demo2.tidalmg.com/#/database_instances/111 in this case 111 is the database instance ID.
  - engine - The database vendor, either `Oracle` or `SQL Server`, it is not case sensitive.
  - host - The hostname of the server that the database is located on and is accessible via a network connection from your current device and location.
  - port - The port that the host has open and the database can accept connections on, the default for Oracle is 1521, and for SQL Server it is 1433.
  - db_name - The name of the database that will be analyzed, as it is defined within the database engine itself. ie. the value that is used by applications to connect to the database by name.
  - user - A username to authenticate with the database with, see below for more details.
  - password - A password for the corresponding user.
  - name - A common name for your database could be the same or different from db_name, but this value is arbitrary and only for your reference.

### Oracle User

You can either use the default `SYSDBA` user or you can create a user with the same set of permissions:

```
CREATE USER tidal IDENTIFIED BY replace_this_with_secure_password;
GRANT CREATE SESSION TO tidal;
GRANT SELECT ANY DICTIONARY TO tidal;
GRANT SELECT_CATALOG_ROLE TO tidal;
```

### SQL Server User

For SQL Server the access needed is specified in the `GRANT` commands below. If you have a user you would like to use you can run these commands and change the `[user_name]`. If you want to create a new user, [there a few options provided by Microsoft](https://docs.microsoft.com/en-us/sql/t-sql/statements/create-user-transact-sql?view=sql-server-2017), which you can do and then run the following `GRANT` commands for the new user.

```
GRANT SELECT ON SCHEMA::sys TO [user_name];
GRANT SELECT ON SCHEMA::INFORMATION_SCHEMA TO [user_name];
GRANT SELECT ON tempdb..sysobjects to [user_name];
GRANT VIEW SERVER STATE TO [user_name];
```

With your user and password, you can define all these values in a YAML configuration file:


config.yml:

```
databases:
  - id: 111
    engine: Oracle
    host: 'my-db-host.com'
    port: 1521
    db_name: 'orcl'
    user: 'tidal'
    password: 'yoursecurepassword1234!'
    name: 'My-Test-DB'
```

{% include note.html content="It is best to use quotations, either double or single, around the values in the configuration file. To avoid special characters, : { } [ ] , & * # ? | - < > = ! % @ \ \n from being interpreted. Single quotes are safest, if the value has a single quote within it, you can include it by using a two single quotations, ie. `'my''string'` - will become `my'string`." %}

- You’re all set! You can now analyze the database with:

```
tidal analyze db config.yml

```

Try it out!

## Running offline

If you need to run the command from a computer without any internet access, either no download access to download the docker image necessary or no outbound access to upload the results of the analysis to the API then this is for you.

First you will need to setup Tidal Tools on a machine with internet access. Next you can run:

`tidal backup`

This will create a tar file called `tidal-snapshot_DATE.tar`

Moving to the air-gapped machine you will need to install Tidal Tools and Docker and transfer the tar file above, then run:

`tidal restore tidal-snapshot_DATE.tar`

This will load the docker image and all of existing Tidal Tools configurations from the original machine. You can now run the database analysis without any external network connectivity, except to your database host itself:

`tidal analyze db --offline config.yml`

This will output a zip file called, `tidal-dba-results_DATE.zip` that can then be uploaded to the application for a given database in order to complete the analysis:

`tidal analyze db --upload tidal-dba-results_DATE.zip`

You should recieve confirmation that the upload has completed and can navigate to Tidal Migrations to see the results.

## Why Docker?
You need to install Docker in order to complete the database analysis. This is because the analysis uses several system dependent software libraries, so by using Docker the analysis can use those libraries without you requiring to install the correct dependencies with the correct versions.

##  What about security?
The entire analysis takes place locally on your machine. The only data that is captured and sent from the analysis are the results of the analysis and metadata. No application data, source code, files or the contents of any files on your machine are ever copied or sent anywhere.
