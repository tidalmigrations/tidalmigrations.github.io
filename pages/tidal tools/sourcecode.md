---
title: Analyze your Source Code
keywords: source, assessment, readiness, analyze, code, application
last_updated: July, 2018
summary: "Use Tidal Tools source code analysis feature to measure your application code bases for cloud PaaS migration difficulty."
sidebar: main_sidebar
permalink: analyze-source-code.html
folder: tidaltools
---
## Tidal Analyze Source Code

Not sure how ready you are to move to the cloud? With Tidal Migrations you have
the option to analyze your specified source code associated with the applications.

The analysis will identify the difficulty to migrate your applications to the
cloud, including the number of blocking issues identified. It is able to
analyze source code written in C#, COBOL, Java, JavaScript, Kotlin, Microsoft
Transact-SQL, PHP, Python, Swift, TypeScript, VB.Net.

If you are interested in a deeper dive source code assessment, let us know at
[info@tidalmigrations.com](mailto:info@tidalmigrations.com).

## Analytics

### Roadblocks
Roadblocks slow down your cloud migration journey, by identifying the total number of roadblocks
in your source code, you are able to instantly determine which applications should be prioritized over others from a technical difficulty perspective.

### Migration Difficulty
Migration difficulty tracks each application's readiness for a Paas system in the cloud. This percentage lets
you identify which applications are easier or harder based on the implementation details and application structure.


With these 2 key numbers, stay alert and build the smartest roadmap to the cloud.

### Criteria

To determine how ready an application is for a cloud migration there are **over 190 different factors** across all the languages (C#, VB/VB.net, Java, T-SQL, Python and PHP) that are considered.
An example of some of the criteria that are considered include:
  - Using the file system
  - Using system DLLs
  - Using hardcoded IP addresses
  - Using Access Control Lists

The analysis will look at all of these factors and determine an overall migration difficulty.

Try it out!

{% include image.html file="source_code_analyze.png" caption="Analyze your source code" %}

## Getting Started

1. Before you can analyze a source code and rank your applications by *Migration Difficulty*, you must enable the Source Code Analysis feature for your account. To do so, go to your workspace Settings/Preferences (https://yourworkspace.tidalmg.com/#/admin/setting). You will find the Source Code Analysis section at the bottom of the page.

2. Now that you have activated the Source Code Analysis feature, you need to install, configure and authenticate via Tidal Tools. Make sure you follow these guides.
  - How to [install](tidal-tools.html#install) Tidal Tools.
  - Install Tidal Tools [dependencies](tidal-tools.html#dependencies).
  - Make sure you can [connect](tidal-tools.html#connecting-to-the-api) with your workspace using Tidal Tools.
  - As the last step, You should run the [tidal doctor](troubleshooting.html#tidal-doctor) command to verify that your environment has been configured properly.

3. You will need the ID of the application for which you are going to perform the source code analysis. You can find it in the URL bar when looking at an application. ex. If you are viewing an application in Tidal Migrations, the URL will show `https://demo.tidalmg.com/#/apps/111` in this case 111 is the application ID.

4. Lastly, You will need a local copy of the source code for the application.

5. Perform the Source Code Analysis. There are 2 options to do so. You can find more details in this [section](#perform-the-analysis)

That is all, You should be able to see the results in your workspace within seconds.

{% include tip.html content="Looking to try it out and don't have any code handy? You can use this sample [schoolbus application](https://github.com/tidalmigrations/schoolbus) by [cloning it from GitHub](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository)." %}





## Perform the analysis

When analyzing a source code (or multiple), You have two options. 

1. Perform the source code analysis and upload the result immediately to your workspace. This is Tidal Tools' default behaviour. To do so, all you need to do is run the following command.

    ```bash
    cd /path/to/source-code
    tidal analyze code --app-id 111
    ```

    Alternatively, you can pass the location to the source code.
    ```bash
    tidal analyze code ~/location/to-source-code/ --app-id 111
    ```

2. Perform the source code analysis and upload the results **at a later time**. The following section will explain how to run database analysis in **offline mode**

### Running offline

There are circumstances in which you need to perform a source code analysis on an environment without or with restricted internet access. In such case, You can perform the analysis, capture its results and at a later stage upload those results to your Tidal Migrations workspace.

These are the steps you need to follow in order to bypass internet access limitations:

1. On a Machine with internet access, you need to install, and configure Tidal Tools. 

2. Package Tidal Tools and its required docker container images into a tar file, This will allow you to move the archive file into your restricted environment. To do so, run the following command.

    `tidal backup`

    Once it has finished, you will find (in your current location) a tar file called `tidal-snapshot_DATE.tar`. This is the file you need to transport into your internet restricted environment.

3. On the machine that has no internet access. You will now restore Tidal Tools using the following command.

    `tidal restore tidal-snapshot_DATE.tar`

    This will load a docker image and all the existing Tidal Tools configurations from the original machine. You can now run the source code analysis without any external network connectivity.:

    `tidal analyze code [path/to-directory] --offline --output-dir [directory]`

    Note:
    -  The `--offline` flag, it will indicate to Tidal Tools that the output needs to be stored in a file instead of being uploaded.
    - The `--output-dir`, will be use to determine where the output will be located.

    After the analysis is completed, you will find a zip file called, `result-<DATE>.zip` that can then be transferred into a machine with internet connectivity.


4. Back to the machine with internet access. you can now upload your results to your workspace with this command.

    `tidal analyze code --app-id [app_id_for_your_application] --upload [file_name]`

    You should receive confirmation that the upload has been completed and can navigate to Tidal Migrations to see the results.







{% include tip.html content="Need to run code analysis on a entire set of applications all from one machine? Run [this command and easily create a directory for every application already in Tidal Migrations](https://github.com/tidalmigrations/gists/blob/master/make_source_code_dirs.sh)" %}

### Why Docker?

You need to install Docker in order to complete the source code analysis. This is because the analysis uses several system dependent software libraries so by using Docker the analysis can use those libraries without you requiring to install the correct versions and dependencies.

### What about security?

The entire analysis takes place _locally on your machine_. The **only** data that is captured and sent from the analysis are the results of the analysis and metadata. **No source code, files or the contents of any files on your machine are ever copied or sent anywhere.**
