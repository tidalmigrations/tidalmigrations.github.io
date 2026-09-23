# Agent Guide: Writing Tidal Guides

This document defines the style and conventions for authoring guide pages in
this repository. It is written for AI agents (and humans) who add or edit
pages so that new content matches the existing style. Read this before writing
any guide page.

The guides are built with [Jekyll](https://jekyllrb.com/) using the
`just-the-docs` theme and the `kramdown` Markdown processor. Guide pages live
under `pages/` as Markdown (`.md`) files, organized into section folders
(`introductions`, `discover`, `assess`, `plan`, `api`, `troubleshooting`).

## Writing style

These are the rules the user cares about most. Follow them strictly.

### Do not use em-dashes

Never use em-dashes (the `—` character). When you are tempted to use one, use
one of these instead, whichever fits:

- A hyphen with spaces around it for an aside or interruption.
- A colon to introduce an explanation or list.
- A comma or a new sentence to separate clauses.
- Parentheses for a genuine aside.

For example, write "Tidal recommends a transition type for each application: a
6R-style disposition such as rehost or retire" rather than joining the clauses
with an em-dash.

### Do not over-bold

Reserve bold for a small number of cases. Do not bold whole phrases, sentences,
or every noun in a list. The cleanest pages use bold sparingly. Acceptable uses
of bold:

- Field or attribute names in a definition list (for example a list of record
  attributes where each item starts with the field name in bold).
- UI menu names when giving click-path instructions, though single quotes are
  the more common convention (see below).

If a paragraph has more than one or two bold spans, remove the emphasis. Let
headings and structure carry the emphasis instead of inline bolding.

### Refer to UI elements with single quotes

When naming a button, tab, field, or menu item the reader will click or look
for, wrap the label in single quotes: click 'Edit', navigate to the 'Financial
Impact' tab, click the '+ New' button. Match the capitalization shown in the
product.

### Tone and voice

- Write in the second person, addressing the reader as "you".
- Refer to the product as "Tidal", "Tidal Accelerator", or "Tidal Tools" as
  appropriate. Use the full name on first reference in a page.
- Keep sentences plain and instructional. Prefer short, direct sentences over
  long ones.
- Use Canadian spelling consistently with the surrounding page; do
  not mix.
- Write straight apostrophes and quotes; do not introduce typographic
  (curly) quotes.

## Front matter

Every guide page begins with a YAML front matter block delimited by `---`.
Use the fields below. Match the format of neighbouring pages in the same
section.

```yaml
---
title: Summarize your Applications
layout: pages
parent: Assess
keywords: applications, description, insights, summarize, ai, accelerator
last_updated: September, 2026
summary: "Use Accelerator to automatically generate a description and key insights for your applications."
permalink: summarize-apps.html
---
```

Field conventions:

- `title`: Required. Title case, describing the page. This renders as the page
  heading, so the body does not need to repeat it as a top-level heading.
- `layout: pages`: Required. Always this value.
- `parent`: The section this page belongs to (`Assess`, `Discover`, `Plan`,
  `API`, and so on). Set it for pages that sit under a section in the nav.
- `keywords`: A comma-separated list of search terms relevant to the page.
- `last_updated`: The month and year (or full date) the page was last revised.
  Update this whenever you make a substantive edit.
- `summary`: A one-sentence description in double quotes. Keep it free of
  em-dashes like the rest of the content.
- `permalink`: The output URL, ending in `.html`, using hyphens between words
  (for example `financial-impact.html`). This is the stable public URL, so do
  not change it once a page is published.
- Optional fields seen in existing pages: `sidebar: main_sidebar`,
  `folder: userguides`, `toc: false`, and `nav_exclude: true`. Use them only
  when a neighbouring page in the same section uses them.

## Headings

- Rely on the front matter `title` for the page's main heading. Start the body
  content with a short introductory paragraph, then a `## H2` for the first
  section. Do not add a duplicate `# H1` that repeats the title.
- Use `##` for top-level sections and `###` for subsections. Keep the
  hierarchy shallow; avoid going deeper than `###` unless necessary.
- Write headings in sentence case or title case consistent with the section,
  and keep them short and descriptive.
- You may link to a section by giving it an explicit anchor with
  `## Heading {#anchor}` and referencing it with `[text](#anchor)`.

## Images

Insert images with the theme include, not raw Markdown or HTML:

```liquid
{% include image.html file="summarize-apps-1.png" alt="screenshot of the application overview" %}
```

- Place image files in the top-level `images/` directory and reference them by
  filename only (the include prepends `images/`).
- Always provide a descriptive `alt` value for accessibility.
- Optional attributes supported by the include are `url`, `max-width`, and
  `caption`. Use them only when needed.
- Name screenshots after the page or feature with a numeric suffix, following
  the existing pattern (for example `financial-impact-4.png`,
  `summarize-apps-2.png`).

## Callouts and notes

Use the theme's callout syntax to highlight information. Place the class marker
on its own line immediately before the paragraph it applies to:

```markdown
{: .note }
For all apps, we include the estimated migration cost in the projected cloud
cost for the first year.
```

The available callout types are defined in `_config.yml`: `highlight`,
`important`, `new`, `note`, `tip`, `info`, and `warning`. Use them for their
intended purpose:

- `note` for supplementary detail.
- `tip` for optional advice.
- `warning` for behaviour that could cause data loss, confusion, or precedence
  rules the reader must know.
- `important` and `info` for emphasis that is stronger than a note but not a
  warning.

Do not overuse callouts. One or two per page is usually enough. Do not put
em-dashes or heavy bolding inside them.

## Step-by-step instructions

- Present sequential actions as a numbered list.
- Keep each step to a single action.
- When a step has an accompanying screenshot, indent the `{% include image.html %}`
  under the list item so it stays part of that step.
- Reference UI labels in single quotes as described above.

Example:

```markdown
1. Navigate to the overview page of the application you wish to summarize.

   {% include image.html file="summarize-apps-1.png" alt="the application overview" %}

2. In the General Information card, click 'Edit'.
```

## Links

- Use inline Markdown links: `[link text](url)`.
- Link to other guide pages by their `permalink` (for example
  `[Assessment Projects](assessment-projects.html)`) rather than by file path.
- Use descriptive link text. Avoid "click here" and bare URLs in prose.

## Code and commands

- Use fenced code blocks with a language hint (`bash`, `json`, `yaml`, and so
  on) for commands, requests, and responses.
- Use inline backticks for field names, endpoints, headers, file extensions,
  and other literal values (for example `access_token`, `api/v1/ping`,
  `.docx`).
- Show placeholders in a consistent, obvious form such as
  `[insert your subdomain]`.

## Lists

- Use `-` for unordered lists and `1.` for ordered lists.
- Keep list items parallel in structure.
- For definition-style lists (attribute name followed by description), bold the
  term and follow it with a colon, then the description. This is one of the few
  acceptable uses of bold.

## Before you finish a page

Check the page against this list:

1. No em-dashes anywhere, including the front matter `summary`.
2. Bold is used sparingly, not on whole phrases or every term.
3. Front matter is complete and `permalink` ends in `.html`.
4. The body does not duplicate the title as an `# H1`.
5. Images use the `image.html` include and have `alt` text.
6. UI labels are in single quotes; callouts use the correct type.
7. Links point to `.html` permalinks and have descriptive text.
8. `last_updated` reflects your edit.
