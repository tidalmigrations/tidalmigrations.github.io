---
title: Application Edit History
layout: pages
parent: Introductions
keywords: history, edits, revert, changes, diff, application
last_updated: May, 2026
summary: "View, inspect, and revert edits made to application records in Tidal Accelerator."
sidebar: main_sidebar
permalink: application-edit-history.html
---

Application Edit History lets you view a timeline of changes made to an application record, inspect the details of each edit, and revert changes when needed.

## Accessing Edit History

To view the edit history for an application, open the application record and click the **History** button in the toolbar. This opens a drawer with a timeline of edits made to the record.

{% include image.html file="edit-history1.png" %}

## Viewing Edits

The history drawer displays edits in chronological order. Each entry shows who made the change and when. If a single edit modified multiple attributes, a summary is shown with a subsection of changes.

{% include image.html file="edit-history2.png" %}

## Inspecting an Edit

To see the full details of an edit, click **Inspect Edit**. This opens an inspection modal with a side-by-side comparison of all fields which changed as a result of that edit action.

{% include image.html file="edit-history3.png" %}

## Reverting a Change

From the inspection modal, click **Revert Edits** to undo the edit action. The fields which were changed will be restored to their prior values, shown as **Before** in the inspection modal.

Edits that are the result of a revert are marked with a **Reverted on** badge in the history timeline, showing when the revert took place.

{% include image.html file="edit-history4.png" %}

## Limitations

Application Edit History only shows edits which can be reverted. Currently, certain record attributes and the relationships between records are not included in this feature.
