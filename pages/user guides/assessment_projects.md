---
toc: false
title: Organizing your application assessments into projects
keywords: discover, assessment, projects, applications
last_updated: June, 2021
summary: "Group applications into projects to better scope your migrations and get more tailored insights"
sidebar: main_sidebar
folder: userguides
permalink: assessment-projects.html
---


# Assessment Projects

During your migration to the cloud, you might find yourself in charge of dozens or hundreds of applications. At Tidal, we have found it invaluable to segment our applications into groups for 3 reasons:

1. It allows you to easily track your assessment progress and report items like financial highlights, project goals, and projected savings to project managers or sponsors.
1. Segmenting applications into projects helps you to make sure that the needs and purpose of an assessment are aligned in terms of timelines or goals.
1. It helps breakdown a large migration project into several manageable chunks that can be parallelized and operated on by different teams.


You can find the projects page under the home section in the menu.

{% include image.html file="projects_menu.png" %}


## Creating a project

When you first visit `https://<your-subdomain>.tidalmg.com/#/projects`, it looks pretty barren.

{% include image.html file="projects_1.png" %}

However, _you_ can fix that! You can plant the seeds that will lead your orchard of projects to grow into a beautiful forest that will reach the clouds. To start, to plant your first seedling, you will need to click the `Create new project` button in the `Add Project` section found at the top of the page.

{% include image.html file="projects_2.png" %}

You will then be brought to a new page that allows you to set out some goals for your new project. This page includes settings for your timelines and financials, target cloud providers, the primary focus of your project, the project sponsor, and the guiding vision for the project.

{% include image.html file="projects_3.png" %}

It's OK to skip the fields you are unsure about. You can always come back to this page and adjust the details as things evolve.

## Bulk assign applications to a project
You also have the ability to bulk assign the applications you selected to a project. Simply navigate to the `Applications` tab under the `ASSESS` menu or manually visit `https://.tidalmg.com/#/apps`, select the applications you want to assign by clicking the checkboxes, and then click the `Project Assign` button.

{% include image.html file="projects_10.png" %}

This brings up a modal that contains a list of projects. You can search this list by the name of the project by typing the project name in the search bar above the list.

{% include image.html file="projects_11.png" %}

Additionally, you can easily create a brand new project by simply typing the project name in the search bar and clicking `Create New Project: [Your project name]`. Within seconds, this will create a new project with the name you entered. You can edit the project details later in the project details view.

{% include image.html file="projects_12.png" %}

Once you have selected the project you want to assign, continue the process by clicking the `Assign N App(s) to Project` button. If none of your selected applications have projects assigned to them, you will see the confirmation modal directly.

{% include image.html file="projects_13.png" %}

If there are any applications with assigned projects, you will see a warning modal containing a list of the conflicting applications. You can resolve the conflicts by clicking the `Remove` button beside each list item to deselect the application. Removed items will not be assigned to the project you selected.

You can also click the `Overwrite` button to remove the conflicting applications from their current project and assign them to the new project.

{% include note.html content="An application can only be assigned to one project at a time, so assigning it to a new project removes it from any project it was assigned to before. This action can alter the original project's status and highlights view." %}

{% include image.html file="projects_14.png" %}

Finally, you will see the confirmation modal, which tells you how many applications have been added to the project. It also has a clickable link to the selected project so you can verify the updates you just made. Or you can click the `Return` button, which will close the modal and keep you on the Applications page.

{% include image.html file="projects_13.png" %}

## Overview

Once you've set some goals and added some apps to your projects, you've laid a solid foundation to migrate your first set of applications to the cloud.

The top of this page has now changed, we've added a new section that gives you quick insight into the most recently updated project. We only have one project now, but as your portfolio grows, you will be able to easily keep track of where exactly each project is at in the assessment process. This section highlights the progress, timeline of the project, and gives you access to dive into the rest of the project's details.

{% include image.html file="projects_4.png" %}

Clicking the details button above causes a section to pop up on the right side of the screen that highlights some important information about your project. Alternatively, you can open up any project's details section by clicking the row for that project in the table.

{% include image.html file="projects_5.png" %}

Here you can see more information, around the finances, timelines, and project goals.

{% include image.html file="projects_6.png" %}

Additionally, you can view the project by the transition types you have chosen for your applications.

{% include image.html file="projects_7.png" %}

## Insights

Finally, after filling in all the information about your project and adding some applications to it, you can get a birds eye view of your project by clicking on the green Projects Insights button.

{% include image.html file="projects_8.png" %}

This will lead you to our insights page, where you can get an overview of your financial highlights, assessment overview, migration ROI, application resource utilization, security vulnerabilities, and technology breakdown.

{% include image.html file="projects_9.png" %}
