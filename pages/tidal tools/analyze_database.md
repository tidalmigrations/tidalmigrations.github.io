---
title: Analyze your Databases
keywords: source, assessment, readiness, analyze
last_updated: July, 2018
summary: "Use the Tidal Tools database analyzer to measure your databases’ cloud migration difficulty."
sidebar: tidal_toolsbar
permalink: analyze_database.html
folder: tidaltools
---
# Analyze your Database
Not sure how ready you are to move to the cloud? With Tidal Migrations you have the option to analyze the databases associated with your applications.
The analysis will calculate the difficulty of migrating your databases to each target platform, and give details on database features that may complicate the migration.
Capable of analyzing both Oracle and SQL Server databases. Providing analysis on migrating a database to a variety of services on AWS, Azure and Google Cloud.
The entire analysis never queries or reads user or application data and does not collect database source code.

## Migration Complexity
The databases are analyzed to look for patterns and feature usage that may be difficult to migrate due to lack of support or compatibility in their new environment. They databases are analyzed based on their metadata, looking at specific schema objects that are used and the usage of proprietary features that will not be available in the target platforms. For example, in Oracle databases, the Data Dictionary and AWS repository tables are read and analyzed. The scoring is calculated based on the type of attribute, feature or schema object that is used and the frequency it is used throughout the database. For Oracle databases over 100 unique characteristics are considered. The difficulty is then calculated based on the identification of these characteristics in comparison with what is supported by each specific target database platform.

## Getting Started
- Be sure to have [logged in](tidal-tools.html#login) to your Tidal Migrations account via Tidal Tools.
- Install [Docker CE](https://docs.docker.com/v17.12/install/), it is compatible with most OSs, select the one you need. Version 17.12 or later will work with Tidal Tools. [Why Docker?](#why-docker)
- You will also need a few authentication and configuration details for the database:
    - engine - the database vendor, either `Oracle` or `SQL Server`
    - host - the host that the database is running on and is accessible to access
    - port - the port that the host has open and the database can accept connections on, the defaults are Oracle 1521, and SQL Server 1433
    - db_name - the name of the database that will be analyzed, as it is defined within the database engine itself. ie. the value that is used by applications to connect to the database by name.
    - user - a username to authenticate and access the database with
    - pass - a password for the corresponding user
    - name - A common name for your database could be the same or different from db_name, but this value is arbitrary and only for your reference.

You can define these values in a YAML configuration file, `config.yml`:
```
databases:
  - name: My-Test-DB
    engine: Oracle
    host: my-db-host.com
    port: 1521
    db_name: orcl
    user: tidal
    password: “yoursecurepassword1234!”
```

The analysis only requires access to metatables of the database and none of the application data itself.

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
GRANT SELECT ON SCHEMA::sys TO [user_name]
GRANT SELECT ON SCHEMA::INFORMATION_SCHEMA TO [user_name]
GRANT SELECT ON tempdb..sysobjects to [user_name]
```

You’re all set! You can now analyze the database with:

```
tidal analyze db --offline config.yml
```

## Why Docker?
You need to install Docker in order to complete the database analysis. This is because the analysis uses several system dependent software libraries, so by using Docker the analysis can use those libraries without you requiring to install the correct dependencies with the correct versions.

##  What about security?
The entire analysis takes place locally on your machine. The only data that is captured and sent from the analysis are the results of the analysis and metadata. No application data, source code, files or the contents of any files on your machine are ever copied or sent anywhere.
