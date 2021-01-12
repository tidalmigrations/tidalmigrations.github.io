---
title: "Tidal Migrations Layered Discovery Guide"
titlepage: true
titlepage-color: "4ABFD3"
titlepage-rule-color: "ffD04E"
titlepage-text-color: "ffffff"
toc-own-page: true
links-as-notes: true
mainfont: NotoSans
monofont: SourceCodePro
monofontoptions: "Scale=0.9"
papersize: a4
geometry: margin=20mm
documentclass: report
---

# Short intro to what the book will cover.
ie. end to end discovery process for a new environment.

# Layering discovery techniques

```{.include shift-heading-level-by=1}
pages/user guides/discovery_techniques.md
```
<!--  can we drop certain sections from existing guides easily or not?
The conclusion section above, would be good to drop or replace it with something that make more sense to continue to the rest
of the book.
ie. we will now go through the discvory process for each layer, top to bottom. and starting with installing Tidal Tools.
-->

# Getting started with Tidal Tools

```{.include}
pages/tidal tools/getstarted.md
```
<!-- I think this guide should probaby include the oneliner on how to install for Unix at the top. and a link to the Windows installer.
reason being, the rest of the book has all the commands (or should) needed, want the book to be inclusive of what to do, not link out to website. especially for 1 line-->

# Import data from Excel

```{.include}
pages/user guides/importing_to_excel.md
```

# Sync with your hypervisors

```{.include}
pages/tidal tools/vsphere.md
```

```{.include}
pages/tidal tools/syncservers.md
```

<!-- Lets do this one after initial release. It is key though, and ties into improving the documentation
for the machine stats repo itself as well.
# Gather machine statistics from your inventories

TODO
-->

# Web applications discovery, analysis and importing

```{.include}
pages/tidal tools/discover.md
```

```{.include}
pages/tidal tools/analyze.md
```

# Database analysis

```{.include}
pages/tidal tools/analyze_database.md
```

# Source code analysis

```{.include}
pages/tidal tools/sourcecode.md
```

<!-- we can do this after first release
# Application interviews
TODO
-->

# Discovery wrap up
A closing section on what they do with all of this data, next after this is needed.
- determine and confirm the defined and discrete set of applications in the portfolio.
- determine one of the 6 Rs for each of your applications. (Tidal will provide recomendations for you if it has the needed data from this process.)

# Technical troubleshooting

```{.include}
pages/tidal tools/troubleshooting.md
```
