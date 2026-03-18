---
section: limitations
description: "Methodological limitations — non-systematic search, heterogeneous evidence, single-author, definitional breadth, cultural bias. For each: the weakness, how we mitigated it, what remains, and how it feeds back."
status: scaffold
---

# Methodological limitations

Each limitation follows the same structure: the weakness, how we mitigated it in the design, what remains unmitigated, and how it feeds back into the plan. Limitations that have their own dedicated discussion sections (survivorship bias, dose vs. time, therapy vs. life, inaccessible sources) are summarized here and cross-referenced.

## 1. Not a systematic review

**The weakness:** The search is structured (iterative snowball, per-layer source budgets, documented search terms) but not exhaustive. It is not replicable in the PRISMA sense — another reviewer using the same search terms would likely end up with a different source set, because the snowball process is path-dependent.

**How we mitigated it:**
- CIS methodology explicitly rejects exhaustive screening in favour of iterative, question-driven search (Dixon-Woods et al., 2006)
- Search terms, key authors, and databases are documented per layer in `2_methods/3–8`
- The iterative protocol is documented with extension logging and plan updates marked `[added YYYY-MM-DD]`
- Search results summaries (identified, screened, included, excluded, inaccessible) are tracked per layer in the READMEs
- Saturation notes document why searching stopped

**What remains unmitigated:** A systematic search might have found sources that the snowball process missed. The path-dependency means that early source choices shape later ones — an early miss could cascade. The review cannot claim comprehensiveness.

**Feed-back:** If the execution log reveals that late-found sources are changing the picture significantly, this suggests the snowball process is not converging and the source budgets may need expansion.

## 2. Heterogeneous evidence — no formal weighting

**The weakness:** The review combines peer-reviewed meta-analyses, psychoanalytic theory, blog posts, Reddit threads, and memoirs. There is no formal method for weighting one type of evidence against another. A practitioner's essay and a 10-year naturalistic study might both appear in the synthesis, but they have radically different epistemic status.

**How we mitigated it:**
- Quality notes in each source annotation assess methodological strengths and limitations narratively
- The synthesis method (`2_methods/11_synthesis_method.md` § Quality weighting) describes context-dependent weighting: naturalistic studies carry more weight on duration claims; memoirs carry more weight on trajectory shape; practitioner essays carry weight on clinical wisdom
- Cross-layer triangulation explicitly identifies convergence and divergence — a finding supported by multiple layers is stronger than one supported by a single layer

**What remains unmitigated:** The weighting is informal and author-dependent. Another reviewer might weight the same evidence differently. There is no inter-rater check on quality assessment.

**Feed-back:** If the synthesis finds that key claims rest on only one type of evidence (e.g., duration claims supported only by practitioner essays, not by empirical data), flag this as a vulnerability and target additional empirical sources.

## 3. Single-author review

**The weakness:** All source selection, annotation, data extraction, and synthesis is performed by a single author. There is no inter-rater reliability for any step. The author's theoretical orientation, clinical experience, and personal relationship to the topic shape every interpretive decision.

**How we mitigated it:**
- The counterpoint layer (Layer 3) is a structural check against confirmation bias
- Cross-cutting observations force engagement with methodological weaknesses in the evidence
- The surprises file (`3_results/primary/5_surprises.md`) actively records disconfirming evidence
- The audit trail makes every interpretive step traceable from discussion claim to source quote
- The execution log captures meta-commentary from execution agents, providing a partial external perspective
- The reflexivity section in `2_methods/11_synthesis_method.md` requires the author to declare positionality

**What remains unmitigated:** Structural safeguards reduce but cannot eliminate single-author bias. There is no independent verification of annotation accuracy or interpretation. A peer review of a sample of annotations would strengthen validity but has not been planned.

**Feed-back:** Consider asking a colleague with a different theoretical orientation to review (a) a sample of 5–10 source annotations for extraction accuracy, and (b) the synthesis for interpretive leaps. Document any such review in the appendix.

## 4. Definitional breadth — "healing" is deliberately broad

**The weakness:** The working definition of healing — *the capacity to live with agency, relational openness, and tolerable selfhood, rather than organized around survival* — is broad by design. This means different sources may be talking about different endpoints, and the reported durations are only comparable to the extent that the definitions align.

**How we mitigated it:**
- Primary synthesis dimension 4 (definition of healing) explicitly tracks how each source defines the endpoint
- The extraction file `3_results/primary/4_healing_definitions.md` aggregates definitions across sources with their implied durations
- The introduction (`1_introduction/3_healing_definition.md`) frames this as a finding, not just a limitation: the contested definition is part of the problem the review investigates

**What remains unmitigated:** Duration estimates from sources using different definitions cannot be directly compared. A 3-year duration for "symptom reduction" and a 10-year duration for "structural change" are not contradictory — they measure different things. If the review conflates them, it is misleading.

**Feed-back:** The synthesis must explicitly separate duration estimates by level of change (symptom reduction, functional improvement, structural change). If most sources only measure symptom reduction, the review's claims about structural change duration rest on thin evidence — state this plainly.

## 5. English-language and Western bias

**The weakness:** The search strategy, databases, and source types are all rooted in English-language, Western psychotherapeutic traditions. Non-Western healing traditions, community-based approaches, and cultures with different models of trauma and recovery are absent.

**How we mitigated it:** Barely. The limitation is acknowledged but not addressed in the search design. The access/justice discussion (§6) touches on this. The humanistic-existential sublayer (1c) is the closest to a non-medical model but is still Western.

**What remains unmitigated:** The review's conclusions apply to Western, individual psychotherapy for complex developmental trauma. They may not generalize to other cultural contexts, other delivery models, or people who heal outside the Western therapeutic frame. This is a genuine boundary on the review's claims.

**Feed-back:** A future iteration could add a dedicated sublayer or cross-cutting search for non-Western and community-based approaches. This would be a significant scope expansion and should be considered as a targeted re-run if early findings suggest cultural context is a major moderator.

## 6. Cross-cutting limitations (with dedicated sections)

These are summarized here and developed in their own files:

- **Survivorship bias** → `4_discussion/2_survivorship_bias.md` — all layers select for people who stayed long enough to report
- **Dose vs. elapsed time** → `4_discussion/3_dose_vs_elapsed_time.md` — conflation of session count and calendar years
- **Therapy vs. life** → `4_discussion/4_therapy_vs_life.md` — attribution of change to therapy vs. non-therapeutic factors
- **Inaccessible sources** → `4_discussion/9_inaccessible_sources.md` — paywalled sources creating systematic gaps in the evidence base
