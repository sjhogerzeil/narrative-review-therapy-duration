# Execution log

Append-only log of meta-commentary from subagents during plan execution. Each agent appends its observations here when completing a task. The orchestrator reviews this log to evaluate the plan and decide if it needs improvement or expansion.

**This file is not part of the final review.** It is an internal process document.

## Format

Each entry follows this structure:

```markdown
### [YYYY-MM-DD HH:MM] Agent: [agent description]

**Task:** [what the agent was asked to do]
**Layer/file:** [which part of the project was affected]

**Issues identified:**
- [problems encountered during execution]

**Questions raised:**
- [questions that emerged from the work that the plan doesn't answer]

**Suggestions:**
- [improvements to the plan, new sources discovered, new dimensions noticed]

**Emerging patterns:**
- [patterns noticed across sources that don't fit existing dimensions]

**Inaccessible sources:**
- [any sources that couldn't be accessed — also add to todo.md]
```

## What the orchestrator looks for

After each execution batch, the orchestrator reviews this log for:

1. **Recurring problems** — if multiple agents hit the same issue, the plan has a structural gap
2. **New questions** — questions that multiple agents raise independently suggest a missing secondary question or dimension
3. **Emerging constructs** — patterns that don't fit the predefined dimensions (CIS synthetic constructs)
4. **Plan drift** — signs that the search is going off-track or that stopping rules need adjustment
5. **Inaccessible sources** — accumulating paywalled sources that may create systematic gaps

The orchestrator may then:
- Add new secondary questions (via re-run protocol)
- Adjust source budgets or stopping rules
- Create new extraction files for emergent constructs
- Flag issues for human review

## Log entries

### 2026-03-18 Annotation agent: Layer 2 batch (4 sources)

**Task:** Annotate 4 source stubs in `3_results/sources/2-naturalistic-studies/`: howard-1986-dose-effect, knekt-2021-dropout, zimmermann-2014-munich-dose, fonagy-2015-tads.

**Layer/file:** Layer 2 — naturalistic studies

**Issues identified:**
- All 4 sources were annotated from provided key data (user-supplied summaries of findings) rather than from full text reading. This means page numbers could not be assigned — section references (§Results, §Discussion, §Methods) are used instead. Verbatim quotes are limited to what was provided.
- Knekt 2021 and Zimmermann 2014 have `access: provided-manually` but the actual full text was not retrieved by the agent. Annotations are thorough based on the data provided but may miss secondary findings that only appear in the full text.
- Fonagy 2015 has `access: full` in the YAML but the annotation was based on user-provided data rather than a full text retrieval. The full text should be retrieved to fill in specific page numbers and verify dropout data.

**Questions raised:**
- Howard et al. (1986) developed the dose-effect model for predominantly neurotic populations. How directly applicable is this model to complex developmental trauma? The diagnostic gradient (depressives fastest, borderline-psychotic slowest) hints at an answer, but the "borderline-psychotic" category is not the same as complex PTSD/developmental trauma. Should we note this extrapolation gap more explicitly in the synthesis?
- The Fonagy TADS finding (delayed therapeutic effect visible only at follow-up) and the Zimmermann MPS finding (technique mediates follow-up but not post-treatment differences) appear to describe the same phenomenon from different angles. Is "delayed therapeutic effect" / "sleeper effect" an emerging construct that deserves its own extraction file?
- Knekt 2021 shows that patients most likely to need long-term therapy (poor reflective ability, poor self-concept) are also most likely to refuse or drop out of it. This is a fundamental paradox for the duration literature. Does this deserve a cross-cutting observation category beyond "survivorship bias"?

**Suggestions:**
- Consider creating a cross-reference note linking Fonagy 2015 and Zimmermann 2014 on the "delayed effect" theme — these are the two strongest pieces of evidence that therapeutic change continues after treatment ends.
- The inverse dropout pattern in Knekt (good suitability → dropout from short-term; poor suitability → dropout from long-term) could be a key finding for the "how long" question: it suggests that treatment format and patient capacity interact to determine effective dose, not just diagnosis.
- Howard 1986's 85% ceiling at 52 sessions raises the question of the "unreachable 15%" — this connects to the treatment-resistant population in Fonagy 2015 and may be worth tracking as a theme.

**Emerging patterns:**
- **Dose is necessary but not sufficient.** Howard shows dose matters; Zimmermann shows technique matters independently; Fonagy shows that time-after-treatment matters. These three findings together suggest a more complex model than simple dose-effect: dose × technique × elapsed time.
- **The treatment-engagement paradox.** Knekt shows that the patients who need the most treatment are the least able to engage with it. This creates a systematic bias in all duration studies — outcomes reflect the people who stayed, not the people who needed to stay.
- **Follow-up as the real outcome window.** Both Zimmermann and Fonagy find that the most important differences emerge during follow-up, not during treatment. This challenges the standard practice of evaluating therapy at end-of-treatment and suggests that our review should pay special attention to studies with extended follow-up periods.

### 2026-03-18 Annotation agent: Layer 2 batch 2 (7 sources)

**Task:** Annotate 7 source stubs in `3_results/sources/2-naturalistic-studies/`: shedler-2010-efficacy, leichsenring-2013-emerging-evidence, lindfors-2019-helsinki-10yr, koeser-2023-tads-cost, leichsenring-2011-ltpp-meta, krakau-2023-melas-protocol, brand-2019-topdd.

**Layer/file:** Layer 2 — naturalistic studies

**Issues identified:**
- All 7 sources annotated from user-provided key data rather than full text retrieval. Page numbers are included where provided; section references (§Methods, §Results, §Discussion) used elsewhere. Verbatim quotes are limited to those supplied in the briefing.
- Krakau 2023 is a protocol paper with no results — annotated for its methodological framing and question-defining value only.
- Brand 2019 is the only source directly addressing our target population (dissociative disorders / complex developmental trauma), but it is a psychoeducational add-on study with no control group — limiting its evidentiary weight.
- Leichsenring 2011 and Leichsenring 2013 overlap substantially (same first author, same LTPP definition, partially overlapping studies). The 2013 paper adds dose-effect data from Perry et al. and Kopta et al. that are not in the 2011 paper.

**Questions raised:**
- The Helsinki study (Lindfors 2019) convergence finding — 646 sessions producing similar 10-year outcomes to 232 sessions — is potentially the most important single finding for the dose-vs-duration question. But the PA group was self-selected (not randomized) and small (n=41). How heavily should this convergence be weighted in synthesis? Should it be presented as definitive or as hypothesis-generating?
- The Perry et al. dose-effect data (50% recovery at 1.3 years/92 sessions; 75% at 2.2 years/216 sessions) are cited secondarily through Leichsenring 2013. Should Perry 1999 be added as a primary source?
- Koeser 2023 raises the question of whether the NICE QALY framework is appropriate for evaluating long-term therapy. The £33K/QALY ICER exceeds the £20K threshold, but the authors themselves say the time horizon was too short. Should the review explicitly critique the QALY methodology as structurally biased against long-term interventions?
- Brand 2019's finding that higher-severity patients improve more contradicts the dose-effect literature's implication that more complex = more sessions needed. Is this a genuine contradiction, or does it reflect different populations (dissociative disorders vs. personality disorders)?

**Suggestions:**
- Perry et al. (1999) should be considered for addition as a primary source, given that the 50%/1.3yr and 75%/2.2yr figures are among the most concrete answers to the primary research question.
- The Shedler "sleeper effect" (effect sizes growing at follow-up) now connects to Fonagy 2015, Zimmermann 2014, AND Lindfors 2019 (PA showing post-treatment acceleration). This is becoming one of the strongest cross-source patterns and may deserve a dedicated extraction note.
- The access/cost dimension is strikingly absent from most sources. Only Koeser 2023 directly addresses cost, and Lindfors 2019 implicitly addresses access (Finnish public funding). Consider whether an access-focused source should be sought for later layers.

**Emerging patterns:**
- **The sleeper effect is now confirmed across 4 sources.** Shedler 2010 (meta-analytic), Fonagy 2015 (TADS RCT), Zimmermann 2014 (MPS), and Lindfors 2019 (Helsinki PA group) all show continued or accelerated improvement after treatment ends. This is no longer a single-study finding — it is a robust pattern. It fundamentally changes the "how long" question: treatment duration plus post-treatment elapsed time together constitute the healing window.
- **Convergence at long follow-up.** The Helsinki study shows PA and LPP converging at 10 years despite a 3x dose difference. If confirmed by MeLAS (Krakau 2023), this would suggest that for personality-level change, calendar time matters more than session count — therapy accelerates natural developmental processes but does not fundamentally alter the timeline.
- **The cost-effectiveness trap.** Koeser 2023 reveals a structural problem: QALY-based cost-effectiveness analyses have time horizons too short to capture the full benefit of long-term therapy. If the sleeper effect is real, then all short-horizon cost-effectiveness analyses systematically undervalue long-term treatment. This is not just a measurement problem — it actively shapes policy and access.
- **Severity as accelerator, not barrier.** Brand 2019's finding that higher dissociation predicted greater improvement challenges the assumption that the most complex patients need the longest treatment. This could reflect a ceiling effect (more room to improve), but it may also indicate that severe dissociative patients are highly responsive once appropriate treatment is provided. This pattern warrants tracking across other population-specific sources.
- **Near-total silence on access.** Of 11 Layer 2 sources annotated so far, only Koeser 2023 directly addresses cost, and only Lindfors 2019 (implicitly) addresses healthcare system context. The literature is focused on efficacy and has remarkably little to say about who can actually access these treatments. This silence is itself a finding.
