---
title: Analyze your Source Code
keywords: source, assessment, readiness, analyze, code, application
last_updated: July, 2018
summary: "Use Tidal Tools source code analysis feature to measure your application code bases for cloud PaaS migration difficulty."
sidebar: tidal_toolsbar
permalink: analyze-source-code.html
folder: tidaltools
---
## Tidal Analyze Source Code

Not sure how ready you are to move to the cloud? With Tidal Migrations you have 
the option to analyze your specified source code associated with the applications.

The analysis will identify the difficulty to migrate your applications to the cloud, including the number of blocking issues identified.

## Analytics

### Roadblocks
Roadblocks slow down your cloud migration journey, by identifying the total number of roadblocks
in your source code, you are able to instantly determine which applications should be prioritized over others from a technical difficulty perspective.

### Migration Difficulty
Migration difficulty tracks each application's readiness for a Paas system in the cloud. This percentage lets
you identify which applications are easier or harder based on the implementation details and application structure.


With these 2 key numbers, stay alert and build the smartest roadmap to the cloud.

## Getting Started

After having [installed](tidal-tools.html#install) Tidal Tools,  analyze your source code and rank your applications by *Migration Difficulty*.

- Be sure to have [logged in](tidal-tools.html#login) to Tidal Tools.
- You will need the application ID - You can find it in the URL bar when looking at an application. ex. If you are viewing an application in Tidal Migrations, the URL will show https://demo2.tidalmg.com/#/apps/111 in this case 111 is the application ID.
- You will also need a local copy of the source code.


You are all set, you can now analyze the source code with:

```
cd /path/to/source-code
tidal analyze code --app-id 111 .
```

Once it is complete you can view your application and the newly updated data in Tidal Migrations, it can take a couple minutes for the data to be processed and uploaded.

Try it out!

{% include image.html file="carbon_source.png" caption="Analyze your source code" %}
