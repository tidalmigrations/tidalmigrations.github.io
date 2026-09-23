---
toc: false
parent: Assess
title: Organizing your application assessments into projects
layout: pages
keywords: discover, assessment, projects, applications
last_updated: November, 2022
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

You can find the projects page under the navigation bar.

## Creating a project

When you first visit `https://my_workspace.tidal.cloud/projects`, it looks pretty barren.

{% include image.html file="projects_1.png" %}

However, _you_ can fix that! You can plant the seeds that will lead your orchard of projects to grow into a beautiful forest that will reach the clouds. To start, to plant your first seedling, you will need to click the `Create new project` button in the `Add Project` section found at the top of the page.

{% include image.html file="projects_2.png" %}

You will then be brought to a new page that allows you to set out some goals for your new project. This page includes settings for your timelines and financials, target cloud providers, the primary focus of your project, the project sponsor, and the guiding vision for the project.

{% include image.html file="projects_3.png" %}

It's OK to skip the fields you are unsure about. You can always come back to this page and adjust the details as things evolve.

Project focus (for example savings, agility, and modernization goals) also influences [Transition Type Recommendations (6R)](transition-type-recommendations.html) for applications in the project. You can further tune how business value and migration complexity are balanced via project recommendation weights. See [How to customize recommendation behavior in a project](transition-type-recommendations.html#how-to-customize-recommendation-behavior-in-a-project).


## Bulk assign applications to a project
You also have the ability to bulk assign the applications you selected to a project. Simply navigate to the `Applications` tab under the `Inventory` menu or manually visit `https://my_workspace.tidal.cloud/applications`, select the applications you want to assign by clicking the checkboxes, and then click the `Project Assign` button.

{% include image.html file="projects_10.png" %}

This brings up a modal that contains a list of projects. You can search this list by the name of the project by typing the project name in the search bar above the list.

{% include image.html file="projects_11.png" %}

Once you have selected the project you want to assign, continue the process by clicking the `Assign to Project` button. If none of your selected applications have projects assigned to them, you will see the confirmation message directly.

{% include image.html file="projects_12.png" %}

If there are any applications with assigned projects, you will see a warning modal containing a list of the conflicting applications. You can resolve the conflicts by clicking the `Remove` button beside each list item to deselect the application. Removed items will not be assigned to the project you selected.

You can also click the `Overwrite` button to remove the conflicting applications from their current project and assign them to the new project.

{% include note.html content="An application can only be assigned to one project at a time, so assigning it to a new project removes it from any project it was assigned to before. This action can alter the original project's status and highlights view." %}

{% include image.html file="projects_13.png" %}

Finally, you will see the confirmation message.

{% include image.html file="projects_12.png" %}

## Overview

Once you've set some goals and added some apps to your projects, you've laid a solid foundation to migrate your first set of applications to the cloud.

Go to `Projects` under the menu or manually visit `https://my_workspace.tidal.cloud/projects`. You'll notice some changes in this view. We've added new sections that give you overall timeline, assessment progress and transition types. We only have one project now, but as your portfolio grows, you will be able to easily keep track of where exactly each project is at in the assessment process. This section highlights the progress, timeline of the project, and gives you access to dive into the rest of the project's details.

{% include image.html file="projects_4.png" %}

You can open up any project's details section by clicking the name of that project in the table. Here you can see more information, around the finances, timelines, and project goals.

{% include image.html file="projects_5.png" %}

You can find more information about the project in various tabs.

## Insights

Finally, after filling in all the information about your project and adding some applications to it, you can get a birds eye view of your project by clicking on the `Insights` tab. This will lead you to our insights page, where you can get an overview of your financial highlights, assessment overview, migration ROI, application resource utilization, security vulnerabilities, and technology breakdown.

{% include image.html file="projects_6.png" %}

## Settings

Project settings let you tune how Accelerator scores the applications in that project. These settings change how recommendations and scores are calculated, they do not change the underlying inventory data on your applications and servers.

Each group of weights is expressed as percentages that must sum to 100. When you change a weight, adjust the others so the total remains 100 before saving. After you save, Accelerator recomputes the affected recommendations and scores for the project's applications in the background, so the new values may take a short time to appear.


### 6R Recommendation

The 6R Recommendation weights control how Accelerator produces the [Recommended Transition Type](transition-type-recommendations.html) for each application in the project. Accelerator scores every application on two axes and places it in a business value by migration complexity space to pick a transition type.

These weights set the relative emphasis of the two axes:

- Business value: how valuable the application is to the business.
- Migration complexity: how complex the application is to migrate or modernize.

By default, the two are balanced at 50 each. Increasing the weight on migration complexity tilts recommendations toward complexity-led dispositions, while increasing the weight on business value tilts them toward value-led dispositions.

{% include image.html file="project_settings_1.png" alt="the 6R Recommendation weights" %}

The business value and migration complexity axes are themselves made up of the finer-grained signals described in [Business Criticality](#business-criticality) and [Migration Complexity](#migration-complexity) below. Adjust the 6R Recommendation balance first, then use those sections if you need more granular control.

### Modernization Score

The Modernization Score weights control how applications are scored for the Modernization Viability Assessment (MVA) shortlist in the [Modernization Assessment](modernization-assessment.html) presentation. Accelerator scores each application on three factors and combines them into a weighted score used to recommend applications for the MVA stage.

The three factors are:

- Ease of modernization: how straightforward the application is to modernize, drawn from source code analysis and data on dependent servers and database instances. See [Ease of Modernization](modernization-assessment.html#ease-of-modernization).
- Business criticality: how important the application is to the business. See [Business Criticality](modernization-assessment.html#business-criticality).
- ROI potential: the expected return on investment from modernizing the application. See [ROI Potential](modernization-assessment.html#roi-potential).

By default, ease of modernization is weighted at 34, and business criticality and ROI potential are weighted at 33 each. Adjusting these weights changes which applications rise to the top of the MVA shortlist.

{% include image.html file="project_settings_2.png" alt="the Modernization Score weights" %}

### Migration Complexity

For greater granularity, you can configure the signals that make up an application's migration complexity score. Migration complexity feeds both the [6R Recommendation](#6r-recommendation) (as one of its two axes) and the [Modernization Score](#modernization-score) (through the ease of modernization factor). These weights determine how much each signal contributes to the overall migration complexity score.

The signals are:

- PaaS readiness: how ready the application is to move to a platform-as-a-service model.
- Dependent servers count: the number of servers the application depends on.
- Dependent apps count: the number of other applications the application depends on.
- Operating system complexity: the complexity introduced by the operating systems in use.

By default, PaaS readiness is weighted at 35, dependent apps count at 25, and dependent servers count and operating system complexity at 20 each.

{% include image.html file="project_settings_3.png" alt="the Migration Complexity weights" %}

### Business Criticality

You can also configure the signals that make up an application's business criticality score. Business criticality feeds both the [6R Recommendation](#6r-recommendation) (as the business value axis) and the [Modernization Score](#modernization-score) (through the business criticality factor). These weights determine how much each signal contributes to the overall business criticality score.

The signals are:

- Revenue: the revenue associated with the application.
- Person hours saved: the staff time the application saves.

By default, revenue and person hours saved are weighted at 50 each.

{% include image.html file="project_settings_4.png" alt="the Business Criticality weights" %}

### Bypass Source Code Analysis Requirement

By default, Accelerator requires source code analysis to be complete for an application before it produces a [Recommended Transition Type](transition-type-recommendations.html) for it. This setting is a single toggle that lets you bypass that requirement for the project, so applications can receive a 6R recommendation without source code analysis. You may want to do this in cases where you do not have access to the source code, and you accept the trade-off that the recommendations will be less accurate due to this missing data.

{% include image.html file="project_settings_5.png" alt="the toggle to bypass the source code analysis requirement" %}

{: .note }
Source code analysis contributes to the ease of modernization and migration complexity signals. Bypassing the requirement lets recommendations run sooner, but they will be based on less evidence until source code analysis is complete.