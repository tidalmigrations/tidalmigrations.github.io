---
title: Analyze your Source Code
keywords: source-code, assessment, cloud-readiness
last_updated: July, 2018
summary: "Use Tidal Tools source code analysis feature to measure your application code bases for cloud PaaS migration difficulty."
sidebar: tidal_toolsbar
permalink: analyze-source-code.html
folder: tidaltools
---
## Tidal Analyze Source Code

Not sure how ready you are to move to the cloud? With Tidal Migrations you have 
the option to analyze your specified source code associated with the applications.

The analysis will automatically strategize
your path to the cloud by identifying the difficulty to migrate your applications to the cloud, including the number of blocking issues identified.

## Analytics

### Blockers
Blockers slow down your Cloud Migration journey, by identifying the percentage of blockers
in your source code, you are able to instantly determine which applications should be prioritized over others from a technical difficulty perspective.

### Cloud Readiness
Clour readiness tracks each application's readiness for both now and in the future. This percentage lets
you acknowledge which applications are becoming more cloud-ready while also keeping track of those that
behave has roadblocks in your cloud journey.


With these 2 key numbers, stay alert and build the smartest roadmap to the cloud.

## Getting Started

After having [installed](tidal-tools.html#install) Tidal Tools, begin to analyze your source code and rank your applications by *Cloud Readiness*.

Prior to these steps, be sure to have [logged in](tidal-tools.html#login) to Tidal Tools.
Firstly, you will need the `application ID` and a copy of the source code checked out.

You can find the Application ID in the URL bar when looking at an application. e.g. if I’m loking at an application in Tidal Migrations, the URL will show https://demo2.tidalmg.com/#/apps/111 Here, 111 is my Application ID.

I can now analyze the source code with:

```
cd /path/to/source-code
tidal analyze --app-id 111 .
```

Try it out!

{% include image.html file="carbon_source.png" caption="Analyze your source code" %}
