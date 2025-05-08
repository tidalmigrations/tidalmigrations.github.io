---
toc: false
parent: User Guides
title: Public URL Discovery
keywords: urls, discover
last_updated: November, 2022
summary: "Discover your organizations public URLs"
sidebar: main_sidebar
folder: userguides
permalink: public-urls.html
---

# Discover your organizations public URLs
We will start with a single domain that you know of for your organization, and in the end, discover
and capture a new set of other domains and URLs that are publicly available for your organization.
The entire process should only take a couple of minutes and does not require any private network access.

## Step 1
You can start with a top level domain that your company owns. For example, canadiantire.ca.

[Analyze the domain with Tidal Tools](https://guides.tidal.cloud/analyze.html). - `tidal analyze web canadiantire.ca`

{% include image.html file="analyze.png" %}
<br>
<br>

Check if you own this domain. The organization name in the top right of the table states who owns it.
If you do own it, take a look at the AS number in the results and note down the IP address from the DNS A results.
In this case the IP address is `205.210.17.179` and the ASN is `AS20940`.

If you don’t own it, you can try analyzing another domain.

{: .tip } 
If you don’t own any domains directly yourself, you can skip
to the last step here and try simply searching the domain name in the
Public URLs search in Tidal.

## Step 2
Go to https://whois.com/whois and search the IP you found above, in this case, `205.210.17.179`.
From the results you should see a `CIDR` value, note this down. In this case it is `205.210.17.0/24`

{% include image.html file="whois.png" %}

## Step 3
Go to ipinfo.io and search for the AS number from above. Note down any CIDR ranges that are labelled as netblock ranges.
In this case the range is `104.194.16.0/22`. There can be many `netblock` values listed here, in this case there is only 1.
If there are more you can note down all of them here.

{% include image.html file="ipinfo.png" %}

## Step 4
Go to your account on Tidal `https://my_workspace.tidal.cloud/public-urls`.
Enter the CIDR range you found above, from the whois command or any labelled as netblock from ipinfo.io.
In this case that is `104.194.16.0/22` and `205.210.17.0/24`.

{% include image.html file="public_url_search1.png" %}

You should now see a list of domains that belong to your organization.
With this list you can now continue your discovery by assigning them to applications within Tidal,
either applications you already have identified or by creating new applications with these URLs as the initial data points.

Note: If the CIDR range you have found is very large (/16 larger) you can use a <a href="https://tidalcloud.com/subnet-builder/">subnet viewer</a> to break it into smaller ranges.
