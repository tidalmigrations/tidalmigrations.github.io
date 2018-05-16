---
title: Tidal Analyze
keywords: analyze, applications
last_updated: April 24, 2018
summary: "Analyze your applications and determine their technologies and network data."
sidebar: tidal_toolsbar
permalink: analyze.html
folder: tidaltools
---


## Tidal Analyze
Now that you have [discovered](discover.html) your FQDNs for your specified Discovery Plan, the next step is to rapidly capture what technologies are in use, on which networks and with what DNS configuration.

Tidal Analyze will fingerprint the technology on both your internet sites and intranet applications behind your firewall in seconds, without needing to install agents. Whether you have 1 or 1 million end points, Tidal Tools will centralize the data gathered in our platform for you to analyze.

Simplify your application centric discovery with Tidal Analyze.

## Gathering your domains and URLs

Simply save a list of URLs or FQDNs in a text file and use that as input.

Or use the [discovery command](discover.html) to scan your network and DNS to gather a list of relevant domains.


## Analyzing FQDNs and URLs
Now that we have our relevant domains and URLs in *my_urls.txt*, we can analyze them with:

    `` tidal analyze my_urls.txt --upload `

{% include tip.html content="You can also utilize the standard output of URLs and FQDNs from [Tidal Discover](discover.html) as input.<br/><br/> `` tidal discover --plan my_plan.yml  | tidal analyze --upload``"  %}

{% include callout.html content="Are you running this behind a firewall or in a private network? No problem, drop the `--upload` flag, continue on and then checkout the Uploading to your account section below. " type="primary" %}

## Uploading to Tidal Migrations API

After recieving the results of Tidal Analyze, you may or may not be connected to the internet.

If you are so, you can import it to your Tidal Migrations account with the following flag:

`tidal analyze my_urls.txt --upload `

If you aren't connected to the internet, you also have the option to save the results in a JSON file to import at a later time. This can be done with the following steps:

1. Run this command to run the analysis and save the results to the file *analyze_output.json*: 
    

    ``tidal analyze my_urls.txt --type json > analyze_output.json ``

2. Copy the file, *analyze_output.json* and install [Tidal Tools](getstarted.html), on a computer with internet access.
3. [Login to Tidal Tools](getstarted.html#login) with `tidal login`
4. Run this command to upload your previously generated data to your Tidal Migrations account: 


    `` tidal analyze --upload-file analyze_output.json ``

### Accessing your domains in the Tidal API

Once you have imported the results to the Tidal API, your domains will appear on the right hand side navigation bar under 


*Assess* -> *URLs*.