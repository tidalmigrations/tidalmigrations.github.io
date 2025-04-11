---
toc: false
title: Bulk Editing Records
keywords: discovery, edits, data, portfolio, bulk, actions
last_updated: April, 2025
summary: "Efficiently manage your data by performing actions on multiple records simultaneously"
sidebar: main_sidebar
folder: userguides
permalink: bulk-edits.html
---

Tidal Accelerator streamlines your cloud migration workflow by enabling powerful bulk operations across your portfolio. You can manage multiple records at once - from assigning servers to applications in bulk, to copying values across multiple applications, and consolidating environments. These bulk operations help you maintain consistency and save time when working with large application portfolios during your migration journey.

## Bulk Editing Applications, Servers and Databases

When working with applications, servers, or databases, you might need to apply changes to multiple records at once. This process works the same way for all three record types, but for the purposes of this guide, we'll work with Applications.

From the "Applications" view, select the checkboxes for the records you'd like to edit. You can use the search bar to narrow down your selection by name or tag, or use advanced filtering to narrow down your search by record attribute.

For this example, say we have some new information and we'd like to update the technical lead for all applications with the tag 'Group 1'. 

{% include image.html file="edit-apps-1.png" %}
<br>

After making your selection, open the 'Bulk Actions' dropdown and select 'Edit'

{% include note.html content="You must click the checkbox for each record you plan to edit, rather than clicking the 'select all' checkbox at the top of the checkbox role." %}
<br>

{% include image.html file="edit-apps-2.png" %}
<br>

In the drawer, enter the values for the field or fields that you'd like to change. For our example, we'll set 'Technical Lead' to 'Addie Stroman'.

{% include image.html file="edit-apps-3.png" %}
<br>

Next, click 'Submit', and your changes will be applied to your selected records.

{% include image.html file="edit-apps-4.png" %}

## Bulk Assigning Servers to an Application

When working with servers, sometimes it's necessary to associate many of your existing servers to an application record. For this example, we're going to associate all servers with the fully qualified domain name (FQDN) 'Abcya.com' with the application named 'ABCya!'.

First, use the advanced filtering drawer to filter your servers by FQDN.

{% include image.html file="assign-servers-1.png" %}
<br>

Now, select the servers you'd like to assign.

{% include image.html file="assign-servers-2.png" %}
<br>

Next, under the 'Bulk Actions' menu, click 'Assign to Application'.

{% include image.html file="assign-servers-3.png" %}
<br>

Now, select the application that you'd like to assign your selected servers to. For this example we will select 'ABCya!'. Once you've selected the app, click 'Assign'. 

{% include image.html file="assign-servers-4.png" %}
<br>

The servers will now be assigned to your selected application.

{% include image.html file="assign-servers-5.png" %}
<br>

## Copy Values Across Applications

In Tidal Accelerator, it's considered best practice to model the same application in different environments as separate application records. This is because separate instances of an application in different environments can have different needs when it comes to planning a migration. For example, an application running in a development environment has different uptime requirements, resources, and dependencies than that same application running in your production environment.

However, these separate application records also share many of the same attributes, and it can be time consuming to enter the same data for each application record.

To this end, you can copy values from an application to other instances of that application. We determine the other instances as application records with the same name but different environments.

For our example, say we have an application 'ABCya!', with all of its relevant data captured. We also have two other instances of this application in different environments that we want to copy some of this data to.
First, from the application record page, click 'Copy To'.

{% include image.html file="copy-apps-1.png" %}
<br>

Next you will be shown a list of applications to copy the values to. Select the application records and click 'Continue'.

{% include image.html file="copy-apps-2.png" %}
<br>

Now you will be shown a list of the application values to copy over. These are presented alongside the existing values of your selected target applications, if present. Select any of the values that you'd like to copy over and click 'Continue'.

{% include image.html file="copy-apps-3.png" %}
<br>

You will be shown a confirmation message explaining what you're about to do, and how many records it will affect. If you are satisfied, click 'Confirm'.

{% include image.html file="copy-apps-4.png" %}
<br>

The selected values will now be copied to the selected applications.

## Merge Environments

Life is rarely perfect, and the spreadsheet inventory that you will get from your clients will have several environments with different names, which represent the same environment. For example you might have an environment named 'Production', and an environment named 'Prod', and you'd like to merge these environments together.

By merging 'Prod' into 'Production', all of the applications, servers and databases that were in the 'Prod' environment will be placed in the 'Production' environment, and the 'Prod' environment will be deleted.

To begin, navigate to the environments page.

{% include image.html file="merge-environments-1.png" %}
<br>

Select the environment that you would like to merge. For our example, we will select 'Prod', then click 'Merge'.

{% include image.html file="merge-environments-2.png" %}
<br>

From the dropdown list, select the environment that you'd like to merge this environment into. For this example, we will select 'Production'.

{% include image.html file="merge-environments-3.png" %}
<br>

You will be shown a message explaining the changes that you're about to make. If you're satisfied, click 'Merge'.

{% include image.html file="merge-environments-4.png" %}
<br>

All records in the merged environment will be added to the target environment, and the merged environment will be deleted.

{% include image.html file="merge-environments-5.png" %}

