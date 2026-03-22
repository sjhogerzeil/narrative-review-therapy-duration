---
section: audit_trail
description: "Traceability chain: APA citation → source note → quote with page ref → results extraction → discussion claim with back-reference"
status: draft
---

# Audit trail and traceability

## What the audit trail is for

The audit trail allows a reader to **replicate the final analysis** — to follow any claim in the discussion back to its source and verify it. It does not document the intermediate steps of the research process (git captures that). The final state of every file is the auditable record.

**Git captures chronology.** If a reader wants to know *when* a source was added, *why* the search strategy changed, or *how* a question emerged, they can consult the git history and the iteration log in `2_methods/12_rerun_protocol.md`. The audit trail itself only needs to support: "this claim in the discussion → this data in the extraction file → this quote in this source note → this page in this publication."

## Traceability chain

Every claim in the final synthesis must trace back to a specific source annotation, and every source annotation must trace back to a citable original. The chain is:

```
Original source (APA citation + URL/DOI)
  → Source note (3_results/sources/[layer]/[filename].md)
    → Quote or data point (with page/section/timestamp)
      → Results extraction (3_results/primary/ or 3_results/secondary/)
        → Discussion claim (4_discussion/, with back-reference to source note)
```

## Back-references

Every claim in the results and discussion references one or more source notes using pandoc citation keys:

```markdown
Treatment duration for dissociative disorders averages 5–10 years
[@brand-2009-isstd-survey; @herman-1992-complex-ptsd].
```

Three citation forms are used:
- `[@source-id]` — parenthetical: renders as (Author, Year)
- `@source-id` — textual: renders as Author (Year)
- `[-@source-id]` — suppress author: renders as (Year), when the author is already named in the text

These are standard pandoc citekeys. When building the PDF with `pandoc --natbib`, they produce `\citep{}`, `\citet{}`, and `\citeyear{}` respectively. The `.bib` file is generated from source note YAML by `python3 _scripts/generate_bib.py`.

## Layer README as index

Each layer's README.md maintains a table of all annotated sources, serving as a lookup index:

```markdown
## Annotated sources

| ID | Author | Year | Title | Key finding on duration |
|----|--------|------|-------|------------------------|
| herman-1992-complex-ptsd | Herman, J. | 1992 | Trauma and Recovery | Phase-based; implies years |
```
