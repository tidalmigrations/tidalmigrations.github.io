---
title: Performing Source Code Analysis
keywords: source, assessment, readiness, analyze, code, application
last_updated: January, 2023
summary: "Use Tidal Tools to analyze your application source code for cloud migration and modernization opportunities."
sidebar: main_sidebar
permalink: analyze-source-code.html
folder: tidaltools
---

## Tidal Source Code Analysis

Not sure how ready you are to move to the cloud? With Tidal you can analyze your
application's source code to identify difficulties and opportunities in migrating and modernizing.
It is compatible with most of the current and legacy languages and detects a wide array of factors. See [the overview
for more information on its capabilities](/code-analysis-overview.html).

{% include image.html file="source_code_analyze.png" caption="Analyze your source code" %}

## What You Need to Get Started

1. [Install](tidal-tools.html#install), and [authenticate](tidal-tools.html#connecting-to-the-api) Tidal Tools with your [Tidal Accelerator](tidalcloud.com/accelerator) Workspace.

2. You will need the ID of the application you are going to perform the source code analysis on. You can find it in the URL bar when looking at an application in Accelerator. ex. If you are viewing an application in Tidal, the URL will show `https://[your workspace].tidal.cloud/apps/111/overview` in this case 111 is the application ID.

3. You will need a copy of the source code files for the application locally on your device.

With that, you can perform the code analysis in a matter of seconds.

{% include tip.html content="Looking to try it out and don't have any code handy? You can use this sample ['schoolbus' application](https://github.com/tidalmigrations/schoolbus) by [cloning it from GitHub](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository)." %}

## Performing the Code Analysis

When analyzing an application there are two workflows available. Deciding which option to use depends if the code you are analyzing is located on a machine that has access to the internet or not, specifically https://tidal.cloud. If you do have the code on a machine with this access you can use the standard mode. If the code is located on a device that can not access the Accelerator platform, then you can use the Offline mode.

### Standard mode

1. Perform the source code analysis and upload the result immediately to your workspace:

   ```bash
   cd /path/to/source-code
   tidal analyze code --app-id [app_id_for_your_application]
   ```

   Alternatively, you can pass multiple locations or even wildcard paths, or filenames for analysis. This will result in all the provided and matching file paths to be considered source code for the one application you are analyzing.

   ```bash
   tidal analyze code [/path/to/source-code-A] [/path/to/source-code-B] --app-id [app_id_for_your_application]
   ```

### Offline mode

If the machine running code analysis can not access the internet; you can perform the analysis and store the results locally and upload those results to your workspace from a different machine. This process will involve two machines, one that has internet access and one that has no internet access, and a copy of the application's source code.

1. On a machine with internet access, [install, and configure Tidal Tools](#what-you-need-to-get-started).

2. Backup Tidal Tools required dependencies into a backup file.

   `tidal backup`

   When finished in the current working directory there will be a file called `tidal-snapshot_DATE.tar`. Move this file, in any reasonable way you can, to the machine with the code on it to be analyzed

3. On the machine that has no internet access, you will now restore the backup:

   `tidal restore tidal-snapshot_DATE.tar`

   This will load the needed dependencies and Tidal Tools configuration needed to run the analysis.

4. Now run the source code analysis on the current directory:

   ```bash
   cd /path/to/source-code
   tidal analyze code --offline
	   ```

   Alternatively, you can pass multiple locations or even wildcard paths, or filenames for analysis. This will result in all the provided and matching file paths to be considered source code for the one application you are analyzing.

   ```bash
   tidal analyze code [/path/to/source-code-A] [/path/to/source-code-B] --offline
   ```

   The `--offline` flag indicates that the results are outputted to a local file, instead of being uploaded.

   After the analysis is completed, you will find the results in a file called `code-analysis-<DATE>-<TYPE>.json`.


5. Transfer the results file from the analysis to the machine with internet access.

5. On the machine with internet access, upload the results to your workspace:


   ```bash
   tidal analyze code upload [file_name] --app-id [app_id_for_your_application]`
   ```

   You should receive confirmation that the upload has been completed and can navigate to Tidal Accelerator to see the results.

{% include tip.html content="Need to run code analysis on an entire set of applications all from one machine? Run [this command and easily create a directory for every application already in your Tidal Accelerator workspace](https://github.com/tidalmigrations/gists/blob/master/make_source_code_dirs.sh)." %}

### Why Docker?

You need to install Docker to complete the source code analysis. This is because the analysis uses several system-dependent software libraries. 
By using Docker, the analysis can use those libraries without requiring you to install any other dependencies.

### What about security?

**The entire code analysis process takes place locally on your machine.** It will scan your files locally looking for common patterns and information when modernizing. The only data that is captured and sent from the analysis are the results of the analysis and the associated metadata. You can view all of the raw analysis results that are sent to Tidal Accelerator before they are sent, by viewing the contents of the results file locally.
