---
section: audit_trail
description: "Traceability chain: APA citation → source note → quote with page ref → results extraction → discussion claim with back-reference"
status: draft
---

# Audit trail and traceability

Every claim in the final synthesis must trace back to a specific source annotation, and every source annotation must trace back to a citable original. The chain is:

```
Original source (APA citation + URL/DOI)
  → Source note (3_results/sources/[layer]/[filename].md)
    → Quote or data point (with page/section/timestamp)
      → Results extraction (3_results/primary/ or 3_results/secondary/)
        → Discussion claim (4_discussion/, with back-reference to source note)
```

## Back-references

Every claim in the results and discussion references one or more source notes using the source ID:

```markdown
Treatment duration for dissociative disorders averages 5–10 years
[brand-2009-isstd-survey, herman-1992-complex-ptsd].
```

## Layer README as index

Each layer's README.md maintains a table of all annotated sources, serving as a lookup index:

```markdown
## Annotated sources

| ID | Author | Year | Title | Key finding on duration |
|----|--------|------|-------|------------------------|
| herman-1992-complex-ptsd | Herman, J. | 1992 | Trauma and Recovery | Phase-based; implies years |
```
