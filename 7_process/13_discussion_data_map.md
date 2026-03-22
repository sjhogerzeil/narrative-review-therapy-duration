---
section: discussion_data_map
description: "Maps each discussion section to the specific data fields that must be collected during annotation. Ensures annotators know what to prioritize for downstream discussion writing."
status: draft
---

# Discussion data requirements map

Each discussion section depends on specific data collected during source annotation. This map ensures that the right data is collected from the start, so discussion sections can be written effectively from the annotated evidence.

## Data flow: source template → extraction → discussion

```
Source annotation (per source)
  → Cross-cutting observations (per source)
  → Extraction files (aggregated across sources)
  → Discussion sections (interpreted)
```

## Map

| Discussion section | Source template fields needed | Extraction file | YAML scanning field |
|---|---|---|---|
| **1. Synthesis** | Summary, Key claims, Duration data, Trajectory, Quotes | All primary + secondary extraction files | summary, duration_data, duration_range, stance |
| **2. Survivorship bias** | Cross-cutting: Survivorship bias, Cross-cutting: Dropout data | *(new)* `3_results/primary/6_dropout.md` | has_dropout_data |
| **3. Dose vs. elapsed time** | Cross-cutting: Dose vs. elapsed time, Secondary: Session frequency | `3_results/secondary/4_frequency.md` | duration_range |
| **4. Therapy vs. life** | Cross-cutting: Therapy vs. life, Secondary: Therapy alone or therapy-plus | `3_results/secondary/6_adjuncts.md` | secondary_qs |
| **5. Counterpoint response** | (entire Layer 3 source notes) | *(Layer 3 sources are the data)* | stance |
| **6. Access and justice** | Cross-cutting: Access and context | *(new)* `3_results/primary/7_access.md` | has_access_context |
| **7. Methodological limitations** | Quality notes, all cross-cutting observations | *(aggregated from all sources)* | — |
| **8. Implications** | (derived from synthesis, not directly from sources) | — | — |
| **9. Inaccessible sources** | (derived from `todo.md`, not from annotated sources) | — | access |

## New extraction files needed

The map reveals two extraction files not yet created:

1. **`3_results/primary/6_dropout.md`** — aggregates dropout rates, attrition data, and premature termination reasons across all sources
2. **`3_results/primary/7_access.md`** — aggregates mentions of financial barriers, insurance, forced termination, socioeconomic context

## Priority data during annotation

When annotating a source, the following cross-cutting observations are **high priority** because multiple discussion sections depend on them:

1. **Dropout data** — feeds survivorship bias discussion. Most sources won't have this; note the absence.
2. **Dose vs. elapsed time** — feeds the dose/time discussion. Record session frequency and total sessions whenever available.
3. **Endpoint definition** — feeds the synthesis and the definition-of-healing analysis. Record the exact language the source uses.
4. **Therapy vs. life** — feeds the attribution discussion. What does the source credit for change?
5. **Access context** — feeds the justice discussion. Does the source acknowledge who can access this?

## What "no data" reveals

The pattern of silence across sources is itself evidence:

| If most sources are silent on... | This tells us... | Discussion section affected |
|---|---|---|
| Dropout rates | The field doesn't track who leaves | Survivorship bias |
| Session frequency | Duration claims are in years, not doses | Dose vs. time |
| Non-therapy factors | The field attributes change to therapy by default | Therapy vs. life |
| Access barriers | The field assumes access is not the problem | Access and justice |
| Endpoint definition | The field conflates levels of change | Synthesis, limitations |
