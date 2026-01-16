---
toc: false
parent: Assess
title: Code Analysis Overview
layout: pages
keywords: code, analyze, source code
last_updated: Novemvber, 2023
summary: "What code analysis does and its compatibility"
sidebar: main_sidebar
folder: userguides
permalink: code-analysis-overview.html
---

Analyzes an application's source code for various patterns that are useful in assessing applications for transformation and continual modernization.

## Language support

|                        Language | Statistics  | Package Currency  | IP Address Detection  | Filesystem Detection  | Subprocess Detection  |
|---------------------------------|-------------|-------------------|-----------------------|-----------------------|-----------------------|
|                              C# |      ✅     |         ✅        |           ✅          |           ✅          |           ✅          |
|                            Java |      ✅     |         ✅        |           ✅          |           ✅          |           ✅          |
|                      JavaScript |      ✅     |         ✅        |           ✅          |           ✅          |           ✅          |
|                            Ruby |      ✅     |         ✅        |           ✅          |           ✅          |           ✅          |
|                          Python |      ✅     |         ➖        |           ✅          |           ✅          |           ✅          |
|                           COBOL |      ✅     |         ➖        |           ✅          |           ➖          |           ➖          |
|                             PHP |      ✅     |         ➖        |           ✅          |           ➖          |           ➖          |
|                             C++ |      ✅     |         ➖        |           ✅          |           ➖          |           ➖          |
|                               C |      ✅     |         ➖        |           ✅          |           ➖          |           ➖          |
|                 sh/bash/ksh/zsh |      ✅     |         ➖        |           ✅          |           ➖          |           ➖          |
|                             JSP |      ✅     |         ➖        |           ✅          |           ➖          |           ➖          |
|                            Perl |      ✅     |         ➖        |           ✅          |           ➖          |           ➖          |
| Visual Basic, VB.NET, VBScript  |      ✅     |         ➖        |           ✅          |           ➖          |           ➖          |

It is also able to determine statistics and IP address detection for almost any source code files including but not limited to:

Ada, ASP, ASP.NET, Assembly, AWK, Basic, Batch, C Header, C Shell, C++ Header, Clojure, ClojureScript, CMake, CoffeeScript, CSS, Cython, Coldfusion, D, Dart, Dockerfile, Elixir, Elm, Emacs Lisp, Erlang, F#, Fish, modern and legacy Fortran, Groovy, Go, Handlebars, Haskell, HTML, INI, Jupyter, Kotlin, LaTeX, Less, Lisp, Lua, Makefile, Matlab, Nushell, Objective-C, Objective C++, OCaml, Pascal, PL/SQL, Powershell, R, Rexx, Ruby, Rust, Sass, Scala, Scheme, sed, Swift, Terraform, and TypeScript.

## What does it do

It measures and determines several important aspects of an application code base including;

- Statistics - Overall code base statistics, including statistics regarding the total number of files, lines of code, comments and blank lines, types of languages used, as well as these statistics per source file.
- Package Currency - Library and package detection, including the names and versions of all packages used.
- Filesystem Detection - Filesystem usage, reading, writing, or manipulation of files stored on the OS filesystem.
- Subprocess Detection - Usage of executing subprocesses outside of the execution environment of the language.
- IP Address Detection -  Identification of references to IP addresses, private addresses, and addresses used as listeners.

## What information is collected
The entire code analysis process takes place locally on your machine. It will scan your files locally looking for common patterns and information when modernizing.

This information includes:

- Statistics of total number of lines, by language. For example:
```javascript
{"Blank": 575,
 "Bytes": 95722,
 "Code": 2530,
 "CodeBytes": 0,
 "Comment": 299,
 "Complexity": 183,
 "Count": 42,
 "Files": [],
 "Lines": 3404,
 "Name": "JavaScript",
 "WeightedComplexity": 0}
```

- Filepaths of files analyzed, for example:
```javascript
"/src/home/pnr/tidal/schoolbus/Server/SchoolBusAPI/Authentication/SbJwtBearerEvents.cs",
"/src/home/pnr/tidal/schoolbus/Server/SchoolBusAPI/Authorization/ClaimsPrincipalExtensions.cs",
"/src/home/pnr/tidal/schoolbus/Server/SchoolBusAPI/Authorization/PermissionHandler.cs",
```

- Identified software dependencies package names, and versions, for example:
```javascript
{
  "from_file": "/src/home/pnr/tidal/schoolbus/Server/Serilog.Sinks.SbiPostgreSql/Serilog.Sinks.SbiPostgreSql.csproj",
  "language": "CSharp",
  "name": ".NET Core",
  "owner": null,
  "version": "3.1"
},
{
  "from_file": "/src/home/pnr/tidal/schoolbus/client/package-lock.json",
  "language": "JavaScript",
  "name": "@babel/code-frame",
  "owner": null,
  "version": "7.10.4"
}
```

- Identified patterns and implementations in code, for example, the detection of filesystem usage in Python:
```javascript
{
  "check_id": "filesystem-python",
  "end": {
    "col": 19,
    "line": 132,
    "offset": 3703
  },
  "extra": {
    "engine_kind": "OSS",
    "fingerprint": "f50c74db097532ad463e76e178545defc5ed47fbaf364527da876a75e33481708f97308217f2364b57a9986f939c65030a21853622be9380d16c08940a95cbb6_0",
    "is_ignored": false,
    "lines": "    if not os.path.exists(output_dir):",
    "message": "Filesystem usage",
    "metadata": {},
    "metavars": {},
    "severity": "INFO"
  },
  "path": "/src/home/pnr/tidal/schoolbus/ApiSpec/CCWJurisdiction/csv2json.py",
  "start": {
    "col": 12,
    "line": 132,
    "offset": 3696
  }
}
```

These are snippets from a real [analysis results file](./code-analysis-20231205-123731-all.json). To verify and confirm these findings, and see what the full results include on either your application or a sample application see the next section below.
## Validate and confirm
You can view all of the raw analysis results before they are sent or seen by anyone. You can perform the entire analysis locally without any network connectivity to ensure this.
The only data that is captured and sent from the analysis are the results of the analysis and the associated metadata.

To see an example of the information that is captured and sent:

1. Download a copy of this open-source ['schoolbus' application](https://github.com/tidalmigrations/schoolbus) by [cloning it with `git`](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository) or [downloading a zip file](https://docs.github.com/en/repositories/working-with-files/using-files/downloading-source-code-archives#downloading-source-code-archives-from-the-repository-view)(and then unzipping it) from GitHub. If you have source code locally that you would like to try it on we recommend you use that.

2. Move to the schoolbus directory, download the needed docker images, and run the code analysis locally:
```bash
cd schoolbus
tidal backup
tidal analyze code --offline
```
The `--offline` flag indicates that the results are saved to a local file and no data is retrieved or sent on any network. This is why the first `backup` command is needed, to download the necessary analysis components. Only the `backup` command requires internet access. The `--offline` flag by design does not use any network connectivity, and if you want you can disable network connectivity before running the analyze command.

3. After the analysis is completed, open the file (using any text editor) that was created in your current directory, `code-analysis-<DATE>-all.json`. You can review all of the information that is included in this results file. Only the information in this file is sent, processed, and stored by Tidal.
You can see [here a complete results file](./code-analysis-20231205-123731-all.json) from an analysis of the 'schoolbus' application.

4. If you have any questions about the contents of the results please [let us know](mailto:support@tidalcloud.com?subject=Question about source code analysis results). Once you are satisfied with the contents of the results you can send the results to your Tidal Workspace:
```bash
tidal analyze code upload --app-id 1 ./path-to-results-file
```

## How to use it
For step-by-step instructions to perform an analysis refer to [the usage guide](/analyze-source-code.html).
