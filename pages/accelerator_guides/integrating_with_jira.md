---
toc: false
parent: Accelerator Guides
title: Integrating with Jira
keywords: tasks, migrations, integration
last_updated: February, 2023
sidebar: main_sidebar
folder: userguides
permalink: integrate-with-jira.html
---


# Enabling Task Tracking and Assignment

Cloud migrations aren't just a solo activity. It's a big job that
requires coordination across your organization. Using Tidal's Task
integration with Jira, we enable you to tie your cloud migration tasks
to resources within Tidal. This helps teams track what tasks are
assigned to which resources and where your project overall stands in
it's migration.


## Enabling Jira

Before we can pull in data from Jira, we need you to
authorize Tidal.
From within Tidal Accelerator:

1.  Select Integration Sync under the Discovery Tool's menu section
    
    {% include image.html file="tasks-step-1.png" %}
    
2.  Scroll down until you see the Jira section and click on "Enable
    Integration"
    
    {% include image.html file="tasks-step-2.png" %}
        
3.  Follow Jira's steps to give Tidal read access to your Jira account
    
    {% include image.html file="tasks-step-3.png" %}
            
4.  Finally, if everything has gone according to plan, you should be
    taken back to the integrations page on Tidal Accelerator. You
    should also see a date stamp, confirming when you enabled the
    integration within the Jira section of the page.

{% include image.html file="tasks-finalized.png" %}

Congratulations! We'll start syncing in boards and task cards into our
projects, and within a couple of minutes you'll be able to start
assigning boards to projects.

It's important to note that we envision that one or more `Jira
Projects` can map to a project in our system and that once you have
attached a `Jira Project` to a `Tidal Project` you can you start
associating tasks to Tidal Resources (Migration Waves, Applications,
Servers, Database Instances). The tasks that you're able to assign to
a Tidal resource are based off of what `Tidal Project` that resource
is attached to.
