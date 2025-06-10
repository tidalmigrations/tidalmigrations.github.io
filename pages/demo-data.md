---
toc: false
title: Tidal Accelerator Demo Resources
layout: pages
nav_exclude: true
keywords: demo, data, resources, lab, hands-on
last_updated: June, 2025
summary: "Demo data for working with Tidal Accelerator"
permalink: demo-data.html
---

Welcome to the Tidal Accelerator hands-on lab session! This page contains all the resources you'll need to complete the lab exercises.

## Required Resources

Download the [demo-data](https://s3.ca-central-1.amazonaws.com/tidal.assets.public/demo-data/demo-data.zip) zip file and extract it to your location of choice.

The resulting directory contains the following:
1. demo-records - a directory containing three spreadsheets; servers, databases and applications for your workspace.
2. sct-results - a directory containing two AWS Schema Conversion Tool result sets.
3. nopCommerce - an open-source ASP.NET eCommerce app which we will analyze
4. machine_stats.json - a sample output of Machine Stats which we will upload to Accelerator using Tidal Tools.

{: .note }
While we include the nopCommerce codebase in the zip file, if you'd prefer, you can also clone it with git using the following command:
`git clone --branch release-4.80.6 --single-branch git@github.com:nopSolutions/nopCommerce.git`

## Optional Software

If you'd like to participate in the more advanced components of the lab, you'll need to install:

1. [Tidal Tools](https://get.tidal.sh/) - Download and install Tidal Tools. For help see our documentation [here](tidal-tools.html).
2. [Docker](https://docs.docker.com/get-docker/) - Required for running Tidal Tools' code analysis feature.

## Need Help?

If you encounter any issues downloading or using these resources, please let us know.