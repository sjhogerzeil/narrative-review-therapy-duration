# Inaccessible sources

Sources identified as relevant during the search but not accessed — behind paywalls, unavailable, out of print, or otherwise inaccessible at time of search. **These are not optional nice-to-haves. Each entry represents a gap in the evidence base that may affect the conclusions.**

## How to use this file

1. **During search:** When a source is identified as relevant but cannot be accessed, add it below with full bibliographic detail and a note on *why it matters* — what it likely contains, what gap it would fill, and what the review loses by not including it.
2. **When manually providing sources:** When the source becomes available (e.g., through library access, ILL, or direct provision), move its entry to the `## Resolved` section below, annotate the source normally, and run `./sync.sh`.
3. **In the discussion:** The `4_discussion/9_inaccessible_sources.md` file aggregates the impact of all unresolved entries. Do not downplay the impact. If a key source was inaccessible, say so plainly.

## Format

```markdown
### [author-year-slug]

- **Citation:** [Full APA 7]
- **URL/DOI:** [if known]
- **Barrier:** [paywall | out of print | institutional access only | language | other]
- **Layer:** [which layer this belongs to]
- **Why it matters:** [What this source likely contains. What gap does its absence create? Be specific.]
- **Impact on conclusions:** [How might missing this source affect the review's findings?]
- **Date identified:** [YYYY-MM-DD]
- **Status:** unresolved
```

## Unresolved

### yeates-2023-psychodynamic-dd

- **Citation:** Yeates, G., et al. (2023). A systematic review and narrative analysis of the evidence for individual psychodynamically informed psychotherapy for dissociative disorders. *Journal of Trauma & Dissociation*. https://doi.org/10.1080/15299732.2023.2293802
- **URL/DOI:** https://doi.org/10.1080/15299732.2023.2293802
- **Barrier:** paywall
- **Layer:** 1a-trauma-clinical
- **Why it matters:** Directly addresses our population (dissociative disorders) and modality (psychodynamic) intersection. May contain duration data across reviewed studies.
- **Impact on conclusions:** Gap at the intersection of our core population and modality. Secondary sources may partially cover this ground.
- **Date identified:** 2026-03-18
- **Status:** unresolved

### freixo-ferreira-2023-bpd-dropout

- **Citation:** Freixo Ferreira, L., Guerra, C., & Vieira-Coelho, M. A. (2023). Predictors of psychotherapy dropout in patients with borderline personality disorder: A systematic review. *Clinical Psychology & Psychotherapy*, *30*(6), 1324–1337. https://doi.org/10.1002/cpp.2888
- **URL/DOI:** https://doi.org/10.1002/cpp.2888
- **Barrier:** paywall (annotated from abstract + Scholar Gateway; full text would add dropout rate numbers)
- **Layer:** 1a-trauma-clinical
- **Why it matters:** Systematic review of BPD dropout predictors. Directly addresses treatment-engagement paradox — the people who most need long treatment are most likely to drop out.
- **Impact on conclusions:** Without this, the dropout/survivorship bias discussion relies on less systematic evidence.
- **Date identified:** 2026-03-18
- **Status:** unresolved

### herman-1992-trauma-recovery

- **Citation:** Herman, J. L. (1992). *Trauma and recovery*. Basic Books.
- **URL/DOI:** no URL available
- **Barrier:** book — need to obtain
- **Layer:** 1a-trauma-clinical
- **Why it matters:** Foundational text establishing the three-phase model (safety, remembrance and mourning, reconnection). All subsequent phase-based treatment literature builds on this framework. Essential reference.
- **Impact on conclusions:** Currently relying on secondary descriptions of Herman's model. Full text would provide primary quotes and nuances of the original framework.
- **Date identified:** 2026-03-18
- **Status:** unresolved

### vanderhart-2006-haunted-self

- **Citation:** Van der Hart, O., Nijenhuis, E. R. S., & Steele, K. (2006). *The haunted self: Structural dissociation and the treatment of chronic traumatization*. Norton.
- **URL/DOI:** no URL available
- **Barrier:** book — need to obtain
- **Layer:** 1a-trauma-clinical
- **Why it matters:** Comprehensive theoretical framework for structural dissociation and its treatment. Part III covers treatment in detail. Establishes why complex trauma treatment is necessarily long-term.
- **Impact on conclusions:** Gap in the theoretical foundation for the long-duration argument. Secondary sources partially cover but cannot replace the primary text.
- **Date identified:** 2026-03-18
- **Status:** unresolved

## Resolved

*Sources that were initially inaccessible but later obtained by user (2026-03-18).*

- `leichsenring-2013-emerging-evidence` — provided-manually
- `lindfors-2019-helsinki-10yr` — provided-manually
- `howard-1986-dose-effect` — provided-manually
- `knekt-2021-dropout` — provided-manually
- `koeser-2023-tads-cost` — provided-manually
- `shedler-2010-efficacy` — provided-manually
- `zimmermann-2014-munich-dose` — provided-manually
- `steele-2005-phase-oriented` — provided-manually
- `steele-2001-dependency` — provided-manually
- `links-2015-gpm-bpd` — provided-manually
- `paris-2020-access-pd` — provided-manually (Layer 3)

---

# Media to download and transcribe

Videos, podcasts, and lectures identified during search. Download media, transcribe (Soniox pipeline or Whisper), place transcript in `_media/` dir. See `2_methods/14_agent_instructions.md` § Media sources.

*No entries yet.*

---

# Other tasks

## Brainstorm: tables and figures

After results extraction is underway, brainstorm possible tables and figures for `5_tables_and_figures/`. Starting candidates from `2_methods/11_synthesis_method.md`:

- Cross-layer evidence matrix (which layers contribute to which dimensions)
- Duration estimate table (durations by source, layer, population, endpoint definition)
- Convergence/divergence map (where layers agree/disagree)
- Trajectory typology (visual patterns if they emerge)

Additional ideas to consider during execution:
- *Add here as they arise*
