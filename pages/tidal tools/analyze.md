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

## Analyzing FQDNs and URLs
As it happens, most folks have multiple applications in their environment that they would like to assess and migrate to the cloud. 

There are three ways you can analyze your applications and determine its technologies and networks.
 
- Simply save a list of URLs or FQDNs in a text file and use that as input.

    `` tidal analyze my_urls.txt ``

- You can also utlize the standard output of URLs and FQDNs from Tidal Discover as input.

    `` tidal discover --plan my_plan.yml  | tidal analyze ``
    
- Lastly, you can save the outputted URLs and FQDNs from Tidal Discover as a file to analyze at a later time.

    `` tidal discover --plan my_plan.yml -f my_urls.txt ``

## Uploading to Tidal Migrations API

After recieving the results of Tidal Analyze, you may or may not be connected to the internet.

If you are so, you can import it to your Tidal Migrations account with the following flag:

`tidal analyze my_urls.txt --upload `

If you aren't connected to the internet, you also have the option to save the results in a JSON file to import at a later time. This can be done with the flag:

`tidal analyze my_urls.txt --upload-file results.txt`

### Accessing your domains in the Tidal API

Once you have imported the results to the Tidal API, your domains will appear on the right hand side navigation bar under 
<br> *Assess* -> *URLs*.