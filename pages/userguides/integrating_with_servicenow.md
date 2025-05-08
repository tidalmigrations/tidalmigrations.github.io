---
title: Integrating with ServiceNow
parent: User Guides
keywords: servicenow, data, integration, apps, servers, databases
last_updated: October, 2021
summary: "Easily integrate your Tidal workspace with ServiceNow"
sidebar: main_sidebar
permalink: integrate-with-servicenow.html
---

Prepare your ServiceNow instance by importing our custom-made update set, then creating an OAuth endpoint. Once this is set up, you can send your existing apps, servers and databases to your ServiceNow instance. All relationships between these entities will be preserved, and can be viewed in ServiceNow.  


{: .note }
This feature is currently available for beta users only.

We currently support syncing of applications, servers and databases with up to 3000 of each record.


## Preparing your ServiceNow Instance

### Importing the Tidal update set

You can find the Tidal ServiceNow update set [here](https://github.com/tidalmigrations/service-now/blob/master/Tidal%20SN%20CMDB%20Integration.xml):



- Sign in to your ServiceNow account with Administrator privileges.

- Type 'Update Sets' in the left side filter navigator.

{% include image.html file="update-set-step1.png" %}

-  Click on 'Retrieved Update Sets', and under 'Related Links' click the link to 'Import Update Set from XML'.

{% include image.html file="update-set-step2.png" %}

- Click 'Browse' and find the update set XML file on your computer. Once this is done, click 'Upload'. 

{% include image.html file="update-set-step3.png" %}

- After this has loaded, click 'Tidal CI Integration'.

{% include image.html file="update-set-step4.png" %}

- Next, click 'Preview Update Set' above 'Related Links'. This will take some time to load the update set.

{% include image.html file="update-set-step5.png" %}

- Once this has completed, close the loading bar and click 'Commit Update Set' in the top right corner of the window. This will show another loading bar as your update set is committed. This process should take around ten minutes.

{% include image.html file="update-set-step6.png" %}

- Once the update set has been committed, you can type 'Tidal' in the filter navigation bar, and see where your servers, apps and databases will be saved.

{% include image.html file="update-set-step7.png" %}

### Creating an OAuth endpoint

In order for your Tidal workspace to communicate with your ServiceNow instance, we must first set up an OAuth endpoint.

- Type 'System OAuth' into the filter navigation bar and select 'Application Registry'.

{% include image.html file="servicenow-oauth-step1.png" %}

- On this page, click 'New'.

{% include image.html file="servicenow-oauth-step2.png" %}

- Select 'Create an OAuth API endpoint for external clients'.

{% include image.html file="servicenow-oauth-step3.png" %}

- Enter a name, we suggest 'Tidal', then click 'Submit'.

{% include image.html file="servicenow-oauth-step4.png" %}

- Select the endpoint you just created (eg. 'Tidal').

{% include image.html file="servicenow-oauth-step5.png" %}

- From this screen, take note of:
     - Client ID
     - Client Secret

{% include image.html file="servicenow-oauth-step6.png" %}

- You're now ready to head over to your Tidal workspace and set up your integration!

## Integrating your Tidal workspace with ServiceNow

- Log into your Tidal workspace and head to the ServiceNow integration page.

`` https://[your workspace].tidal.cloud/_/#/servicenow ``

- Enter the following information:
    - Instance Name
    - Client ID
    - Client Secret
    - Username
    - Password

  Note: The username and password here are for your ServiceNow instance. If you don't know them, go to the ServiceNow developer page and find 'Manage instance password'. 

- Hit 'Create Connection' to connect this workspace to your ServiceNow instance. This action will automatically push all of your current apps, servers and databases over to your ServiceNow instance.

  {% include image.html file="integrate-tidal-step1.png" %}

- Return to ServiceNow and find your data under the Tidal -> 'Applications', 'Servers' and 'Databases' tables.

  {% include image.html file="integrate-tidal-step2.png" %}

  
  From this point on, any changes made to your Tidal workspace will be automatically synced over to your ServiceNow instance.  
  
