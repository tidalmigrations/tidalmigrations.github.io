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

Accelerator fetches the funding request data for the project and displays it in
a validation modal. Several values are derived from your saved AWS Calculator link
and inventory, so review each section carefully to ensure the figures match
expectations.

{% include image.html file="map-funding-request-3.png" alt="the MAP Funding Request validation modal" %}

## Reviewing and editing the data

The modal displays all fields included in the AWS funding request JSON, grouped
into sections:

- **Assessment Output**: Engagement metadata, including the assessment initial date,
  completion date, six-month expiry date, assessment method ('SELF SERVICE'), and
  applicable compliance frameworks.
- **Assessment Scope**: Scope metrics across the estate, including total assets in
  scope, compute servers, storage volume (in whole terabytes), database instances,
  Assessed Scope ARR, and Committed Migration Scope ARR.
- **Pricing Output**: Cloud cost forecasts and financial comparisons derived from
  your AWS Calculator estimate, including annual on-demand pricing, 1-year and 3-year
  discounted plans, upfront costs, on-premises annual TCO, and estimated savings percentage.
- **Services**: Line items for each AWS service in your pricing estimate (such as EC2
  instances and EBS volumes). You can edit row values, delete rows with 'Remove', or
  add new lines with '+ Add row'.
- **Excluded Costs**: Optional costs excluded from cloud pricing (such as retained
  systems or third-party licensing). You can add rows with '+ Add row' or delete rows
  with 'Remove'.
- **Workload Profiles**: A summary of assessed workload types, migration strategies,
  and target AWS services. These rows are read-only in this modal; to make changes,
  update your profiles on the project's 'Workload Profiles' tab before opening the
  request.

{% include image.html file="map-funding-request-4.png" alt="editing values in the MAP Funding Request modal" %}

{: .note }
Edits made in this modal apply to the downloaded file only. They do not alter the
underlying project, application, or server records in Tidal Accelerator.

## Downloading the JSON

When you are satisfied with the data, click 'Download' to save the request as a
JSON file.

{% include image.html file="map-funding-request-5.png" alt="downloading the MAP Funding Request as JSON" %}

The downloaded file adheres to the AWS `AssessmentOutput` v2 schema and is ready
for submission to AWS (such as uploading to AWS Transform / ATX) for MAP deal
qualification.
