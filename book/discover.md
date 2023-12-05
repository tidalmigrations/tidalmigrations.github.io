---
title: "Tidal Layered Discovery Guide"
toc-own-page: true
links-as-notes: true
mainfont: NotoSans
monofont: SourceCodePro
monofontoptions: "Scale=0.9"
papersize: a4
geometry: margin=20mm
documentclass: report
---

# Layering discovery techniques
This book will cover all the discovery steps you will need to perform for your cloud migration project.

```{.include shift-heading-level-by=1}
pages/user guides/six_steps.md
```

The remaining will now go through the discvory process step by step. Starting with installing Tidal Tools.

# Getting started with Tidal Tools

```{.include}
pages/tidal tools/getstarted.md
```
# Import data from Excel

```{.include}
pages/user guides/importing_from_excel.md
```

# Sync with your hypervisors

```{.include}
pages/tidal tools/vsphere.md
```

```{.include}
pages/tidal tools/syncservers.md
```

# Web applications discovery, analysis and importing

```{.include}
pages/tidal tools/discover.md
```

```{.include}
pages/tidal tools/analyze.md
```

# Host discovery with Nmap

```{.include}
pages/user guides/discover_nmap.md
```

# Database analysis

```{.include}
pages/tidal tools/analyze_database.md
```

# Source code analysis

```{.include}
pages/user guides/code_analysis_overview.md
```

```{.include}
pages/tidal tools/sourcecode.md
```

# Summary

Congratulations! You have completed your discovery across your portfolio.

We hope that this book helped you to get yourself familiar with **Layering Discovery Techniques**:

1. Importing spreadsheets of applications, databases, servers, and virtualization clusters
2. Scheduling synchronizations across your hypervisors such as VMWare or Hyper-V
3. Server usage statistics aggregation
4. Discovering and fingerprinting your running web applications
5. Performing databases analysis
6. Analyzing your source code

That was the beginning of your journey towards the transformative cloud migrations. And now, we hope, you are ready to move forward!

# Next Steps

Now that you have completed your discovery across your portfolio, you are ready to do your assessment.
The first step is to make sure you have a set of discrete applications in scope for your migration project.
Navigating to your list of `Applications` under the `ASSESS` section in the platform, you should be able to see a list of all your applications.
From here, you can tag them with a specific tag for your project, and even create a dashboard tile that includes all the items in scope.

With the list of applications and a full set of data from the discovery process, you can now perform an initial assessment and determine a transition
strategy (one of the 6 Rs) for each application.

As well with this data, you can generate a report, from the `Portfolio Reports` section under `PLAN`, in order to get a full report on your assessment.
This report can be shared with other parties and people interested in the project progress.

# Appendix

## Technical troubleshooting

```{.include}
pages/tidal tools/troubleshooting.md
```
