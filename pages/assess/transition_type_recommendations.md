---
toc: false
parent: Assess
title: Transition Type Recommendations (6R)
layout: pages
keywords: 6R, 6 Rs, transition type, recommendation, disposition, assessment, business value, migration complexity
last_updated: September, 2026
summary: "How Tidal Accelerator recommends a transition type (6R-style disposition) for each application once enough assessment evidence exists — and how that differs from cloud instance recommendations and Recommended Steps."
permalink: transition-type-recommendations.html
---

Tidal Accelerator can recommend a **transition type** for each application — a 6R-style disposition such as rehost, replatform, refactor, or retire — once enough assessment evidence exists in your project or portfolio.

The recommended value is called **Recommended Transition Type**. It is produced by Accelerator's transition type recommendation engine and is distinct from the transition type you choose yourself on the application Migration Plan.

{: .note }
Looking for **cloud instance** (VM → EC2 / Azure VM) sizing instead? See [Cloud Instance Recommendations](instance-recommendation.html). That is a different feature.

## What it is

After you gather assessment data for applications in a **scoped project** (or leave them at portfolio level with no project), Accelerator scores each application along two axes:

- **Business value** — signals such as interview and financial fields that indicate how valuable the application is to the business.
- **Migration complexity** — signals such as operating system, dependency mapping, and (when enabled) source code analysis that indicate how complex the application is to migrate or modernize.

Those scores are placed in a business value × migration complexity space. The engine then maps each application into a recommended disposition region and sets **Recommended Transition Type**.

Recommendations are **relative** within the project (or portfolio) peer set: apps are scored in context of the other apps in that scope, not in isolation.

You are expected to review and, when appropriate, **override** the recommendation by setting the user-selected **Transition Type** yourself.

## Recommended Transition Type vs Transition Type vs Recommended Steps

| Concept | What it is |
|---|---|
| **Recommended Transition Type** | Accelerator's suggested disposition from the 6R recommendation engine. |
| **Transition Type** (user-selected) | The disposition you choose on the application's Migration Plan (Transition Planning). This is the value your team plans against. |
| **Recommended Steps** | A checklist of next steps generated **after** you set Transition Type to rehost, replatform, or refactor. See [Modernization Assessment — Recommended Steps](modernization-assessment.html#recommended-steps). |

Setting or changing the user-selected Transition Type does **not** re-run the 6R recommendation engine. Recommended Steps follow your selection; they are not how Accelerator chooses among the 6 Rs.

## What it is not

Please do not confuse Transition Type Recommendations with:

- **[Cloud Instance Recommendations](instance-recommendation.html)** — server → cloud instance target (CIT) sizing for Azure and Amazon Web Services.
- **Recommended Steps** — narrative next steps after you pick a transition type (see above).
- **Modernization Assessment weighted score / MVA shortlist** — presentation scoring used in the AMA PowerPoint flow, not the 6R disposition engine. See [Modernization Assessment](modernization-assessment.html).
- **Financial Impact ROI comparison** — manually entered alternative transition costs compared for ROI. That uses “6R” language for cost comparison; it does not produce Recommended Transition Type. See [Financial Impact — ROI Comparison](financial-impact.html#roi-comparison).

## Where do I start?

### 1. Scope apps in a project (recommended)

Group the applications you want scored together into a **scoped** [assessment project](assessment-projects.html). Apps in a scoped project are recommended relative to their project peers. Apps with no project are scored at the portfolio level.

When you create or edit a project, set the **primary focus** (for example savings, agility, and modernization-related goals). Focus influences how recommendation regions are oriented for that project.

### 2. Complete enough assessment data

The engine waits until enough of your portfolio or project is assessment-ready. Typical inputs that contribute to readiness include:

- [Application interview](interviews.html) / business-value signals
- Operating system information on related servers
- Dependency mapping (or explicitly marking dependency mapping as not applicable where appropriate)
- [Source code analysis](analyze-source-code.html), unless source code analysis is disabled on the project

You generally need a meaningful set of applications in scope, with enough attributes completed per app, before recommendations appear. If recommendations are not ready yet, the assessment experience historically surfaces a **readiness** explanation (popup / progress) listing what is still incomplete.

{: .note }
Exact readiness thresholds are internal to the product. Use the in-app readiness / progress indicators as the source of truth for what to finish next.

### 3. Wait for background computation

When assessment data changes, Accelerator recomputes recommendations in the background (via a recommendation job). Recomputation can take a short time; a scheduled cleanup run also refreshes recommendations periodically.

### 4. Review Recommended Transition Type

Once readiness gates are met, each eligible application receives a **Recommended Transition Type**. Review it alongside your interview notes and architecture judgment, then set the user-selected **Transition Type** on the Migration Plan when your team agrees.

Optional: after you set Transition Type to rehost, replatform, or refactor, Accelerator can fill **Recommended Steps** for planning detail.

## How to customize recommendation behavior in a project

Projects expose settings that steer recommendations without changing raw inventory data:

### Project focus (savings / agility / modernization)

On the project create / edit experience, set the **primary focus** of the project — for example emphasizing cost savings, agility, and modernization themes (operating system, middleware, application frameworks). These focus choices adjust how disposition regions are applied for apps in that project. See [Organizing your application assessments into projects](assessment-projects.html#creating-a-project).

### Recommendation weights (business value vs migration complexity)

Each project stores **recommendation weights**: the relative emphasis of **business value** versus **migration complexity** when composing the score used with the disposition map.

- Weights are percentages that **must sum to 100**.
- By default, projects use a **balanced** emphasis between business value and migration complexity.
- Adjusting the balance tilts recommendations toward value-led or complexity-led dispositions for that project's apps.

Projects may also expose related weight groups used when computing the underlying business-value and migration-complexity scores (for example how revenue vs person-hours-saved contribute to business value). Treat those as advanced project tuning; prefer changing **recommendation weights** and **focus** first.

{: .note }
**Confirm exact UI path with your Tidal contact (or Justin / Sam)** if you do not see recommendation weight controls on the project form in your workspace build. The product supports these settings at the project level (including defaults via the projects API); label placement in the UI can vary by release.

Changing focus or weights triggers recommendation recomputation for apps in that project after the background job runs.

## Which transition types can be auto-recommended?

Accelerator recognizes the common transition types used in 6R-style planning, including **rehost**, **replatform**, **refactor**, **retire**, **retain**, **repurchase**, and **relocate**.

The automatic recommendation map currently assigns **retire**, **replatform**, **rehost**, and **refactor**. **Retain**, **repurchase**, and **relocate** remain available as user-selected transition types even when they are not produced automatically.

{: .note }
If your methodology needs retain / repurchase / relocate as planned outcomes, set the user-selected Transition Type explicitly after review.

## API (optional)

For automation and integrations, Accelerator exposes REST endpoints such as:

- `GET /apps/:id/recommended_transition_type`
- `GET /apps/:id/recommendation_progress`
- `GET /app_progress/recommendation_progress`

Authenticate as you would for other Accelerator API calls. These endpoints return the recommended disposition and readiness progress; they do not replace reviewing recommendations in the product UI.

## Related guides

- [Application Interview Best Practices](interviews.html)
- [Organizing your application assessments into projects](assessment-projects.html)
- [Performing Source Code Analysis](analyze-source-code.html)
- [Financial Impact](financial-impact.html) (ROI comparison of alternative transition costs — not the recommendation engine)
- [Cloud Instance Recommendations](instance-recommendation.html)
- [Modernization Assessment](modernization-assessment.html)
