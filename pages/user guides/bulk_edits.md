---
toc: false
title: Bulk Edits
keywords: discovery, edits, data, portfolio, bulk, actions
last_updated: April, 2025
summary: "Efficiently manage your data by performing actions on multiple records simultaneously"
sidebar: main_sidebar
folder: userguides
permalink: bulk-edits.html
---

Tidal Accelerator streamlines your cloud migration workflow by enabling powerful bulk operations across your portfolio. You can manage multiple records at once - from assigning servers to applications in bulk, to copying values across multiple applications, and consolidating environments. These bulk operations help you maintain consistency and save time when working with large application portfolios during your migration journey.

## Bulk Editing Applications, Servers and Databases

When working with Applications, Server or Databases, you might need to apply changes to multiple records at once. This process works the same way for all three record types, but for the purposes of this guide we'll work with Applications.

From the Applications view, select the checkboxes for the records you'd like to edit. You can use the search bar to narrow down your selection by name or tag, or use advanced filtering to narrow down your search by record attribute.

For this example, say we have some new information and we'd like to update the technical lead for all apps with the tag 'Group 1'. 

{% include image.html file="edit-apps-1.png" %}

After making your selection, open the 'Bulk Actions' dropdown and select 'Edit'

{% include note.html content="You must click the checkbox for each record you plan to edit, rather than clicking the 'select all' checkbox at the top of the checkbox role." %}

{% include image.html file="edit-apps-2.png" %}

In the drawer, enter the values for the field or fields that you'd like to change. For our example, we'll set 'Technical Lead' to 'Addie Stroman'.

{% include image.html file="edit-apps-3.png" %}

Next, click 'Submit', and your changes will be applied to your selected records.

{% include image.html file="edit-apps-4.png" %}

## Bulk Assigning Server to Applications

When working with servers, sometimes it's necessary to associate many of your existing servers to an application record. For this example, we're going to associate all servers with the fully qualified domain name (FQDN) 'Abcya.com' with the application named 'ABCya!'.

First, use the advanced filtering drawer to filter your servers by FQDN.

{% include image.html file="assign-servers-1.png" %}

Now, select the servers you'd like to assign.

{% include image.html file="assign-servers-2.png" %}

Next, under the 'Bulk Actions' menu, click 'Assign to Application'.

{% include image.html file="assign-servers-3.png" %}

Now select the application that you'd like to assign your selected servers to. For this example we will select 'ABCya!'. Once you've selected the app, click 'Assign'. 

{% include image.html file="assign-servers-4.png" %}

The servers will now be assigned to your selected application.

{% include image.html file="assign-servers-5.png" %}

## Copy Values Across Applications

## Merge Environments