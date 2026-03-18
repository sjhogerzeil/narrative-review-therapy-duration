---
section: inaccessible_sources
description: "Impact of sources identified as relevant but not accessed — paywalls, unavailability, language barriers. No sugar-coating. States what was missed and how it may affect conclusions."
status: scaffold
depends_on: [todo.md]
---

# Inaccessible sources and their impact

## The problem

Academic literature is largely behind paywalls. Key naturalistic studies, meta-analyses, and clinical book chapters may be inaccessible without institutional access. This creates a systematic bias: freely available sources (open-access articles, blogs, forum posts, some books) are overrepresented relative to paywalled sources. Since paywalled sources disproportionately include the highest-quality empirical evidence (Layer 1 and Layer 2), this bias is not random — it skews the evidence base toward grey literature and experiential accounts.

## How we mitigated it

1. **`todo.md`** logs every inaccessible source with full bibliographic detail, barrier type, *why it matters*, and *expected impact on conclusions*.
2. **Minimal source notes** are created for inaccessible sources (YAML frontmatter with `access: inaccessible`, based on abstract if available), so they appear in the index and are not forgotten.
3. **`access` field in YAML** tracks the access status of every source: full, abstract-only, inaccessible, provided-manually.
4. **Workflow for manual provision** — when a source becomes available later, it can be annotated and integrated without disrupting the existing analysis.
5. **This dedicated discussion section** — not buried in limitations, but explicitly assessed.

## What remains unmitigated

- We cannot assess what we haven't read. Logging a source as inaccessible is better than ignoring it, but it does not replace reading it.
- Abstract-only sources provide some data (population, key findings, conclusions) but miss the detail needed for proper annotation — particularly quotes, nuanced claims, and secondary question data.
- The direction of bias is predictable: paywalled sources are more likely to contain empirical duration data (naturalistic studies, meta-analyses) than freely available sources. This means our weakest evidence layer is likely the one with the most relevant data.

## Honesty standard

Do not write "this limitation is unlikely to affect the overall conclusions" unless you can demonstrate it. If a key naturalistic study on treatment duration was behind a paywall and not read, say:

> "The [study name] was identified as directly relevant to the primary question but could not be accessed. Its absence means that [specific finding or claim] in the synthesis rests on [N] sources rather than [N+1], and the [specific aspect] of that claim is less well-supported than it would otherwise be."

## Questions this section must answer

*To be populated from `todo.md` when unresolved entries exist:*

- How many sources were identified but not accessed?
- Which layers are most affected?
- What types of evidence are most likely missing?
- Could the missing sources plausibly change the conclusions? In what direction?
- Are there specific claims in the synthesis that rest on thin evidence because key sources were inaccessible?

## Feed-back into the plan

- Track the ratio of accessible to inaccessible sources per layer. If Layer 2 has a high inaccessible rate, consider whether the "empirical backbone" claim holds.
- Prioritize obtaining inaccessible sources that would most affect the synthesis — target the highest-impact gaps first.
- If a critical mass of inaccessible sources accumulates in one layer, flag this to the orchestrator as a structural problem that may require institutional access, ILL requests, or scope adjustment.
