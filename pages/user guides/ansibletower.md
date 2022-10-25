---
toc: false
title: Integrating with Ansible Tower
keywords: sync, import, discover, analyze, source code, discovery plan
last_updated: July, 2018
summary: "A walk through on how to integrate Tidal with Ansible Tower."
sidebar: main_sidebar
folder: userguides
permalink: ansible-tower.html
---

Here we will walk through how to integrate Tidal with Ansible Tower.
This will allow your Ansible Tower instance to use any servers from Tidal as possible targets to launch jobs against.
It will also allow us to completely synchronize the available servers in our environment between the two
applications so our Ansible Tower inventory is always up to date.
Further, we are able to specify and segregate our hosts into discrete groups based
on their categorization of tags from the Tidal API.


## Install the script

The first step is to install the Inventory Script into Ansible Tower.

1. First locate a copy of the script from here.

    - If you are using git you can clone the repository with:
        ` git clone git@github.com:tidalmigrations/ansible-tower-integration.git `

    - Alternatively you can download the file directly from your browser here.

2. Second open your Ansible Tower installation and navigate to the Create Inventory Scripts page.

    {% include image.html file="Ansible11.png" %}
    {% include image.html file="Ansible2.png" %}

3. On the 'New Custom Inventory' page:

    - Define a name for your script, for example 'Tidal' and an optional description.
    - Specify an Organization, or leave it set to 'Default'.
    - In the 'Custom Script' box copy and paste a copy of the script into the text field.
    - Click Save.

    {% include image.html file="ansible4.png" %}



See [here](https://docs.ansible.com/ansible-tower/latest/html/administration/custom_inventory_script.html) for the latest instructions from Ansible, on Installing a Custom Script.

## Add an Inventory

An [Inventory](https://docs.ansible.com/ansible-tower/3.0.3/html/installandreference/glossary.html#term-inventory) is a collection of hosts against which jobs may be launched, the same as an Ansible inventory file.
Inventories are divided into groups and these groups contain the actual hosts.
Groups may be sourced manually, by entering host names into Tower, from one of Ansible Tower’s supported cloud providers or from a custom inventory script.
In this case we will be setting up an inventory and a group to populate hosts from the custom inventory script we have just added.
If you already have an inventory setup you can skip this step and continue below by adding a group.


1. Begin with the Inventories tab on the Main Menu and click the green 'Add' button to.

    {% include image.html file="Ansible12.png" %}


2. Give your new inventory a name, and specify an Organization.

    {% include image.html file="Ansible5.png" %}

3. Click Save.

See [here](https://docs.ansible.com/ansible-tower/latest/html/userguide/inventories.html#add-a-new-inventory) for the latest documentation on how to add an Inventory.


## Add a Group

A [group](https://docs.ansible.com/ansible-tower/3.0.3/html/installandreference/glossary.html#term-group) is a set of hosts
in Ansible that can be addressed as a set, of which many may exist within a single Inventory. Here we will add a new group to the Inventory we just created.

1. Begin by selecting the newly created inventory or an inventory of your choice from the list of Inventories.

2. Click 'Add Group' to add a new group to this Inventory.

    {% include image.html file="Ansible6.png" %}

3. Now specify a Name.

4. You must specify the Source to be 'Custom Script' and select the script you have previously added under Custom Inventory Script.

5. Now specify the following environment variables for the script to use:

    - TIDAL_DOMAIN
    - TIDAL_EMAIL
    - TIDAL_PASSWORD


These are needed to allow the script to locate and authenticate your Tidal API.
If the environment the script is running in will need a proxy to access your Tidal API you can set two environment variables for the proxy address with:

- HTTP_PROXY
- HTTPS_PROXY

{% include image.html file="Ansible7.png" %}

See [here](https://docs.ansible.com/ansible-tower/latest/html/userguide/inventories.html#add-a-new-group) for more on how to add a new Group.
Also see [here](https://docs.ansible.com/ansible-tower/latest/html/userguide/inventories.html#custom-script) about how to use a custom scrpt with a Group.

## Setting a Sync Schedule

You can specify a schedule for the inventory script to run on automatically.
This allows Ansible Tower to automatically sync and update the available hosts.

1. Begin by locating the inventory and the group we want to schedule.

2. Click the small calendar icon under the group Actions.


    {% include image.html file="Ansible8.png" %}

3. Click the 'Add' button to add a new schedule.

    {% include image.html file="Ansible9.png" %}

4. Fill out all the needed criteria for the schedule and click save.

    {% include image.html file="Ansible10.png" %}

See [here](https://docs.ansible.com/ansible-tower/latest/html/userguide/inventories.html#add-a-new-schedule) for the latest instructions on creating a Schedule.

## Custom Configuration

A configuration file can optionally be provided to customize the results returned by the script.
This configuration allows your to filter the servers that are returned from the Tidal API based on their tags.
This allows you to create groups within Ansible Tower that correspond to specific sets of servers from your Tidal Application. Additionally, you are able to specify the property used to represent the host name in Ansible Tower.
If no configuration file is provided the script will use the default values specified below.

To use the configuration file:

1. Put the file on a system that is accessible to ansible tower.
2. Specify it's location via an environment variable, CONFIG_PATH. An example would be:

`CONFIG_PATH: /opt/tidal/tidal_config.yml`

This environment variable is set in the same manner as the other environment variables above.

An example configuration file could look like this:

```
property: "fqdn"

groups:
  non-test:
    logic: None
    tags:
      - TEST
  production:
    logic: Any
    tags:
      - PROD
      - Production

filter-tags:
  logic: Any
  tags:
    - TEST

```

All three keys; property, groups and filter-tags are optional. The groups key has precedence over the filter-tags key, and therefore filter-tags will be ignored if groups is present.

The following keys are accepted:

**property**

The property key is used to specify the property that will be used as the hostname for the servers.

Note that this property must be unique across all servers.

The default value for property is 'fqdn' when it is not specified.


**groups**

The groups key can be used to specify sets of tags to define one or more groups of servers. The tags correspond to tags from the Tidal Application.

This key has higher precedence than filter-tags; if the groups key is present these parameters are used and the filter-tags key is ignored. The groups key is optional, if there is no key then the results will not be grouped.

Each key for groups is any arbitrary name that will define the group in Ansible Tower. Each group accepts two keys.

- **tags**: A list of strings that specify the names of the tags used to define the group. Specify the name of each tag as an item in the list. You must specify at least one item. Tag names are case sensitive.
- **logic**: Accepts 3 values, 'Any', 'All' or 'None'. By default, if no 'logic' key is specified, 'All' is used.
- Options:
    - **Any**: specifies that an application is included when it has one of listed tags.
    - **All**: specifies that an application is included when it has all of the listed tags.
    - **None**: specifies that an application is included when it has none of the tags specified.


**filter-tags**

Can be used to filter all servers based on a set of tags. Works very similar to the groups functionality, the only difference is that you can not name the resulting group.

This key has lower precedence than 'groups'; if the groups key is specified these parameters will be ignored.

The accepted keys and structure for this tag is identical to the 'groups', just specify a 'logic' and 'tags' key directly. You are not able to name the group here, instead the 'logic' and 'tags' keys are assigned directly under the 'filter-tags' key.

This parameter is optional, if there is no key then all servers will be returned.



## Summary

Hopefully at this point you are able to run a sync job that will pull data from your Tidal API into Ansible Tower. If you are still having trouble getting setup, checkout the [troubleshooting article](https://guides.tidalmg.com/troubleshoot-ansible.html) with some more tips on common issues.
