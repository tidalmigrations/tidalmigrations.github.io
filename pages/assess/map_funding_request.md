---
toc: false
parent: Assess
title: Generating an AWS MAP Funding Request
layout: pages
keywords: map, funding, request, aws, calculator, json, assessment, accelerator, aws
last_updated: October, 2026
summary: "Review, edit, and download the AWS MAP Funding Request data for a project as JSON."
sidebar: main_sidebar
permalink: map-funding-request.html
---

Tidal Accelerator can step you through the process of assembling an AWS MAP
funding request, by combining data that you've gathered in your workspace
with an AWS calculator URL.

## Before you begin

To create a MAP funding request, you must first organize your apps into a project.
If you haven't done this yet, see see the [Projects](assessment-projects.html) guide.

You will then need to save an AWS Calculator link to the project. Several of the
pricing values in the funding request are derived from this calculator link, so
it must be present before you can begin.

{: .important }
The 'MAP Funding Request' button stays disabled until an AWS Calculator link is
saved to the project. Add the link to the project first, by saving it in the 'MAP Funding Request'
section of the Project overview. This will enable the 'MAP funding Request' button for the project.

{% include image.html file="map-funding-request-1.png" alt="the project overview with the AWS Calculator link saved" %}

## Opening the MAP Funding Request

1. Navigate to the project you want to generate the request for.

1. Click the 'MAP Funding Request' button.

   {% include image.html file="![alt text](image.png).png" alt="the MAP Funding Request button on the project view" %}

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
