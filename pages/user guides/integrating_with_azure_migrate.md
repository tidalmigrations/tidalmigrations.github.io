---
toc: false
title: Integrating with Microsoft Azure Migrate
keywords: sync, import, discover, analyze, source code, discovery plan
last_updated: October, 2021
summary: "A walk through on how to synchronize Tidal Migrations with Microsoft Azure Migrate."
sidebar: main_sidebar
folder: userguides
permalink: azure-migrate.html
---

Here we will walk throug
h how to integrate Tidal Migrations with Azure Migrate.
This will allow your Microsoft Azure Migrate instance to use any servers from Tidal Migrations as possible targets to launch jobs against.
It will also allow us to completely synchronize the available servers in our environment between the two
migration analysis tools.
Further, we are able to specify and segregate our hosts into discrete groups based
on their categorization of tags from the Tidal Migrations API.

## Run the script

1. First step is install the integration script from the [Tidal Migrations Gists Repository]()

   - If you are using git you can clone the repository with:
     `git clone git@github.com:tidalmigrations/gists.git`

   - Alternatively you can download a copy of the latest file directly from [your browser](https://github.com/tidalmigrations/gists/archive/refs/heads/master.zip).

2. Second configure your environment variables to align with you azure subscription. There are four environment variables to run the export script from Azure Migrate, if any of them are unknown, here are hints on how to populate them. The shell script uses an environment variable Authentication token to authorize the Azure requests. Follow these steps to set the environment variables:

- Run `az login` and confirm the target subscription is present with `az account show`
- Set the defaul subscription with `az account set --subscription <SUBSCRIPTION_ID>`
  - Export as `AZURE_TOKEN`
- Find the Azure subscription and resource group that the Azure Migrate Project Assessment is located in
  - Export as `AZ_MIGRATE_SUBSCRIPTION`, `AZ_MIGRATE_RG` respectively
- Use the `-p` flag to show the machine names of the Project Assessments in that Subscription and Resource Group with `./azure_migrate -p` command
  - Export this project machine name as `AZ_MIGRATE_PROJECT`

```
export AZURE_TOKEN=$(az account get-access-token --query accessToken --output tsv)
export AZ_MIGRATE_SUBSCRIPTION= <SUBSCRIPTION_ID>
export AZ_MIGRATE_RG= <RESOURCE_GROUP>
export AZ_MIGRATE_PROJECT= <ASSESSMENT_PROJECT_MACHINE_NAME>
```

3. Once environment variables are configured, log into Tidal Tools using `tidal login` and authenticate with your custom subdomain url, email and password.

4. Execute the Azure Migrate export and pipe the servers into Tidal Tools using `sync servers`

```
./azure_migrate.rb | tidal sync servers
```

## Tutorial

<div>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/_ERzDACKWgw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
