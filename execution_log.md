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

### 2026-03-18 Annotation agent: Layer 1a + Layer 3 batch (6 sources)

**Task:** Annotate 6 source stubs: steele-2005-phase-oriented, steele-2001-dependency, links-2015-gpm-bpd, freixo-ferreira-2023-bpd-dropout, yeates-2023-psychodynamic-dd, paris-2020-access-pd.

**Layer/file:** Layer 1a (trauma-clinical) — 5 sources; Layer 3 (counterpoint) — 1 source

**Issues identified:**
- All 6 sources annotated from user-provided key data, not full text retrieval. Page numbers are approximate based on provided data; section references used where pages unavailable.
- Freixo Ferreira 2023 annotated from abstract + Scholar Gateway chunks only (access: inaccessible). Specific dropout rates and effect sizes may be missing.
- Yeates 2023 is fully paywalled — annotated from abstract only. All body sections marked "no data (inaccessible)" except summary and relevance. This is the only source directly at the intersection of psychodynamic therapy and dissociative disorders, making its inaccessibility a significant gap.
- Links 2015 provides the most concrete milestone timeline in the review (6wk/6mo/12mo/18mo), but these are clinical expectations rather than empirically validated benchmarks — the paper does not cite validation studies for the specific timepoints.

**Questions raised:**
- Paris 2020 conflates BPD with our defined population (complex developmental trauma with dissociative features). His evidence base (Howard 1986 dose-effect, McLean longitudinal study, Kopta 1994) was derived from different populations. Should the review explicitly argue that population definition is the crux of the disagreement about duration — that Paris may be right about BPD symptom reduction but wrong about structural dissociation?
- The Steele 2001 dependency argument (secure dependency IS the mechanism of cure) has profound implications for treatment format: if dependency must develop naturally, it cannot be compressed by increasing session frequency. This suggests that elapsed calendar time may be more important than session count for this specific therapeutic mechanism. Does this connect to the Lindfors 2019 convergence finding (PA and LPP converging at 10 years despite 3x dose difference)?
- Links 2015's GPM milestone framework and Paris 2020's stepped-care model both assume that non-response to brief treatment should trigger escalation to longer/more intensive treatment. But neither addresses what happens to the therapeutic relationship during escalation. If the patient must transfer to a new specialist, does this reset the dependency/alliance development process (per Steele 2001)?

**Suggestions:**
- Yeates 2023 should be prioritized for full text acquisition. It is the only source directly reviewing psychodynamic therapy for dissociative disorders.
- The tension between Links 2015 (structured milestones, 18-month framework) and Steele 2005 (spiral trajectory, no timeline) illustrates a fundamental difference in how "progress" is defined. Links measures behavioral/functional milestones; Steele describes structural reorganization. These may not be contradictory — they may describe different layers of change happening simultaneously. Consider creating a synthesis note on "layers of change: symptomatic vs. structural."
- Paris 2020 is the first source in the review to break the access silence. His cost/access arguments ($220/week DBT, waiting list ethics) should be cross-referenced with the "near-total silence on access" pattern identified in previous batches.

**Emerging patterns:**
- **The population-definition problem is now explicit.** Paris 2020 argues against long treatment for PD; Steele 2005/2001 argue for long treatment for complex trauma with structural dissociation. These positions may not contradict each other — they may be about different populations that overlap diagnostically but differ structurally. The key variable may be the degree of structural dissociation, not the diagnostic category (BPD vs. complex PTSD vs. DID).
- **Dependency as developmental time.** Steele 2001's argument that secure dependency develops through relational experience (not through technique) implies that treatment duration is partially determined by developmental biology — attachment formation takes the time it takes, regardless of session frequency or therapeutic skill. This is a qualitatively different argument from "more sessions = more change" (dose-effect) and may explain the Lindfors convergence finding.
- **The escalation gap.** Both Links 2015 and Paris 2020 advocate stepped care, but neither addresses the relational cost of escalation (transferring to a new therapist). Steele 2001 and 2005 suggest this cost could be severe — restarting the dependency process may add years. This is a structural blind spot in the stepped-care model.
- **Access silence is finally broken.** Paris 2020 is the first source (of 20 now annotated) to substantively address cost and access. His arguments are compelling regardless of one's position on treatment duration. The ethical dimension (clinician responsibility to minimize waiting lists) deserves engagement, not dismissal.

### 2026-03-18 Annotation agent: Layer 1a batch (3 sources)

**Task:** Annotate 3 source stubs in `3_results/sources/1-academic/trauma-clinical/`: griffiths-2025-phase-oriented-review, herman-1992-trauma-recovery, vanderhart-2006-haunted-self.

**Layer/file:** Layer 1a — trauma-clinical

**Issues identified:**
- Herman 1992 and Van der Hart 2006 were annotated from secondary sources only (access: abstract-only). Neither primary text was available for direct reading. Annotations are marked as "abstract-only" throughout. Page numbers could not be assigned; exact formulations may differ from what secondary sources report.
- Griffiths 2025 was annotated from user-provided key data (full text access noted in YAML). Quotes are provided with section references (§Discussion, §Results, §Introduction) rather than page numbers, as data was supplied in summary form.
- Updated Griffiths 2025 YAML: corrected `duration_range` from "not yet known" to "7 days to 5 years"; added `dropout` to topics; set `has_dropout_data: yes`; added `session-frequency` and `continuity` to `secondary_qs`.

**Questions raised:**
- Herman 1992 and Van der Hart 2006 are foundational texts that the entire field builds on. Should the primary texts be obtained for direct annotation? The current abstract-only annotations may miss nuances that are important for synthesis — particularly Herman's discussion of the political/social dimensions of trauma recovery, and Van der Hart's detailed discussion of integrative capacity and mental level as determinants of treatment pace.
- All three sources describe phase-based treatment as recursive/nonlinear rather than strictly sequential. This convergence across the foundational text (Herman), the theoretical model (Van der Hart), and the empirical review (Griffiths) is significant. The nonlinearity of the trajectory may deserve its own extraction note, as it fundamentally complicates any attempt to specify "how long" — progress is not monotonic, and apparent regression may indicate deeper processing.
- Griffiths 2025 reports that most participants still had clinically significant symptoms at post-treatment even after multi-year courses. Combined with the "sleeper effect" pattern identified in Layer 2, this raises the question: is end-of-treatment the wrong measurement point for this population? Should the review explicitly argue for follow-up-based evaluation?

**Suggestions:**
- Consider obtaining primary texts of Herman 1992 and Van der Hart 2006 for re-annotation. These are the two most influential sources in the trauma-clinical layer and the current annotations are reconstructed rather than direct.
- The Boyd (1997) data from Griffiths 2025 is uniquely valuable: it provides both session counts AND elapsed time for each phase (5 sessions/17 days for Phase 1; 54 sessions/10 months for Phase 2; 52 sessions/12 months for Phase 3). This is the only source so far that allows direct comparison of dose and duration within phases. Consider highlighting this in the dose-vs-duration cross-cutting analysis.
- The phobia model from Van der Hart (phobia of attachment, of traumatic memories, of normal life) provides a compelling theoretical explanation for the sleeper effect: Phase 3 (overcoming phobia of normal life) may continue to unfold after treatment ends as the patient gradually engages with previously avoided life domains. This could link the Layer 1a theoretical framework to the Layer 2 empirical finding.

**Emerging patterns:**
- **The three foundational sources form a coherent stack.** Herman (1992) provides the phase framework, Van der Hart (2006) provides the mechanism (structural dissociation + phobias), and Griffiths (2025) provides the empirical data. Together they tell a consistent story: complex trauma treatment takes 3–5 years, follows a nonlinear phase trajectory, and typically does not achieve full symptom resolution even at that duration.
- **Recursive nonlinearity is consensus, not exception.** All three sources emphasise that treatment progress is nonlinear — patients cycle between phases, apparent regression accompanies deeper processing, and the trajectory spirals rather than ascending. This is not a complication to the duration question but a core feature of the answer: healing takes years partly because it is recursive.
- **The endpoint problem intensifies.** Herman defines the endpoint structurally (reconnection with life), Van der Hart defines it structurally (personality integration), and Griffiths finds that symptom-based endpoints are typically not reached. These three perspectives converge on a fundamental tension: the theoretical endpoints are ambitious and open-ended, while the empirical endpoints show incomplete symptom resolution. This suggests that the field's duration estimates (3–5 years) may describe a pragmatic treatment course rather than a complete healing trajectory.
- **Access silence continues.** None of the three Layer 1a sources address who can access multi-year specialist treatment. This silence, now consistent across 14 annotated sources (11 Layer 2 + 3 Layer 1a), is a structural gap in the literature rather than an oversight in individual papers.
