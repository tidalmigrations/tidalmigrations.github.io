---
title: Analyze your Databases
keywords: source, assessment, readiness, analyze
last_updated: July, 2018
summary: "Use the Tidal Tools database analyzer to measure your databases’ cloud migration difficulty."
sidebar: main_sidebar
redirect_from: analyze_database.html
permalink: analyze-database.html
folder: tidaltools
---
Not sure how ready you are to move to the cloud? With Tidal Migrations, you have the option to analyze the databases associated with your applications.

The analysis will calculate the difficulty of migrating your databases to each target platform, and give details on database features that may complicate the migration.

It is capable of analyzing **Oracle**, **SQL Server**, **MySQL**, and **PostgreSQL** databases. Providing analysis on migrating a database to a **variety of services on AWS, Azure, and Google Cloud**.

{% include note.html content="The entire analysis never queries or reads user or application data and does not collect database source code." %}

## Supported Database Versions

Tidal Tools is able to analyze databases with the following versions:

| Oracle                | SQL Server | MySQL | PostgreSQL |
|-----------------------|------------|-------|------------|
| Oracle Database 8i (8.1) | SQL Server 2005 | 5.5 | 8.3 |
| Oracle Database 9i Release 2 (9.2) | SQL Server 2008 | 5.6 | 9.1, 9.2, 9.3, 9.4, 9.5, 9.6 |
| Oracle Database 10g Release 2 (10.2) | SQL Server 2008R2 | 5.7 | 10 |
| Oracle Database 11g Release 1 (11.1) | SQL Server 2012 | 8.0 | 11 |
| Oracle Database 11g Release 2 (11.2) | SQL Server 2014 | | 12 |
| Oracle Database 12c Release 1 (12.1) | SQL Server 2016 | | 13 |
| Oracle Database 12c Release 2 (12.2)| SQL Server 2017|
| Oracle Database 18c (18.0, 18.1) | SQL Server 2019 |
| Oracle Database 19c (19.0, 19.1, 19.2, 19.3) |

If you have a use case for a different version, definitely let us know at [info@tidalmigrations.com](mailto:info@tidalmigrations.com), we are always adding new capabilities.

## Migration Complexity
The databases are analyzed to look for patterns and feature usage that may be difficult to migrate due to lack of support or compatibility in their new environment. The databases are analyzed based on their metadata, looking at specific schema objects that are used within your databases as well as the usage of proprietary features that will not be available in the target platforms.

For example, in Oracle databases, the Data Dictionary and AWR repository tables are read and analyzed. The scoring is calculated based on the type of attributes, features or schema objects that are used and the frequency of use throughout the database.

 - Over 100 unique characteristics are considered
 - Feature-fit is executed against all supported cloud data platforms.
 - Migration difficulty score is calculated based on a weighted model

## Getting Started

1. Before you can analyze a database, You must enable the Database Analysis feature for your account. To do so, go to your workspace Settings/Preferences (https://workspace.tidalmg.com/#/admin/setting). You will find at the bottom of the page the Database Analysis section.
2. Now that you have activated the Database Analyze feature, You need to install, configure and authenticate via Tidal Tools. Make sure you follow these guides.
  - How to [install](tidal-tools.html#install) Tidal Tools.
  - Install Tidal Tools [dependencies](tidal-tools.html#dependencies).
  - Make sure you can [connect](tidal-tools.html#connecting-to-the-api) with your workspace using Tidal Tools

3. Tidal Tools will need a YAML configuration file with values and credentials needed to connect to your database. You can check this [section](#create-your-database-configuration-file) for more information on how to create such a file.
4. Configure your Database to allow access to Tidal Tools. This [section](#configuring-a-user) will walk you through the creation of a `tidal` user and granting the necessary permissions.
5. Perform the Database Analysis. There are 2 options to do so. You can find more details in this [section](#perform-the-analysis)

That is all, You should be able to see the results in your workspace within seconds.


## Create your Database configuration file

Your YAML configuration file must contain the following information.

  - `id` - The id of the database from your Tidal Migrations account. You can find it in the URL bar when looking at a database instance. ex. If you are viewing a database instance in Tidal Migrations, the URL will show https://demo2.tidalmg.com/#/database_instances/111 in this case 111 is the database instance ID.
  - `engine` - The database vendor, either `Oracle`, `SQL Server`, `MySQL`, or `PostgreSQL`, it is not case sensitive.
  - `host` - The hostname of the server that the database is located on and is accessible via a network connection from your current device and location.
  - `port` - The port that the host has open and the database can accept connections on, the default for Oracle is `1521`, for SQL Server it is `1433`, for MySQL it is `3306`, and for PostgreSQL the default port is `5432`.
  - `db_name` - The name of the database that will be analyzed, as it is defined within the database engine itself. ie. the value that is used by applications to connect to the database by name.
  - `user` - A username to authenticate with the database, check the section below for more details about creating a user and granting permissions.
  - `password` - A password for the corresponding user.
  - `name` - A common name for your database could be the same or different from db_name, but this value is arbitrary and only for your reference.


The simplest way to create your configuration file is to use the  `tidal analyze db init` command in Tidal Tools. It is an interactive command that will guide you through the process. Or you can create the file manually:

This is an example of how the YAML file should look like


databases.yaml:

```yaml
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

{% include note.html content="It is best to use quotations, either double or single, around the values in the configuration file. To avoid special characters, : `{ } [ ] , & * # ? | - < > = ! % @ \ \n` from being interpreted. Single quotes are safest, if the value has a single quote within it, you can include it by using a two single quotations, ie. `'my''string'` - will become `my'string`." %}

{% include tip.html content="Are you analyzing an Oracle Stanard Edition (SE)
database or using a CDB database? Check out the [advanced configuration below](#advanced-configuration)." %}

## Configuring a User
To make the process as easy and secure as possible, you can create a user in your database dedicated to `tidal`. This will provide you full control and transparency on the permission Tidal Tools needs when performing the Database Analysis. Below you will find instructions and scripts for each supported Database.
### Oracle User
This SQL [script](/oracle_user.sql) will create a `tidal` user and set the right permissions for you. Once downloaded, You should edit it and provide a secure password on the first line.

If you are using a CDB database you will also need to create a second user to access the CDB. You can do that with this script and also provide a secure password at the top:

```sql
CREATE USER c##tidal_comm_user IDENTIFIED BY "replace_this_with_secure_password" account unlock;
GRANT CREATE SESSION to c##tidal_comm_user;
GRANT select_catalog_role to c##tidal_comm_user;
```

### SQL Server User

You can use this SQL [script](/mssql_user.sql) to create a `tidal` user and set the correct permissions. You should edit it and provide a secure password on the first line.

### MySQL Server User

For MySQL you can create a user (`tidal`) with all the necessary permissions using the following statements:

```sql
CREATE USER 'tidal'@'%' IDENTIFIED BY 'replace_this_with_secure_password';
GRANT PROCESS,REFERENCES, SHOW DATABASES, SHOW VIEW ON *.* TO 'tidal'@'%';
GRANT SELECT ON sys.* TO 'tidal'@'%';
GRANT SELECT ON performance_schema.* TO 'tidal'@'%';
GRANT SELECT ON mysql.slave_master_info TO tidal;
GRANT SELECT ON mysql.slave_relay_log_info TO tidal;
GRANT SELECT ON mysql.user TO tidal;
```

In addition, use the following command that applies to your MySQL version.
#### MySQL 5.x

```sql
GRANT SELECT ON mysql.proc TO tidal;
```

#### MySQL 8.x

```sql
GRANT SHOW_ROUTINE ON *.* TO 'tidal'@'%';
GRANT SELECT ON mysql.user TO 'tidal'@'%';
```

### PostgreSQL Server User

Use the following commands to create a user (`tidal`) on PostgreSQL server.

```sql
CREATE USER tidal WITH PASSWORD 'replace_this_with_secure_password';

DO $$ DECLARE comm_rec RECORD;
BEGIN
    FOR comm_rec IN
		SELECT 'GRANT REFERENCES ON ALL TABLES IN SCHEMA '||schema_name||' TO tidal' AS comm FROM information_schema.schemata
	LOOP
        EXECUTE comm_rec.comm;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

GRANT REFERENCES ON ALL TABLES IN SCHEMA public to tidal;
```

For PostgreSQL versions **higher than 9** the following `GRANT`s should be also applied:

```sql
GRANT SELECT ON pg_catalog.pg_config TO tidal;
GRANT EXECUTE ON function pg_catalog.pg_config TO tidal;
GRANT SELECT ON pg_catalog.pg_proc TO tidal;
GRANT SELECT ON pg_catalog.pg_namespace TO tidal;
```

For PostgreSQL versions **10 and above** the following `GRANT`s should be also applied:

```sql
GRANT SELECT ON pg_catalog.pg_hba_file_rules TO tidal;
GRANT SELECT ON pg_catalog.pg_roles TO tidal;
GRANT pg_read_all_settings TO tidal;
GRANT pg_read_all_stats TO tidal;
```

After creating the user you will need to add the appropriate entry to the [`pg_hba.conf`](https://www.postgresql.org/docs/current/auth-pg-hba-conf.html). For example:

```
# TYPE  DATABASE    USER    ADDRESS     METHOD
host    all         tidal   0.0.0.0/0   md5
```

To apply the configuration changes to the running PostgreSQL server you will need to run [`pg_ctl restart`](https://www.postgresql.org/docs/current/app-pg-ctl.html).



## Perform the analysis

When analyzing a database (or multiple), You have two options. 

1. Perform the database analysis and upload the result immediately to your workspace. This is Tidal Tools default behaviour. To do so, all you need to do is run the following command.
```bash
tidal analyze db databases.yaml
```

2. Perform the database analysis and upload the results at a later time. The following section will explain how to run database analysis in **offline mode**

### Running offline

There are circumstances in which you need to perform a database analysis on an environment without or with restricted internet access. In such case, You can perform the Database analysis, capture its results and at a later stage upload those results to your Tidal Migrations workspace.

These are the steps you need to follow in order to bypass internet access limitations:

1. On a Machine with internet access, you need to install, and configure Tidal Tools. 

2. Package Tidal Tools and its required docker container images into a tar file, This will allow you to move the archive file into your restricted environment. To do so, run the following command.

    `tidal backup`

    Once it has finished, you will find (in your current location) a tar file called `tidal-snapshot_DATE.tar`. This is the file you need to transport into your internet restricted environment.

3. On the machine that has no internet access. You will now restore Tidal Tools using the following command.

    `tidal restore tidal-snapshot_DATE.tar`

    This will load a docker image and all the existing Tidal Tools configurations from the original machine. You can now run the database analysis without any external network connectivity, except to your database host itself:

    `tidal analyze db --offline databases.yaml`

    Note the `--offline` flag, it will indicate to Tidal Tools that the output needs to be stored in a file instead of being uploaded.

    After the analysis is completed, you will find a zip file called, `db-analyze-<DATE>.zip` that can then be transferred into a machine with internet connectivity. 


4. Back to the machine with internet access. you can now upload your results to your workspace with this command.

    `tidal analyze db --upload db-analyze-<DATE>.zip`

    You should receive confirmation that the upload has been completed and can navigate to Tidal Migrations to see the results.


## Why Docker?
You need to install Docker in order to complete the database analysis. This is because the analysis uses several system-dependent software libraries, so by using Docker the analysis can use those libraries without you requiring to install the correct dependencies with the correct versions.

##  What about security?
The entire analysis takes place locally on your machine. The only data that is captured and sent from the analysis are the results of the analysis and metadata. No application data, source code, files or the contents of any files on your machine are ever copied, or sent anywhere.

## Advanced Configuration

### Oracle Standard Edition
To use Oracle features included only in the Oracle Standard Edition (SE) license, you
can set the `analyze_workload` property to `false` in your configuration file. For example:

```yaml
databases:
  - id: 111
    analyze_workload: false
    engine: Oracle
    host: 'my-db-host.com'
    port: 1521
    db_name: 'orcl'
    user: 'tidal'
    password: 'yoursecurepassword1234!'
    name: 'My-Test-DB'
```

{% include note.html content="By setting this to `false`, some results from the
analysis will not be available, including server metrics, connected applications,
and the workload analysis ranking." %}

## Troubleshooting

If you are getting errors when trying to perform the analysis, it can help if you confirm that you do have network connectivity to the database.

Two commands you can use for this are:

1. `dig your_db_host` - This should return a DNS record, usually an A record, with an IP address. This means you are able to resolve the hostname of the database. If there is no IP address then you either need to adjust the hostname or you need to configure or adjust the DNS server for your operating system.

2. `nc -vzn -w 10 your_db_host db_port` This command should return `Connected to your_db_host:db_port` if it is able to connect. If it returns `Connection Timed Out` this means that it is not able to reach your database on this port. This could mean that you do not have the correct network connectivity to the database and may need to adjust firewalls or other network access. Or you are not providing the correct port that is open and listening for requests on the database.

### CDB Configuration

You will need these additional values added to your configuration file to connect to a CDB database.

```yaml
databases:
  - id: 111
    engine: Oracle
    host: 'my-db-host.com'
    port: 1521
    db_name: 'orcl'
    user: 'tidal'
    password: 'yoursecurepassword1234!'
    name: 'My-Test-DB'
    dbidtype: 'dbid'
    ispdb: false
    cdb:
      name: 'cdbname'
      user: 'c##tidal_comm_user'
      password: 'your_secure_password'
```
