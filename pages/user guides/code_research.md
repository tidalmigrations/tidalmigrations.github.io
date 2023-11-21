---
toc: false
title: Tidal Code Research Program
keywords: code, analyze, source code
last_updated: November, 2023
summary: "Participate in the Code Research Program and gain even more insights from your code"
sidebar: main_sidebar
folder: userguides
permalink: code-research.html
---

## Benefits of Participating

- You will get early access to new findings and insights for your entire application portfolio, not only the ones that are a part of the program, at no additional cost.
- Providing the data will allow us to do extensive research in the analysis and recommendations for migrating applications.
- You can opt out and remove your code at any time, let us know if you want to leave and we will immediately remove any code you provided.

## What we do and not do with the Code
- We will use the code to identify, confirm, and validate configurations and implementation details that should be considered when migrating or transforming an application.
- Data will be analyzed and reviewed manually by the research team for analytical purposes only. 
- No output directly from any of the code itself will be used beyond the analysis itself. 
- The code will never be copied or included as part of any larger system or model. The data will only ever be manually inspected by individuals. The results and findings of any analysis will remain within the enclave environment until you decide otherwise.

## How to Participate
Provide a copy of application source code for one or more of your applications when you analyze the code with tidal tools:
When analyzing provide the additional, `--research` flag to have it included in the program:

```bash
tidal analyze code --research
```
	
Enable or disable inclusion in the program for all invocations of tidal tools with this subcommand:

```bash
tidal analyze code research –enable
tidal analyze code research –disable
```

When run, each code artifact included in the program is given a unique identifier and that is shared with you after successful uploading. If at any time in the future you would like us to destroy the copy we have, you can provide us with this identifier and the code will be removed within 2 business days.

## How we Protect your Code
- Data resides inside a dedicated, restricted, and controlled enclave environment.
- The enclave is not accessible to any individuals by default. Access is only granted temporarily to the limited team members on the research and development team. Data does not ever leave the research enclave. It never resides on devices outside the enclave.
- The enclave is fully isolated from all other systems and software products. It is a dedicated AWS account, residing in Canada. All regions and services within the enclave, except the several in use are disabled.
- Data is not stored or accessible from within any software products. The enclave has no connectivity to the internet or any other networks.
- Data is encrypted at rest using AES-256 GCM encryption keys and TLS during transit within the enclave is enforced.
- Tidal follows and practices the most current and industry-leading security practices. [View our actively monitored and presented controls and policies](https://app.drata.com/trust/9cb8ac39-0c38-11ee-865f-029d78a187d9)
- Tidal is receiving a completed SOC II Type 2 report in the coming weeks.

## Questions?
- Considering joining and still have some questions? [Send us a note](mailto:support@tidalcloud.com?subject=Question about the Code Research Program) and we would be happy to review even further and answer your questions.
