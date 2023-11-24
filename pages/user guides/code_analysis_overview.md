---
toc: false
title: Code Analysis Overview
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

## How to use it
For step-by-step instructions to perform an analysis refer to [the usage guide](/analyze-source-code.html).

## Security
The entire code analysis process takes place locally on your machine. It will scan your files locally looking for common patterns and information when modernizing. The only data that is captured and sent from the analysis are the results of the analysis and the associated metadata. You can view all of the raw analysis results that are sent to Tidal Accelerator before they are sent, by viewing the contents of the results file locally.

