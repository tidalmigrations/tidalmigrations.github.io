---
title: Analyze your Source Code
keywords: source, assessment, readiness, analyze, code, application
last_updated: January, 2023
summary: "Use Tidal Tools source code analysis feature to measure your application code bases for cloud PaaS migration difficulty."
sidebar: main_sidebar
permalink: analyze-source-code.html
folder: tidaltools
---

## Tidal Analyze Source Code

Not sure how ready you are to move to the cloud? With Tidal you have
the option to analyze your specified source code associated with the applications.
The analysis will identify the difficulty to migrate your applications to the
cloud.

If you are interested in a deeper dive source code assessment, let us know at
[info@tidalcloud.com](mailto:info@tidalcloud.com).

Try it out!

{% include image.html file="source_code_analyze.png" caption="Analyze your source code" %}

## Getting Started

1. Install, configure and authenticate via Tidal Tools. Make sure you follow these guides.

- How to [install](tidal-tools.html#install) Tidal Tools.
- Install Tidal Tools [dependencies](tidal-tools.html#dependencies).
- Make sure you can [connect](tidal-tools.html#connecting-to-the-api) with your workspace using Tidal Tools.
- As the last step, You should run the [tidal doctor](troubleshooting.html#tidal-doctor) command to verify that your environment has been configured properly.

2. You will need the ID of the application for which you are going to perform the source code analysis. You can find it in the URL bar when looking at an application. ex. If you are viewing an application in Tidal, the URL will show `https://[your workspace].tidal.cloud/apps/111/overview` in this case 111 is the application ID.

3. Lastly, you will need a local copy of the source code for the application.

4. Perform the Source Code Analysis. There are 2 options to do so. You can find more details in this [section](#perform-the-analysis).

That is all. You should be able to see the results in your workspace within seconds.

{% include tip.html content="Looking to try it out and don't have any code handy? You can use this sample [schoolbus application](https://github.com/tidalmigrations/schoolbus) by [cloning it from GitHub](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository)." %}

## Perform the analysis

When analyzing a source code (or multiple), you have two options.

1. Perform the source code analysis and upload the result immediately to your workspace. This is Tidal Tools' default behaviour. To do so, all you need to do is run the following command.

   ```bash
   cd /path/to/source-code
   tidal analyze code --app-id [app_id_for_your_application]
   ```

   Alternatively, you can pass the location to the source code.

   ```bash
   tidal analyze code [/path/to/source-code] --app-id [app_id_for_your_application]
   ```

2. Perform the source code analysis and upload the results **at a later time**. The following section will explain how to run database analysis in **offline mode**

### Running offline

There are circumstances in which you need to perform a source code analysis on an environment without or with restricted internet access. In such case, you can perform the analysis, capture its results and at a later stage upload those results to your Tidal workspace.

These are the steps you need to follow in order to bypass internet access limitations:

1. On a Machine with internet access, you need to install, and configure Tidal Tools.

2. Package Tidal Tools and its required docker container images into a tar file. This will allow you to move the archive file into your restricted environment. To do so, run the following command.

   `tidal backup`

   Once it has finished, you will find (in your current location) a tar file called `tidal-snapshot_DATE.tar`. This is the file you need to transport into your internet restricted environment.

3. On the machine that has no internet access, you will now restore Tidal Tools using the following command.

   `tidal restore tidal-snapshot_DATE.tar`

   This will load a docker image and all the existing Tidal Tools configurations from the original machine. 

4. You can now run the source code analysis without any external network connectivity.

   ```bash
   cd /path/to/source-code
   tidal analyze code --offline
   ```

   Alternatively, you can pass the location to the source code.

   ```bash
   tidal analyze code [/path/to/source-code] --offline
   ```

   Note:

   - The `--offline` flag indicates to Tidal Tools that the output needs to be stored in a file instead of being uploaded.

   After the analysis is completed, you will find an artifact file called `code-analysis-<DATE>-<TYPE>.json` that can then be transferred into a machine with internet connectivity.

5. Back to the machine with internet access, you can now upload your results to your workspace with this command.


   ```bash
   tidal analyze code upload [file_name] --app-id [app_id_for_your_application]`
   ```

   You should receive confirmation that the upload has been completed and can navigate to Tidal to see the results.

{% include tip.html content="Need to run code analysis on a entire set of applications all from one machine? Run [this command and easily create a directory for every application already in Tidal Accelerator](https://github.com/tidalmigrations/gists/blob/master/make_source_code_dirs.sh)" %}

### Why Docker?

You need to install Docker in order to complete the source code analysis. This is because the analysis uses several system dependent software libraries. 
By using Docker, the analysis can use those libraries without requiring you to install any other dependencies.

### What about security?

The entire analysis takes place _locally on your machine_. The **only** data that is captured and sent from the analysis are the results of the analysis and metadata. **No source code, files or the contents of any files on your machine are ever copied or sent anywhere.**
