---
toc: false
title: Layering Discovery Techniques
keywords: sync, import, discover, analyze, source code, discovery plan
last_updated: July, 2018
summary: "A quick guide on the various discovery techniques and how to layer them together to quickly and accurately discover your environment"
sidebar: user_guidesbar
folder: userguides
permalink: discovery-techniques.html
---

Cloud migration is the process of moving your data, applications, and other elements to the cloud. However, the path to the cloud can be long and painful without proper planning and execution.
By following Tidal Migration's six discovery layering techniques, you will be migrating to the cloud with ease!

{% include image.html file="layered_discovery.png" caption="Tidal Migrations' layered approach to application discovery, for cloud migration." %}

# Six Steps To Discovery Bliss

## 1) Import Your Spreadsheets

If your already have some data collected in spreadsheets, the first step to begin your cloud migration project is importing a spreadsheet of Virtualization Clusters, Servers, Databases Instances and Applications. Tidal Migration's importer will guide you through mapping your columns to our fields, create your own fields and even make associations between dependencies if you have captured these.

_NB: See additional ways on importing your [applications](importapps.html) and [servers](import_servers.html) in the API docs._

<hr />

## 2) Integrate Your Hypervisors

Once you have imported your data, you can begin to synchronize your inventories via [`tidal sync servers`](syncservers.html).
Tidal sync supports many server inventory management tools such as VMWare and HyperV with more possible via scripting ([ask us](https://tidalmigrations.com/contact)).

If you have VM Ware's vSphere, [`tidal sync vsphere`](#vsphere-sync) will handle everying with just read-only credentials required.


### Scheduling your sync:
It is useful to setup a cron job or Windows Scheduled Task for this process, and we recommend synchronizing your inventories no more than once per day. 

This will keep your resource inventory up to date and show you usage trends over time in the _Analyze_ feature.

<hr />

## 3) Aggregate Server Usage Statistics

Tidal Migrations provides you with a simple and effective way to [gather machine statistics](https://github.com/tidalmigrations/machine_stats) (RAM, Storage, CPU allocations and usage) from Windows and UNIX/Linux server environmens.
In Windows, we use WinRM to Invoke-Command across your servers, and for *NIX we leverage ansible. Both of these approaches output JSON which is securely sent to your Tidal Migrations instance using the tidal command.

Checkout this [guide](sync_hyper-v.html) for a quick and clean approach to gathering server usage statistics. See the [machine_stats](https://github.com/tidalmigrations/machine_stats) repository for more implementation details.

_NB: Feel free to fork the repo and modify to suit your needs, or to show your security team and give them comfort.  This extensibility and transparency is core to our approach._

<hr />

## 4) Fingerprint Web Applications 

**a.)** The initial step in your cloud journey is discovering what you have.
It can be hard to remain informed about all the domains and applications 
hosted in your environment, which is why we created the `tidal discover` command. 
With your customized _Discovery Plan_ you can obtain both private and public domains
within your datacentres in under 60 seconds.

[This tidal-tools guide](discover.html) contains examples for creating your own _Discovery Plan_ to scan multiple networks and DNS services.

**b.)** With a list of domains in hand, the next step is to _analyze_ the applications hosted on these domains.

`tidal analyze` will fingerprint the technology on both your internet sites and intranet applications behind your firewall in seconds, _without needing to install agents._ 
Whether you have 1 or 1 million end points, Tidal Tools centralizes the data gathered into our platform for you to analyze further and plan with, simplifying your application centric cloud migration.

For detailed information and steps on analyzing your domains, be sure to checkout this [guide](analyze.html).

<hr />

## 5) Analyze Your Databases
Analyze all of your databases in minutes and _measure_ the migration difficulty.

After running `tidal analyze db your_config.yml` against your databases ([see guide](/analyze_database.html)), you will understand which database features in your Oracle or SQL Server installations make it difficult to adopt cloud-native database offerings and also identify which applications are connecting to your databases. 

With over 100 unique characteristics considered, comparisons are made with the data platforms available in the cloud(s) you are migrating to which provide you with _data-driven insights_ for planning your cloud migration.

Follow the steps in [the guide](/analyze_database.html), and you will be
able to quantify the difficulty in migrating your database from Oracle
to PostreSQL; or from SQL Server to AWS Aurora etc.

<hr />


## 6) Analyze Your Source Code

Finally, to find the applications which will migrate more easily to
cloud-native technologies you can analyze your source code and rank
your applications by _Cloud Readiness_.

Doing this for each of your custom applications which have a _Transition
Type_ of Refactor or Replatform will give you the data needed to prioritize your
application migrations.  To analyze your source code, you need the
`Application ID`, to be logged in with tidal-tools and a copy of the
source code checked out.

You can find the `Application ID` in the URL bar when looking at an
application.  e.g. if I'm loking at an application in Tidal Migrations,
the URL will show `https://demo2.tidalmg.com/#/apps/111`  Here, `111` is
my `Application ID`.

I can now analyze the source code with:

```
cd /path/to/source-code
tidal analyze --app-id 111 .
```
To find additional information about this feature, visit the [guide](analyze-source-code.html) on analyzing your source code.

<hr />

# Conclusion
Immediately getting an idea of the size and scope of your migration is
critical to successful cloud migration planning.

Our goal at Tidal Migrations is to provide you with useful information
within 60 seconds of signup, and letting you layer in additional
information from discovery sources as needed.  

_You do not need to spend weeks and months installing discovery systems
to start planning your cloud migration any more._


---
Not yet a customer?  See [tidalmigrations.com](https://tidalmigrations.com) and [Try For Free](https://get.tidalmg.com).

