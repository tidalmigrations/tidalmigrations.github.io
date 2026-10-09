---
toc: false
parent: Assess
title: Generating an AWS MAP Funding Request
layout: pages
keywords: map, funding, request, aws, calculator, json, assessment, accelerator
last_updated: October, 2026
summary: "Review, edit, and download the AWS MAP funding request data for a project as JSON."
sidebar: main_sidebar
permalink: map-funding-request.html
---

Tidal Accelerator can step you through assembling an AWS Migration Acceleration
Program (MAP) funding request by combining inventory data gathered in your
workspace with an AWS Pricing Calculator estimate.

## Before you begin

Before generating a funding request, ensure your project has the required data:

- **In-scope applications and servers**: Group your migration scope into a project.
  If you have not done this yet, see the [Projects](assessment-projects.html) guide.
- **Project start date**: Set an initial date for the project under the 'Overview'
  tab. Accelerator uses this as the assessment initial date.
- **AWS Calculator URL**: Save a shareable AWS Pricing Calculator estimate link
  to the project. Several pricing metrics and service lines are derived from this
  estimate.
- **Workload profiles**: Generate and review them on the project's 'Workload Profiles' tab first.

{: .important }
The 'MAP Funding Request' button remains disabled until an AWS Calculator link
is saved to the project. To add the link, navigate to the 'Overview' tab of your
project, scroll to the 'MAP Funding Request' card, click 'Edit', paste your
estimate link into 'AWS Calculator URL', and click 'Save'.

{% include image.html file="map-funding-request-1.png" alt="the project overview with the AWS Calculator link saved" %}

## Opening the MAP Funding Request

1. Navigate to the project you want to generate the request for.

2. Click the 'MAP Funding Request' button.

{% include image.html file="map-funding-request-2.png" alt="the MAP Funding Request button on the project view" %}

Accelerator fetches the funding request data for the project and displays it for
you to validate and review. Several values in this data are derived from the project's AWS
Calculator link, so review all data points carefully to ensure that they line up with what
you expect given the data in your Accelerator workspace.

{% include image.html file="map-funding-request-3.png" alt="the MAP Funding Request validation modal" %}

## Reviewing and editing the data

The modal shows every value that will be included in the funding request JSON,
grouped into sections. You can review each section and edit the values before
you download.

Most fields are editable. The workload profiles are shown for reference and are
read only. The sections that hold lists, such as services and excluded costs,
allow you to add and remove rows as needed.

{% include image.html file="map-funding-request-4.png" alt="editing values in the MAP Funding Request modal" %}

{: .note }
Edits you make here apply to the downloaded file only. They do not change the
underlying project, application, or server records.

## Downloading the JSON

When you are satisfied with the data, click 'Download' to save it as a JSON
file.

{% include image.html file="map-funding-request-5.png" alt="downloading the MAP Funding Request as JSON" %}
