---
toc: false
title: Summarize your Applications
layout: pages
parent: Assess
keywords: applications, description, insights, summarize, documents, ai, accelerator
last_updated: September, 2026
summary: "Use Accelerator to automatically generate a description and key insights for your applications, drawing on the data saved to each application and the documents you upload to it."
permalink: summarize-apps.html
---

Tidal Accelerator can automatically summarize your applications for you, making it easier for you to tell at a glance what an application is and why it matters. For any given application, Accelerator can generate a written [description](#generating-a-description) of the app, as well as a set of key [insights](#generating-insights) presented as concise bullet points.

Both of these are generated from the information Accelerator already knows about the application, including any documents you have uploaded to it.

## How does it work?

When you ask Accelerator to summarize an application, it draws on two sources of information:

- The data saved to the application record itself
- The documents you have uploaded to the application

Accelerator combines these sources to produce a summary that reflects everything it knows about the app. The more complete and accurate your application data is, the more useful the generated summary will be.

These summarizations are powered by an LLM, which can make mistakes, so the result must be checked carefully before being saved to the application record.

## Generating a description

The description is a written summary of the application. It gives you a readable overview of what the application is and what it does, based on the data on the application record and any documents uploaded to it.

You can generate a description directly from the application. Accelerator will analyze the available information and produce the description for you.

1. Navigate to the overview page of the application you wish to summarize

   {% include image.html file="summarize-apps-1.png" alt="screenshot of the application overview" %}

2. In the General Information card, click 'Edit'.

   {% include image.html file="summarize-apps-2.png" alt="screenshot of the location of the edit button" %}

3. Under the description field, click 'Generate Description'.

   {% include image.html file="summarize-apps-3.png" alt="screenshot of the location of the 'generate description' button" %}

The description will be generated for you to review and edit. When you are satisfied, click 'Save' to save the new description to the application.

## Generating insights

Application insights are key, bullet-point takeaways about the application.

When generating these insights, Accelerator takes into account both the data on the application record and any documents uploaded to the app.

1. Navigate to the overview page of the application you wish to summarize

   {% include image.html file="summarize-apps-1.png" alt="screenshot of the application overview" %}

2. In the General Information card, click 'Edit'.

   {% include image.html file="summarize-apps-2.png" alt="screenshot of the location of the edit button" %}

3. Under the Insights field, click 'Generate Insights'.

   {% include image.html file="summarize-apps-4.png" alt="screenshot of the location of the 'generate insights' button" %}

The insights will be generated for you to review and edit. When you are satisfied, click 'Save' to save the new insights to the application.

## Using documents in your summaries

When you upload documents to an application, those documents are used in _both_ the generated description and the application insights. This makes uploading relevant documentation a quick way to enrich both summaries at once, without having to manually re-enter that information onto the application record.

{% include image.html file="summarize-apps-3.png" caption="Uploading documents to an application" %}

The following document types are supported for summarization:

`.docx` `.doc` `.pptx` `.ppt` `.odt` `.pdf` `.jpg` `.jpeg` `.png` `.txt` `.rtf` `.csv` `.tsv` `.xls` `.xlsx`

{: .warning }
If information in a document contradicts information from the application record itself, the information on the application record takes precedence.

This means the details you have captured directly on the application are treated as the source of truth. If a document is out of date or disagrees with the application record, update the application record to make sure your summaries reflect the correct information.
