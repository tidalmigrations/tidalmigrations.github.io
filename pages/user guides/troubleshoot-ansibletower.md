---
title: Troubleshooting Ansible Tower Integration
keywords: ansible tower, troubleshoot, integration
last_updated: August, 2018
summary: "Troubleshoot any issues that arise when configuring Ansible Tower"
sidebar: user_guidesbar
permalink: troubleshoot-ansible.html
---

Here we outline some issues that can arise when configuring Ansible Tower to integrate with the Flow Migration Suite.

## Troubleshooting Sync Jobs

When a sync job is running you can easily check the status of it from the Jobs tab. 
Navigate to the Jobs page and click on the job you are interested in.

{% include image.html file="troubleshoot1.png" %}

This should give you a summary of the job as well as the standard output for the job. In the example below, we can see that the job failed because the license has expired.

{% include image.html file="troubleshoot2.png" %}


## Sync Fails

Some possible issues with a sync failing are not correctly setting the environment variables or an invalid license.

### Credentials

Ensure you set the credentials correctly via the environment variables.

### Proxy

Does Ansible Tower need to use a proxy to reach the Tidal Migrations, ie. the internet? If so you need to set the environment variables for the proxy.

### License

In order to import servers you need a valid license for Ansible. When viewing the job status, under the standard output it will say if the license has expired. If so contact Red Hat to extend your license with them.

## Sync runs

Your sync job runs but you did not get the results you expected?

### No hosts are added

If you are using a configuration file and have specified either the 'filter-tags' or 'groups' tag, it is possible that the keys you have specified result in no matching servers from Flow Migration.

- Ensure you have spelt the tag names correctly, they are case sensitive.
- Ensure you are using the correct logic methodology.

To do a sanity check, you can do a similar query via the Tidal Migrations API directly for the tags and logic you have specified to ensure that the correct number of results are being returned.

### Servers added do not match the configuration file criteria

- Ensure you set the variable CONFIG_PATH to the correct location of the file.
- Ensure the file is readable by Ansible Tower. Ansible Tower, by default runs processes as the user, awx. You may need to change the permissions of the config file with a command similar to: chmod +r /opt/tidal/flow_inventory_config.yml Replacing the path with the path to your file.
