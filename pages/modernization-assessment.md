---
toc: false
title: Modernization Assessment
layout: pages
nav_exclude: true
keywords: demo, data, resources, lab, hands-on
last_updated: November 2026
permalink: modernization-assessment.html
---

# Introduction

The AWS Application Modernization Assessment (AMA) program provides organizations with a no-cost assessment capability for rapidly identifying suitable application candidates for the Modernization Viability Assessment (MVA) as part of the modernization pathway to AWS.

This guide will walk you through the process of conducting an AMA and show you how to download your ready-made Modernization Presentation.

## Quick start

To run an AMA, follow this sequence. Key steps are covered in more detail later in this guide.

1. Choose up to 10 applications and identify the servers and databases that support them.
2. Send the customer the discovery template spreadsheets (see [Resources](#resources)) to complete before the interview.
3. Once the customer returns the spreadsheets, import them into Tidal Accelerator ([Step 1](#step-1)).
4. Conduct, and where authorized record, an application owner interview to validate and complete the business context for each application ([Step 2](#step-2)).
5. Use Tidal Tools to run source code analysis when the code is available ([Step 3](#step-3)).
6. Create a project and assign the in-scope applications to it ([Step 5](#step-5)).
7. Set each application's transition type and estimated migration cost, then generate insights and review them critically ([Step 7](#step-7)).
8. Download and review the presentation ([Step 8](#step-8)).

## Resources

Use the discovery templates to collect initial information about the applications from your customer before the interview. Download the [modernization-assessment-templates](https://s3.ca-central-1.amazonaws.com/tidal.assets.public/demo-data/modernization-assessment-templates.zip) zip file and extract it to your location of choice.

After extracting the templates, you will find three spreadsheets:
1. Server Discovery.xlsx
2. Database Discovery.xlsx
3. Application Discovery.xlsx

These spreadsheets each include an example row, and each header has a note which will help you understand what is required for that datapoint. For a handy reference for the fields in each of these discovery spreadsheets, see [Discovery fields](#discovery-fields).

If you would like to see a completed assessment first, see [Practice with a completed assessment](#practice).

## Software

Tidal software for your toolkit to support your Modernization Assessment:

1. [Tidal Tools](https://get.tidal.sh/) - Download and install Tidal Tools. For help, see our documentation [here](tidal-tools.html).
  - Note that Tidal Tools requires [Docker](https://docs.docker.com/get-docker/) to be installed on your machine.
3. Machine Stats - (Optional) Scan your servers and output a result which can be uploaded to Accelerator.
  - [Machine Stats for Unix-like Systems](https://pypi.org/project/machine-stats/) Detailed guides [here](https://guides.tidal.cloud/machine_stats.html#unix-like-systems).
  - [Machine Stats for Windows](https://github.com/tidalmigrations/machine_stats/tree/master/windows) Detailed guides [here](https://guides.tidal.cloud/machine_stats.html#windows).

# Modernization Assessment

## Step 1: Import Data from Spreadsheets {#step-1}

First, we will import your servers, database instances and applications from spreadsheets into Tidal Accelerator.

To get started, navigate to the 'Import Spreadsheets' page, which you can find in the navigation sidebar under 'Discovery Tools'.

{% include image.html file="ama1.PNG" %}
<br>

Here you will find a dropzone to import your server records. Tidal Accelerator supports three primary record types: servers, database instances, and applications. You must import these record types separately; for example, you will have one spreadsheet for your servers, one for your database instances, and one for your applications.

Note that the tabs at the top of the page correspond to a record type. You must ensure you are on the correct tab for the record type you are uploading.

By importing these records in the correct order (servers, database instances, applications) and by setting the association fields correctly, Tidal Accelerator will automatically build relationships between these records. You can find more details on the association fields for each record type [here](https://guides.tidal.cloud/import-from-excel.html#importing-servers).

On the servers tab, upload your spreadsheet of server records. Follow the steps of the wizard to preview and complete your upload. You can then navigate to the 'Databases' tab and perform the process again for your database spreadsheet, and after that, you can do the same for your application spreadsheet.

For more details on uploading spreadsheets to Tidal Accelerator, including how to create custom data fields in Accelerator, see our documentation [here](https://guides.tidal.cloud/import-from-excel.html).

{: .note }
The file type of spreadsheets that you upload to Accelerator must be .xlsx

## Step 2: Conduct Application Owner Interviews {#step-2}

Application owner interviews enable you to obtain the most up-to-date information on your applications, directly from the source—the application owner. This is critical to ensuring you have the best possible data and allows you to fill in gaps that might be present in the data imported from spreadsheets.

We've put together a brief guide on goals and best practices of application owner interviews, which you can find [here](https://guides.tidal.cloud/interviews.html).

To conduct an interview, first navigate to your application record by selecting 'Application' from the navigation sidebar, under 'Inventory'. Here you will see a list of your applications, and you can select the application for which you'd like to conduct the interview.

On the application record, navigate to the 'Interview' tab.

{% include image.html file="ama2.PNG" %}
<br>

Here you will see a preview of the interview you're about to conduct. Accelerator includes a series of default questions based on our experience conducting application owner interviews. You can customize these questions by navigating to 'Interview Questions,' which is located under 'Settings' in the navigation sidebar.

In the preview, you will also see the default answers to these questions. Each question corresponds to a field on the application record, and if data is already present for that field, it will appear as the default answer. This is to avoid you needing to enter data for questions to which you already know the answer.

You can also copy completed interviews from other applications. This is useful when conducting interviews for applications which are very similar. This will override the default answers with those of the interview that you're copying in.

When you have the application owner present and you're ready to conduct the interview, click 'Start Interview' to get going.

You will be shown a wizard which walks you through the questions in sequence. For each question, you can accept the default answer or enter new data based on the answer you get from the application owner. If there is additional context you'd like to capture, you can include this in the 'Notes' section of each question.

On the final question, you will be prompted to 'Save and Complete' the interview. Click this, and you will be shown a confirmation modal that displays the current value of each application field and the new value based on the answer provided during the interview. If you are satisfied, click 'Confirm' and this data will be saved to the application record.

{% include image.html file="ama3.PNG" %}
<br>

While this data has been saved to the relevant fields of the application, this can be overwritten by edits to the application itself. You can review the answers to the interview at any time, and you can delete the interview if you'd like to conduct a new one.

If you have recorded a video of the interview via screen capture, you can upload the recording to the drop zone on the completed interview page. Note that deleting the interview will also delete this recording.

{: .note }
Notes that you capture during the interview can be accessed by clicking the 'Notes' button in the toolbar at the top of the application page.

## Step 3: Perform Source Code Analysis {#step-3}

You can learn more about the modernization potential of your applications by analyzing their source code. Tidal Code Analysis provides insight into application language composition, as well as the application's currency, via dependency analysis. This data is also surfaced as visuals on the Portfolio Insights and Project Insights pages.

Tidal Code Analysis is performed using our command-line software utility Tidal Tools. The software is available to download [here](https://get.tidal.sh/), and you can learn more about getting started with the tool in our guide [here](https://guides.tidal.cloud/tidal-tools.html).

For demo purposes, we have included the `nop-commerce` project in the [demo data download](#practice). You can analyze this to get familiar with the process, if you don't have another codebase handy.

{: .note }
Tidal Source Code Analysis uses Docker under the hood. There is a [known issue](/troubleshooting.html#windows-source-code-analysis) with Docker where scanning a large codebase hosted on a Windows file system will be very time consuming. If you are on Windows, we recommend hosting the source code which you will analyze on [WSL](https://learn.microsoft.com/en-us/windows/wsl/about). For demo purposes, we have also included the equinox-project codebase in the demo data download, which can be analyzed on Windows systems in a timely fashion.

Once you have Tidal Tools installed, run the following command and follow the prompts to authenticate with Accelerator.

`tidal login`

Once you are authenticated, run the following command from the root directory of the application's source code.

`tidal analyze code --app-id <id>`

Where `<id>` is the application's ID, found in the URL bar on the application page. You can find this command pre-generated for you on the application page in the 'Source Code Readiness' section.

{% include image.html file="ama4.PNG" %}
<br>

After running the command, the results will be displayed in the 'Source Code Readiness' section. You will see a breakdown of the application's languages by line count, along with a currency score.

{: .note }
The currency score will initially show '0', as we are calculating currency for you behind the scenes. This will be updated once the calculation is completed, typically within 10 minutes.

{% include image.html file="ama5.PNG" %}
<br>

The application currency is calculated by examining each of the application's dependencies and determining the difference between the version of the dependency being used and the most recent version of that dependency. For example, if an application has a single dependency, and is using version 2.0. At the same time, the most recent version of that dependency is version 4.0, then the application will have a currency score of 2.

The higher the currency score, the more outdated the dependencies of the application are. A high currency score indicates that the app has many outdated dependencies, and may therefore be more difficult to refactor and modernize, as you will need to put more effort into upgrading severely outdated dependencies.

### Portfolio Insights

You can visualize source code analysis results for all applications in the workspace by navigating to 'Insights' in the navigation sidebar, under 'Portfolio'. This displays multiple visuals that aggregate various data points from your portfolio, including a dedicated section for source code analysis. Here you can see the top 5 languages used across your portfolio, as well as a breakdown of applications by language composition.

{% include image.html file="ama6.PNG" %}
<br>

{: .note }
Portfolio Insights data is refreshed every 12 hours and may be outdated. To update the data immediately, navigate to the 'Preferences' page under 'Settings' in the navigation sidebar. Navigate to the section titled 'Sync Business Analytics' and click 'Trigger sync'.


## Step 4: Upload AWS Schema Conversion Tool Results

Running AWS Schema Conversion Tool (SCT) on your database instances can help you uncover valuable insights into the best modernization path for your databases. Accelerator facilitates this by helping you configure SCT and hosting the analysis results directly alongside your database records. You can visualize the results of the analyses and decide which database technology is the best fit when migrating your database to the cloud.

To scan your database using SCT, you must provide the appropriate database driver (JDBC) for your target database instance. Accelerator helps simplify this process by generating a cURL command to download the appropriate JDBC driver for your database.

You can find this in the 'Transition Planning' section of your database instance overview.

{% include image.html file="ama7.PNG" %}
<br>

Once you have configured SCT, you can use it to generate [assessment reports](https://docs.aws.amazon.com/SchemaConversionTool/latest/userguide/CHAP_AssessmentReport.html) on target cloud database technologies. SCT allows you to export this as a folder containing three `.csv` files.

You can upload these reports directly to your database instance in Accelerator by navigating to the 'Schema Analysis' tab of your database record.

{: .note }
You need to generate different reports for different target database technologies.

{% include image.html file="ama8.PNG" %}
<br>

For each report you wish to upload, you must upload all three result `.csv` files at once, as Accelerator needs all three files to generate your visuals. Drag and drop these three files into the dropzone, or use the file explorer to upload them. Follow the steps of the import wizard to preview and upload your report.

For each report you upload, we infer the name of the source database schema and then aggregate and visualize the results.

{% include image.html file="ama9.PNG" %}
<br>

To upload additional reports, click the 'Upload SCT Analysis' button in the top toolbar of the database record.

You can compare results and make a decision on which database technology to target by selecting the target database technology for the schema.


## Step 5: Organize your resources into a Project {#step-5}

When managing numerous applications during cloud migration, organizing them into project groups streamlines progress tracking, aligns assessment goals, and enables parallel execution across teams. Assigning your applications to a project also unlocks advanced features in Accelerator, such as financial impact, cloud instance target recommendations, and the Modernization Presentation.

First, navigate to 'Projects' in the navigation sidebar, then click 'Add Project'.

{% include image.html file="ama10.PNG" %}
<br>

For a Modernization Assessment, the minimum amount of data that we need to enter when creating a project is the name and the target cloud provider. Set these and click 'Save'.

Next, we will assign applications to the project. You'll want to assign all applications which are in scope for the Modernization Assessment. You can do this by navigating to the 'Applications' page under 'Inventory' in the navigation sidebar, checking the box of all applications you'd like to assign, then selecting 'Assign to Project' from the bulk actions dropdown menu.

{% include image.html file="ama11.PNG" %}
<br>

You can now navigate back to the project, and you should see the applications listed in the 'Apps' tab. You will also see any servers which were associated with the applications listed in the 'Servers' tab.

For more details about creating and working with projects, see our documentation [here](https://guides.tidal.cloud/assessment-projects.html#assessment-projects).


## Step 6: Generate Cloud Instance Targets (Optional) {#step-6}

{: .note }
Cloud instance targets suit applications you plan to rehost. Not every migration maps to cloud instances, and generating them requires server sizing data. If you don't plan to rehost an application, or you choose not to collect sizing data for its servers, you can skip this step and enter a Forecasted Cost for the application in [Step 7](#step-7) instead.

Once we have enough data about your servers in Tidal Accelerator, we automatically generate cloud instance target recommendations. These recommendations are based on the resources allocated to your servers, such as RAM, storage and CPU. For more details on how we generate cloud instance targets, please refer to [this guide](https://guides.tidal.cloud/instance-recommendation.html#how-does-it-work).

If you are unsure about why a specific server does not have a cloud instance target, you can check the assessment progress widget on the server page. Navigate to the server in question, and you will find this in the 'Assessment Progress' section of the server overview.

{% include image.html file="ama12.PNG" %}
<br>

You can check progress for all servers in the workspace by navigating to 'Assessment Progress' under the 'Inventory' section of the navigation sidebar. Here you will find application assessment progress and server assessment progress in separate tabs.

{% include image.html file="ama13.PNG" %}
<br>

Details about all cloud instance targets for servers in your project are aggregated on the 'Instance Targets' tab of the project page. Here, you can find details such as the instance name, cloud region, and which CPU is being used by the cloud instance.

{% include image.html file="ama14.PNG" %}
<br>

You can set a cloud region for the entire project, and override this for specific servers. Whenever relevant details about your servers change (for example, the amount of RAM allocated is updated), we automatically regenerate a cloud instance target for that server. This way, as you discover more data about your servers, the cloud instance target recommendations become more and more accurate over time.

## Step 7: Set Transition Type, Migration Costs and Insights {#step-7}

With your inventory in place, you can now set the fields that you provide as part of the assessment. These include your chosen transition type and cost estimates, some of which Tidal Accelerator needs to score each application in the Modernization Presentation.

### Transition Type (Required)

The transition type is the strategy you have chosen for the application, such as rehost, replatform or refactor. It is one of the criteria for the [MVA recommendation](#mva-recommendation).

Navigate to the 'Migration Plan' tab of the application record. You will find the fields 'Transition Type' and 'Recommended Steps' in the 'Transition Planning' section.

{% include image.html file="ama16.PNG" %}
<br>

When you set a transition type of 'refactor', 'rehost', or 'replatform', we will automatically generate a series of recommended next steps for your application migration. These appear in the Modernization Presentation.

{: .note }
'Recommended Steps' are not the same as 'Recommended Transition Type'. The 6R recommendation engine suggests a transition type first in the 'Recommended Transition Type' field, which you can use to inform your decision on what the Transition Type of the application should be. See [Transition Type Recommendations (6R)](transition-type-recommendations.html).

### Estimated Migration Cost (Required)

The estimated one-time cost of migrating the application. Without it, Tidal Accelerator cannot calculate an [ROI](#roi-potential) for the application.

You will find this field in the 'Cloud Financial Estimates' section of the 'Migration Plan' tab.

### Forecasted Cost (Annually) (Required without cloud instance targets)

The forecasted annual cost of running the application in the cloud. To calculate ROI, the application needs an estimated cloud cost from either this field or the cloud instance targets of its servers.

- If the application's servers have cloud instance targets ([Step 6](#step-6)), leave this field blank.
- If they don't, for example because you plan to refactor the application rather than rehost it, enter a forecasted cost.

You will find this field in the 'Cloud Financial Estimates' section of the 'Migration Plan' tab.

{: .warning }
If you enter a Forecasted Cost for an application whose servers also have cloud instance targets, both are added together and the application's cloud cost is counted twice.

### Application Insights (Recommended)

Insights appear in the Modernization Presentation, so it is recommended that you set them.

Tidal Accelerator provides a seamless, AI-driven approach to generating application insights. Navigate to the application page, and you will find the field 'Insights' in the 'General Information' section. Edit this section, and you will be shown a button labelled 'Generate Insights'. Click this to automatically populate insights for this application based on the data that you've provided so far.

These insights are generated using a large language model; therefore, please review them carefully before saving. You can alter the insights, remove them or add new ones before saving them to the application.

{% include image.html file="ama15.PNG" %}
<br>

## Step 8: Download the Modernization Presentation {#step-8}

Tidal Accelerator can create a comprehensive PowerPoint Modernization Presentation using the data you have provided. This slide deck comes equipped with speaker notes to help guide your presentation.

To download your presentation, navigate to the project and click 'Modernization Presentation'.

{% include image.html file="ama17.PNG" %}
<br>

Tidal Accelerator takes all the information provided so far and scores applications in the project based on three key factors: ease of modernization, business criticality, and ROI potential.

{% include image.html file="ama18.PNG" %}
<br>

We use the [weighted sum model](https://en.wikipedia.org/wiki/Weighted_sum_model) to calculate the following values, as part of a proprietary algorithm developed over time with our experience of performing cloud modernization and migration. For more details about the specific data considered in this calculation, please refer to the information below.

### Ease of Modernization

Ease of modernization is determined using the data obtained from performing source code analysis, as well as data on the application's dependent servers and database instances.

### Business Criticality

Business criticality is determined by data on the application record itself, such as 'Person Hours Saved' and 'Revenue', which can be found in the 'Financial' section of the application overview. These are included as default interview questions to ensure that this data is filled out. Note that if you set the 'Regulated Requirements' field to 'Yes', indicating that this application is required for the business by government regulation, the business criticality of this application will be set to the highest value (5).

### ROI Potential

ROI potential is calculated by looking at the application's current cost, based on 'Annual Hosting Costs' and 'Annual Staff Costs' in the 'Financial' section of the application overview. We then look at the application's cloud cost, based on 'Forecasted Cost (Annually)' or the cloud instance targets of its servers, and 'Estimated Migration Cost', found in the 'Cloud Financial Estimates' section of the application migration plan page.

Incidentally, this same data is used to generate many of the visuals found on the [Financial Impact](https://guides.tidal.cloud/financial-impact.html) page, which can be viewed at both the application and project level.

### Weighted Score

The weighted score is an average of the above three values.

### MVA Recommendation

Applications with a weighted score greater than three, that have a transition type of 'refactor' or 'replatform', and involve an element of Microsoft licensing are recommended for the MVA stage.

Whether an application has an element of Microsoft licensing is determined by examining the operating system of the application's servers, the database engine of its database instances, and whether the application includes any Microsoft licensing cost data.

The Scope Refinement Summary slide in the presentation illustrates the process of narrowing down applications in scope, with the final number indicating the number of applications recommended for the MVA stage.

{% include image.html file="ama19.PNG" %}
<br>

## Discovery fields {#discovery-fields}

The tables below describe the fields in each discovery template. Each record's identifier ('name', or 'host name' for servers) is the only field the import requires.

Relationship fields, such as 'server host names', are only required if the relationship exists, for example if the application runs on servers that are in the Server Discovery spreadsheet. Where a record can link to several others, separate the names with commas. Each name must exactly match the identifier of the related record.

Optional fields improve the results of the assessment, but you can fill them in later, either from the application owner interview or from tools such as [Machine Stats](machine_stats.html). The more of these the customer is able to provide at this point, the better, but their absence should not block a prospecting motion.

If you don't know the value of a field, leave it blank rather than entering `0`.

### Servers

| Template Column          | Field Label              | Notes                                                                                                                                                                                                                                                                                              | AMA role                                                                                                                                                                                                                              |
| ------------------------ | ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| host name                | Host Name                | The name that identifies the server in Tidal Accelerator. Applications and databases are linked to servers by this name, so use the same value in the 'server host name' column of the Database Discovery spreadsheet and the 'server host names' column of the Application Discovery spreadsheet. | Links the server to its applications and databases, so that it counts as one of their dependent servers.                                                                                                                              |
| description              | Description              | A short description of the server and its role.                                                                                                                                                                                                                                                    | None.                                                                                                                                                                                                                                 |
| fqdn                     | FQDN                     | The fully qualified domain name of the server.                                                                                                                                                                                                                                                     | None.                                                                                                                                                                                                                                 |
| environment name         | Environment              | The environment the server runs in, such as Production or Development.                                                                                                                                                                                                                             | Used to generate a cloud instance target.                                                                                                                                                                                             |
| assigned id              | Assigned ID              | An identifier the customer already uses for the server, such as an asset or CMDB ID.                                                                                                                                                                                                               | None.                                                                                                                                                                                                                                 |
| ram allocated (gb)       | RAM Allocated (GB)       | The memory allocated to the server. Can be collected with Machine Stats.                                                                                                                                                                                                                           | Used to generate a cloud instance target, which is one option for determining the forecasted cloud cost used in [ROI potential](#roi-potential).                                                                                      |
| storage allocated (gb)   | Storage Allocated (GB)   | The disk space allocated to the server. Can be collected with Machine Stats.                                                                                                                                                                                                                       | Used to generate a cloud instance target.                                                                                                                                                                                             |
| logical cpu count        | Logical CPU Count        | The number of logical CPU cores. Can be collected with Machine Stats.                                                                                                                                                                                                                              | Used to generate a cloud instance target.                                                                                                                                                                                             |
| cpu name                 | CPU Name                 | The CPU model. Can be collected with Machine Stats.                                                                                                                                                                                                                                                | Used to generate a cloud instance target.                                                                                                                                                                                             |
| operating system         | Operating System         | The operating system running on the server. Can be collected with Machine Stats.                                                                                                                                                                                                                   | Identifies Windows servers, which count towards the Microsoft licensing check in the [MVA recommendation](#mva-recommendation). Also used in [ease of modernization](#ease-of-modernization) and to generate a cloud instance target. |
| operating system version | Operating System Version | The version of the operating system. Can be collected with Machine Stats.                                                                                                                                                                                                                          | Helps Tidal Accelerator match the server to a known operating system.                                                                                                                                                                 |

### Database Instances

| Template Column      | Field Label        | Notes                                                                                                                                                                                                                           | AMA role                                                                                                                                                                   |
| -------------------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| name                 | Name               | The name that identifies the database instance in Tidal Accelerator. Applications are linked to databases by this name, so use the same value in the 'database instance names' column of the Application Discovery spreadsheet. | Links the database to the applications that use it.                                                                                                                        |
| server host name     | Server             | The host name of the server that hosts the database. Use the same value as the 'host name' column in the Server Discovery spreadsheet.                                                                                          | Adds the server to the dependent servers of each application that uses the database, so its operating system counts towards the [MVA recommendation](#mva-recommendation). |
| description          | Description        | A short description of the database and its purpose.                                                                                                                                                                            | None.                                                                                                                                                                      |
| environment name     | Environment        | The environment the database runs in, such as Production or Development.                                                                                                                                                        | None.                                                                                                                                                                      |
| database path        | Database Path      | The file system path where the database files are located.                                                                                                                                                                      | None.                                                                                                                                                                      |
| database size (mb)   | Database Size (MB) | The total size of the database, in megabytes.                                                                                                                                                                                   | None.                                                                                                                                                                      |
| database engine name | Database Engine    | The database management system, such as Oracle or SQL Server.                                                                                                                                                                   | Identifies SQL Server databases, which count towards the Microsoft licensing check in the [MVA recommendation](#mva-recommendation).                                       |
| database version     | Database Version   | The version of the database engine.                                                                                                                                                                                             | None.                                                                                                                                                                      |

### Applications

| Template Column          | Field Label              | Notes                                                                                                                                                                                | AMA role                                                                                                                                                                                                                                                                                                            |
| ------------------------ | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| name                     | Name                     | The name that identifies the application in Tidal Accelerator.                                                                                                                       | Shown as the title of the application in the Modernization Presentation.                                                                                                                                                                                                                                            |
| server host names        | Servers                  | The host names of the servers that host the application, separated by commas. Use the same values as the 'host name' column in the Server Discovery spreadsheet.                     | Links the application to its servers. Their number and operating systems are used in [ease of modernization](#ease-of-modernization), Windows servers count towards the [MVA recommendation](#mva-recommendation), and their cloud instance targets provide the cloud cost used in [ROI potential](#roi-potential). |
| database instance names  | Database Instances       | If the application uses databases, the names of the database instances it uses, separated by commas. Use the same values as the 'name' column in the Database Discovery spreadsheet. | Links the application to its databases. SQL Server databases count towards the [MVA recommendation](#mva-recommendation), and the servers that host them are added to the application's dependent servers.                                                                                                          |
| description              | Description              | A short summary of the application and its purpose.                                                                                                                                  | Used when generating [insights](#step-7).                                                                                                                                                                                                                                                                           |
| urls                     | URLs                     | The web addresses used to access the application.                                                                                                                                    | None.                                                                                                                                                                                                                                                                                                               |
| business owner name      | Business Owner           | The name of the business stakeholder responsible for the application.                                                                                                                | Shown on the application's slide in the Modernization Presentation.                                                                                                                                                                                                                                                 |
| regulated requirements   | Regulated Requirements   | Whether the application is subject to regulatory compliance requirements.                                                                                                            | If set, the application's [business criticality](#business-criticality) is set to the highest value (5).                                                                                                                                                                                                            |
| person hours saved       | Person Hours Saved       | The estimated number of person-hours the application saves each year.                                                                                                                | Used to calculate [business criticality](#business-criticality).                                                                                                                                                                                                                                                    |
| technical lead name      | Technical Lead           | The name of the technical contact responsible for the application.                                                                                                                   | None.                                                                                                                                                                                                                                                                                                               |
| annual hosting costs     | Annual Hosting Costs     | The current yearly cost of hosting the application.                                                                                                                                  | Part of the application's current cost, used to calculate [ROI potential](#roi-potential).                                                                                                                                                                                                                          |
| total users              | Total Users              | The number of people who use the application.                                                                                                                                        | Used when generating [insights](#step-7).                                                                                                                                                                                                                                                                           |
| annual staff costs       | Annual Staff Costs       | An estimate of the annual spend on person-hours to maintain and support the application.                                                                                             | Part of the application's current cost, used to calculate [ROI potential](#roi-potential).                                                                                                                                                                                                                          |
| revenue                  | Revenue                  | The revenue generated by or attributed to the application.                                                                                                                           | Used to calculate [business criticality](#business-criticality).                                                                                                                                                                                                                                                    |
| environment name         | Environment              | The environment the application runs in, such as Production or Development.                                                                                                          | Used when generating [insights](#step-7).                                                                                                                                                                                                                                                                           |
| frequency of deployments | Frequency Of Deployments | How often new versions of the application are deployed.                                                                                                                              | Used when generating [insights](#step-7).                                                                                                                                                                                                                                                                           |
| uptime requirements      | Uptime Requirements      | The level of availability the application requires.                                                                                                                                  | Used when generating [insights](#step-7).                                                                                                                                                                                                                                                                           |
| data sensitivity         | Data Sensitivity         | The sensitivity of the data the application handles.                                                                                                                                 | Used when generating [insights](#step-7).                                                                                                                                                                                                                                                                           |
| source code controlled   | Source Code Controlled   | Whether the application's source code is in version control.                                                                                                                         | Shown on the application's slide in the Modernization Presentation.                                                                                                                                                                                                                                                 |
| source code location     | Source Code Location     | The repository or path where the application's source code is stored.                                                                                                                | Tells you where to run source code analysis ([Step 3](#step-3)), which is used in [ease of modernization](#ease-of-modernization).                                                                                                                                                                                  |
| continuous delivery      | Continuous Delivery      | Whether the application is deployed through a continuous delivery pipeline.                                                                                                          | Used when generating [insights](#step-7).                                                                                                                                                                                                                                                                           |
| can run on linux         | Can Run On Linux         | Whether the application can run on Linux.                                                                                                                                            | Used when generating [insights](#step-7).                                                                                                                                                                                                                                                                           |
| PII                      | PII                      | Whether the application handles personally identifiable information.                                                                                                                 | Used when generating [insights](#step-7).                                                                                                                                                                                                                                                                           |
| legal holds              | Legal Holds              | Whether the application's data is subject to legal holds.                                                                                                                            | Used when generating [insights](#step-7).                                                                                                                                                                                                                                                                           |
| COTS                     | COTS                     | Whether the application is a commercial off-the-shelf product.                                                                                                                       | Used when generating [insights](#step-7).                                                                                                                                                                                                                                                                           |
| business continuity plan | Business Continuity Plan | Whether the application has a formal business continuity plan.                                                                                                                       | Used when generating [insights](#step-7).                                                                                                                                                                                                                                                                           |
| end of support date      | End Of Support Date      | The date the application or its underlying technology stops being supported.                                                                                                         | Used when generating [insights](#step-7).                                                                                                                                                                                                                                                                           |

## Practice with a completed assessment {#practice}

This section is optional. The demo data is a sample completed assessment that you can use to explore the features in this guide.

Download the [demo-data](https://s3.ca-central-1.amazonaws.com/tidal.assets.public/demo-data/demo-data.zip) zip file and extract it to your location of choice.

{: .note }
If you have a fresh workspace, you can use this demo data to try out the Modernization Assessment features. Then, you can clear all the data from the workspace to create a blank slate for your actual assessment. Note that performing this action will clear all data in the workspace and cannot be undone. Navigate to `<your-workspace>.tidal.cloud/preferences` and select 'Remove all data'.

After extracting the demo data, you will find the following contents:
1. demo-records - a directory containing three spreadsheets: servers, database instances and applications for your workspace.
2. sct-results - a directory containing two AWS Schema Conversion Tool result sets.
3. nop-commerce - a sample codebase for you to analyze with Tidal Code Analysis.
4. equinox-project - a sample codebase suitable for analysis on Windows systems.

If you'd like to see a quick example of a completed assessment, you can download this [example Modernization Presentation](https://s3.ca-central-1.amazonaws.com/tidal.assets.public/demo-data/example-modernization-presentation.pptx).
