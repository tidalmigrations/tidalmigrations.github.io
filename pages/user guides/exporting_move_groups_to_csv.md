---
toc: false
title: Exporting servers from a Move Group to CSV
keywords: move_groups, servers, csv, rivermeadow, export
last_updated: April 17, 2019
summary: "Exporting servers from a move group to a format that can be used by RiverMeadow."
sidebar: main_sidebar
folder: userguides
permalink: exporting-servers-to-csv.html
---

Here we will show how to take an entire migration wave of servers from Tidal Migrations and export them for direct ingestion into RiverMeadow, to perform a VM migration.

# Requirements

This guides assumes you have access to a Linux like environment, you will need:

-   Posix compliant shell
-   [Curl](https://curl.haxx.se/download.html)
-   [jq](https://stedolan.github.io/jq/)
-   [A copy of the move group script](https://github.com/tidalmigrations/gists/blob/master/move_group_to_csv.sh)


# Steps


## 1. Authentication information

To authenticate to your account, we'll need to collect the subdomain, username, password. If you don't know what your subdomain is you can find it here:

{% include image.html file="subdomain.png" caption="An image highlighting how to find your organization's subdomain." %}

Once you have gathered this information, you'll need set it as an environment variable, substitute in your information to the commands below and run them in your shell:

```
    export username="<your username>"
    export password="<your password>"
    export subdomain="<your subdomain>"
```

## 2. Gather Move Group ID

To find the ID of the move group that you'd like to export, log in to the Tidal Platform, click the "Plan Migration" button under the "Planning" section in the menu. Once there, click on the Move Group that contains the servers you'd like to export. Here, you'll be able to find the ID of the move group at the end of the URL, as shown below:

{% include image.html file="move_group_id.png" caption="An image highlighting how to find a move group id." %}

Once you have this number, like you did in step 1, export the `move_group_id` as an environment variable.

    export  move_group_id="<your move group id>"


## 3. Run the script

You're ready to run the script and export this information to a CSV. Now that you have gathered the required information and saved it in `move_group_to_csv.sh`, you will need to run script and pipe the output to a CSV file:

    ./move_group_to_csv.sh > move_group.csv

Now the data you need for your server migration is in the file move_group.csv and can be imported into RiverMeadow.
