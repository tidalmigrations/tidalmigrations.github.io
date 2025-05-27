---
toc: false
parent: Plan
title: Exporting servers from a Migration Wave to CSV
keywords:  servers, csv, rivermeadow, export, migration, wave
last_updated: April 17, 2019
summary: "Exporting servers from a migration wave to a format that can be used by RiverMeadow."
permalink: exporting-servers-to-csv.html
---

Here we will show how to take an entire migration wave of servers from Tidal and export them for direct ingestion into RiverMeadow, to perform a VM migration.

# Requirements

This guides assumes you have access to a Linux like environment, you will need:

-   Posix compliant shell
-   [Curl](https://curl.haxx.se/download.html)
-   [jq](https://stedolan.github.io/jq/)
-   [A copy of the migration wave script](https://github.com/tidalmigrations/gists/blob/master/migration_wave_to_csv.sh)


# Steps


## 1. Authentication information

To authenticate to your account, we'll need to collect the subdomain, username, password. If you don't know what your subdomain is you can find it here:

{% include image.html file="subdomain.png" caption="An image highlighting how to find your organization's subdomain." %}

Once you have gathered this information, you'll need set it as an environment variable, substitute in your information to the commands below and run them in your shell:

```bash
export username="<your username>"
export password="<your password>"
export subdomain="<your subdomain>"
```

## 2. Find Migration Wave ID

To find the ID of the migration wave that you'd like to export, log in to the Tidal Accelerator Platform and from the `Projects` view, select the project that your migration wave is associated with. In the `Project` view, go to `Migration Waves` tab. You should see a list of migration waves that are associated with the selected project. Click on the name of the migration wave you're interested in. Here, you'll be able to find the ID of the migration wave at the end of the URL, as shown below:

{% include image.html file="migration_wave_id.png" caption="An image highlighting how to find a migration wave id." %}

Once you have this number, like you did in step 1, export the `migration_wave_id` as an environment variable.

``` bash
export  migration_wave_id="<your migration wave id>"
```

## 3. Run the script

You're ready to run the script and export this information to a CSV. Now that you have gathered the required information and saved it in `migration_wave_to_csv.sh`, you will need to run script and pipe the output to a CSV file:
```bash
./migration_wave_to_csv.sh > migration_wave.csv
```
Now the data you need for your server migration is in the file migration_wave.csv and can be imported into RiverMeadow.
