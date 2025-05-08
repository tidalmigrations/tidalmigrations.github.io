---
toc: false
parent: User Guides
title: Bulk Editing Records
keywords: discovery, edits, data, portfolio, bulk, actions
last_updated: April, 2025
summary: "Efficiently manage your data by performing actions on multiple records simultaneously"
sidebar: main_sidebar
folder: userguides
permalink: bulk-edits.html
---

Tidal Accelerator streamlines your cloud migration workflow by enabling powerful bulk operations across your portfolio. You can manage multiple records at once - from assigning servers to applications in bulk, to copying values across multiple applications, and consolidating environments. These bulk operations help you maintain consistency and save time when working with large application portfolios during your migration journey.

## Bulk Editing Applications, Servers and Database Instances

When working with applications, servers, or database instances, you might need to apply changes to multiple records at once. This process works the same way for all three record types, but for the purposes of this guide, we'll work with applications.

From the "Applications" view, select the checkboxes for the records you'd like to edit. You can use the search bar to narrow down your selection by name or tag, or use advanced filtering to narrow down your search by record attribute.

{% include image.html file="edit-apps-1.png" %}
<br>

After making your selection, open the 'Bulk Actions' dropdown and select 'Edit'.

{: .note }
You must click the checkbox for each record you plan to edit, rather than clicking the 'select all' checkbox at the top of the checkbox role.

{% include image.html file="edit-apps-2.png" %}
<br>

In the drawer, enter the values for the field or fields that you'd like to change.

{% include image.html file="edit-apps-3.png" %}
<br>

Click 'Submit', and your changes will be applied to your selected records.

{% include image.html file="edit-apps-4.png" %}

## Bulk Assigning Servers to an Application

When working with servers, sometimes it's necessary to associate many of your existing servers to an application record. You may want to do this because the records were not associated when they were originally imported into Accelerator, or maybe you have some new information about your inventory and you need to update your data in Accelerator to match this.

First, select the servers you'd like to assign.

{% include image.html file="assign-servers-1.png" %}
<br>

Under the 'Bulk Actions' menu, click 'Assign to Application'.

{% include image.html file="assign-servers-2.png" %}
<br>

Select the application that you'd like to assign your selected servers to. Once you've made your selection, click 'Assign'. 

{% include image.html file="assign-servers-3.png" %}
<br>

The servers will now be assigned to the selected application.

{% include image.html file="assign-servers-4.png" %}
<br>

## Copy Values Across Applications

In Tidal Accelerator, it's considered best practice to model the same application in different environments as separate application records. This is because separate instances of an application in different environments can have different needs when it comes to planning a migration. For example, an application running in a development environment has different uptime requirements, resources, and dependencies than that same application running in your production environment.

However, these separate application records also share many of the same attributes, and it can be time consuming to enter the same data for each application record.

To this end, you can copy values from an application to other instances of that application. We determine the 'other instances' as application records with the same name but different environments.

To begin, from the application record page, click 'Copy To'.

{% include image.html file="copy-apps-1.png" %}
<br>

You will be shown a list of other application instances to copy the values to. Select the application records and click 'Continue'.

{% include image.html file="copy-apps-2.png" %}
<br>

You will be shown a list of the application values to copy over. These are presented alongside the existing values of your selected target applications, if present. Select any of the values that you'd like to copy over and click 'Continue'.

{% include image.html file="copy-apps-3.png" %}
<br>

You will be shown a confirmation message explaining what you're about to do, and how many records it will affect. If you are satisfied, click 'Confirm'.

{% include image.html file="copy-apps-4.png" %}
<br>

The selected values will now be copied to the selected applications.

## Merge Environments

Life is rarely perfect, and the spreadsheet inventory that you will get from your clients will have several environments with different names, which represent the same environment. For example you might have an environment named 'Production', and an environment named 'Prod', and you'd like to merge these environments together.

By merging one environment into another, all of the applications, servers, and database instances that were in the merged environment will be placed in the target environment, and the merged environment will be deleted.

To begin, navigate to the environments page.

{% include image.html file="merge-environments-1.png" %}
<br>

Select the environment that you would like to merge, then click 'Merge'.

{% include image.html file="merge-environments-2.png" %}
<br>

From the dropdown list, select the environment that you'd like to merge this environment into.

{% include image.html file="merge-environments-3.png" %}
<br>

You will be shown a message explaining the changes that you're about to make. If you're satisfied, click 'Merge'.

{% include image.html file="merge-environments-4.png" %}
<br>

All records in the merged environment will be added to the target environment, and the merged environment will be deleted.

{% include image.html file="merge-environments-5.png" %}

## Bulk Applying Tags

Tags are a great way to group and organize your records. You can apply tags in bulk to applications, servers and databases instances. For the purposes of this guide, we'll work with applications.

First, navigate to the "Applications" view and select the applications that you'd like to apply your tag to. 

{% include image.html file="apply-tags-1.png" %}
<br>

Once you've made your selection, open the "Bulk Actions" menu and click "Apply Tag".

{% include image.html file="apply-tags-2.png" %}
<br>

Select a tag from the drop-down list. 

{: .note }
You can create a new tag directly in this drop-down. Simply enter the desired tag name, and the option to create this tag will appear.

{% include image.html file="apply-tags-3.png" %}
<br>

After selecting the tag, click assign. The tag will then be applied to your selected records.
