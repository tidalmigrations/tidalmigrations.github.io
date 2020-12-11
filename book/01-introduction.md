---
title: "The Big Book of Tidal Migrations"
titlepage: true
titlepage-color: "4ABFD3"
titlepage-rule-color: "ffD04E"
titlepage-text-color: "ffffff"
toc-own-page: true
links-as-notes: true
---

# Layering Discovery Techniques
# ADD:CHANGE this guide might need an adjust to do a proper introduction of the goal and scope of the book.
# The synopsis of each step here might work well as is, as a brief summary of work and scope.
# Or the TOC replaces this function and the 6 steps here redundant.
# As well, moving the current conclusion here to the end of the book.
```{.include shift-heading-level-by=1}
pages/user guides/discovery_techniques.md
```
# Install Tidal Tools

```{.include}
pages/tidal tools/getstarted.md
```
# This step might need a mention to go to AWS/GCP/Azure marketplace to install there if preffered.

# Import data from Excel
# https://guides.tidalmg.com/import-from-excel.html

# Sync with your hypervisors
# For vsphere - https://guides.tidalmg.com/sync-servers.html
# For all others - https://guides.tidalmg.com/sync-servers.html

# Gather machine statistics from your inventories
# Some of this content here - https://guides.tidalmg.com/index.html#3-aggregate-server-usage-statistics
# And this guide here - https://guides.tidalmg.com/sync_hyper-v.html
# And the docs here - https://github.com/tidalmigrations/machine_stats
# ADD/CHANGE: We need improved steps for this workflow end-to-end.
# Its fragmented between the three above and maybe makes some assumptions or missing steps.

# Web App DNS based discovery - https://guides.tidalmg.com/discover.html
# And analysis and importing - https://guides.tidalmg.com/analyze.html
# This is two steps right now, its really 1 flow.

# Database analysis
# ADD: I think an intro and bridge between the Excel import or inventory sync from earlier above
# is needed here
# follow with instructive steps per DB - https://guides.tidalmg.com/analyze_database.html

# Source code analysis
# ADD: again, a bridge between application inventory from above, and when this is applicable
# Follow with instructive steps per app - https://guides.tidalmg.com/analyze-source-code.html

# Application interviews
# ADD: Best practices and how to conduct and store interview results using Tidal Migrations.

# Discovery wrap up
# ADD: conclusion on discovery steps and how to approach full assessment next.

# Technical troubleshooting
# Troubleshooting issues with Tidal Tools - https://guides.tidalmg.com/troubleshooting.html
