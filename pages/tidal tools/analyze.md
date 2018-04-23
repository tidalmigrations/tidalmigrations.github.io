---
title: Tidal Analyze
keywords: install, login
last_updated: Feb 13, 2018
summary: "Analyze Tidal Tools"
sidebar: tidal_toolsbar
permalink: analyze.html
folder: tidaltools
---

## Analyze Applications
Rapidly capture what technologies are in use, on which networks and with what DNS configuration.

Tidal analyze will fingerprint the technology on both your internet sites and intranet applications behind your firewall in seconds, without needing to install agents. Whether you have 1 or 1 million end points, tidal-tools will centralize the data gathered in our platform for you to analyze.

Simplify your application centric discovery.

## Basic Usage

The command we're going to focus on here is `tidal analyze`.  This command can be run against one web application, a list of URLs, or an IP subnet in CIDR notation like 10.0.0.0/24.

The simplest way to use tidal analyze is against one application:

`` tidal analyze http://www.mississauga.ca/portal/home ``

Running against the City of Mississauga's home page should just take a second or two, and present results like:


{% include image.html file="tidal_analyze.png" alt="results" %}
<br>
If you want to import this application to your Tidal Migrations instance, just add `--upload`.

`` tidal analyze http://www.mississauga.ca/portal/home --upload ``
 
You will see the same results, followed by the happy word "Complete!".



## Analyzing more than one URL

As it happens, most folks have multiple applications in their environment that they would like to assess and migrate to the cloud. There are a couple of ways to assess multiple applications, depending on what data you have, you might try these options:

 

- Simply save a list of URLs in a text file and use that as input.

    `` tidal analyze my_urls.txt --upload ``

- You can also utlise [(link to tidal discover - which will output the urls )] as input.

    `` tidal discover [urls output] | tidal analyze ``


## Importing to Tidal Migrations

After recieving the results, you can import it to the Tidal Migrations isntance with the following flag:

`--upload `

You also have the option to save the results in a JSON file to import at a later time. This can be done with the flag:

`--upload-file string`

