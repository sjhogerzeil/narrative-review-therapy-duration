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

### 2026-03-18 Annotation agent: Layer 1b batch (6 sources — psychoanalytic)

**Task:** Annotate 6 source stubs in `3_results/sources/1-academic/psychoanalytic/`: bateman-fonagy-2008-mbt-8yr, kohut-1984-how-analysis-cures, winnicott-1965-maturational, bromberg-1998-standing-spaces, benjamin-1988-bonds-of-love, fonagy-2002-affect-regulation.

**Layer/file:** Layer 1b — psychoanalytic

**Issues identified:**
- Bateman & Fonagy (2008) was annotated from full text PDF. All page numbers verified against source. This is the only empirical study in the batch; the other 5 are theoretical/clinical books annotated from secondary sources and training knowledge.
- The 5 book annotations (Kohut, Winnicott, Bromberg, Benjamin, Fonagy 2002) are all marked "annotated from secondary sources — not primary text." Exact page numbers could not be assigned. Some formulations attributed to these authors may reflect their broader body of work rather than the specific texts cited (e.g., Benjamin's "doer/done-to" concept was developed more fully in her 2018 book than in the 1988 text; Winnicott's "survival of destruction" comes from a 1969 paper, not strictly the 1965 collection).
- Updated YAML for bateman-fonagy-2008: added `continuity` and `therapy-plus` to `secondary_qs`; set `has_dropout_data: yes` (one TAU suicide, plus differential treatment provision data).

**Questions raised:**
- All 5 psychoanalytic theorists describe mechanisms that are inherently temporal — transmuting internalization (Kohut), regression to dependence (Winnicott), self-state expansion (Bromberg), cycles of destruction and survival (Benjamin), marked mirroring (Fonagy). These are not five different arguments for long therapy — they are five descriptions of the same underlying process: developmental capacity-building through repeated relational experience. Should the synthesis explicitly argue that these converge on a single mechanism ("relational developmental process") rather than treating them as separate arguments?
- Bateman & Fonagy (2008) finding that TAU group deteriorated despite receiving MORE services is one of the most striking findings in the review. The authors suggest that quantity of treatment "may not be a good indicator of improvement and may even prevent patients from taking advantage of felicitous social and interpersonal events" (p. 636). This resonates with Paris (2020) from a completely different angle — Paris argues for less treatment to free up resources; Bateman & Fonagy provide evidence that more treatment without a coherent developmental model actually produces worse outcomes. Should this convergence be highlighted?
- The population question remains: all 5 psychoanalytic theorists write about populations adjacent to but not identical with our target (complex developmental trauma with dissociative features). Kohut: narcissistic/self disorders. Winnicott: early environmental failure / psychotic-type disorders. Bromberg: trauma and dissociation (closest match). Benjamin: general relational dynamics. Fonagy: BPD/developmental psychopathology. The overlap is substantial but the diagnostic categories are different. How explicitly should the review address this mapping problem?

**Suggestions:**
- Consider creating a synthesis note on "developmental mechanisms of change" that maps the convergence across Kohut (transmuting internalization), Winnicott (regression + resumption of maturation), Bromberg (self-state expansion), Benjamin (repeated destruction-survival), and Fonagy (marked mirroring → mentalizing capacity). These all describe: (1) repeated relational cycles, (2) gradual structural change, (3) internalization of external provision, (4) inherently temporal processes that cannot be compressed. The convergence across independent theoretical traditions strengthens the argument substantially.
- The Bateman & Fonagy (2008) finding that MBT gains continued growing 5 years after treatment ended should be cross-referenced with the sleeper effect pattern from Layer 2 (Shedler, Fonagy 2015, Zimmermann, Lindfors). Bateman & Fonagy 2008 is now the sixth source confirming this pattern, and the only one from Layer 1b.
- The "borrowed vs. owned structure" concept (Kohut) could be a powerful organizing idea for the review: it provides a theoretical framework for why brief therapy can produce improvement that doesn't last (borrowed structure) while longer therapy produces improvement that continues growing (owned structure / sleeper effect).

**Emerging patterns:**
- **Five mechanisms, one process.** The five psychoanalytic theorists describe different facets of what appears to be a single developmental process: the gradual building of internal psychological structure through repeated cycles of relational experience (attunement-disruption-repair, destruction-survival, mirroring-internalization). The convergence across independent theoretical traditions (self psychology, object relations, relational psychoanalysis, intersubjectivity, mentalization theory) is striking and strengthens the argument that extended treatment duration is not a preference but a structural requirement of the change process.
- **Dose matters differently here.** Layer 2 sources debate dose-effect relationships (more sessions = more change). The Layer 1b psychoanalytic sources reframe this: what matters is not the number of sessions but the number of completed relational cycles (attunement-failure-repair). A session in which a relational cycle is completed may be worth more than ten sessions of surface-level work. This suggests that the dose-effect model, while empirically valid, may describe the wrong unit of measurement — the relevant "dose" is completed relational cycles, not session hours.
- **The TAU deterioration finding.** Bateman & Fonagy (2008) shows that TAU patients received MORE services but WORSE outcomes. Combined with the theoretical models (Kohut, Winnicott, Bromberg, Benjamin, Fonagy), this suggests that treatment without a coherent developmental model may not just be ineffective — it may actively interfere with natural recovery processes. This is a stronger claim than "long therapy is better" — it is "incoherent treatment is harmful."
- **Access silence now extends to 20 sources.** Adding 6 Layer 1b sources, none of which address access, brings the total to approximately 20 annotated sources with near-total silence on who can access the treatments described. Bateman & Fonagy 2008 was conducted in the NHS, and Fonagy's MBT model was developed for public healthcare, but the paper itself does not discuss access. The psychoanalytic theoretical tradition (Kohut, Winnicott especially) describes treatments that are among the most resource-intensive and inaccessible in the field.

### 2026-03-18 Annotation agent: Layer 1d batch (7 sources — neuroscience)

**Task:** Annotate 7 source stubs in `3_results/sources/1-academic/neuroscience/`: schore-2000-right-brain, schore-2021-intersubjectivity, porges-2022-polyvagal, hambrick-perry-2019-nmt, samson-teicher-2023-maltreatment, lanius-2011-neurobiology-cptsd, bcpsg-2010-change-psychotherapy.

**Layer/file:** Layer 1d — neuroscience

**Issues identified:**
- Schore 2000 was annotated from full text PDF (20 pages read). All page numbers verified.
- Schore 2021 was annotated from WebFetch of PMC full text (PMC8093784). Section references used rather than page numbers (web format).
- Porges 2022 was annotated from WebFetch of PMC full text (PMC9131189). Section references used.
- Hambrick/Perry 2019 was annotated from WebFetch of PMC full text (PMC6691036). Section references used.
- Samson/Teicher 2023 could NOT be retrieved: DOI redirected to Wiley paywall, WebFetch was denied, PubMed MCP session was terminated. Annotated from abstract + Teicher group's published body of work. Marked `access: abstract-only`. Key claims should be verified against full text.
- Lanius 2011 PDF was NOT found in `_fulltext/` directory (file does not exist despite being listed in YAML as `provided-manually`). PubMed MCP was also unavailable. Annotated from abstract + Lanius group's published body of work. Marked `access: abstract-only`. Full text should be obtained.
- BCPSG 2010 is a book with no PDF available. Annotated from secondary sources (Stern et al. 1998, BCPSG 2002, BCPSG 2007, Lyons-Ruth 1998). Marked `access: abstract-only`.

**Questions raised:**
- All 7 neuroscience sources explain WHY change is slow (mechanism) but none provide data on HOW LONG treatment takes. This is the defining characteristic of Layer 1d: it provides theoretical scaffolding for the duration argument but zero empirical evidence for specific treatment durations. Should the synthesis explicitly acknowledge this layer's role as "explanation, not evidence"?
- The 7 sources describe at least 5 distinct levels at which change is slow: (1) autonomic reorganisation (Porges — neuroception must shift from defense to safety); (2) right-brain regulatory structure (Schore 2000 — orbitofrontal experience-dependent maturation); (3) right-brain-to-right-brain synchronisation (Schore 2021 — implicit attunement must accumulate); (4) developmental-sequential reorganisation (Hambrick/Perry — bottom-up, layer by layer); (5) implicit relational knowing (BCPSG — procedural memory restructuring through moments of meeting). Are these 5 descriptions of one process or 5 independent reasons why change is slow? If the latter, the duration implications are multiplicative, not additive.
- The two "resistance" sources (Samson/Teicher, Lanius) add a further dimension: not just "change is slow" but "standard treatments fail." This is a qualitatively different argument — it suggests that the problem is not just duration but treatment design. For the thesis, this strengthens the case that complex trauma requires not just longer treatment but differently structured treatment.

**Suggestions:**
- Obtain full text for Samson/Teicher 2023 and Lanius 2011. Both are key sources with annotations currently limited to abstracts and secondary sources.
- The Lanius PDF should be located or re-downloaded — the YAML indicates `access: provided-manually` but the file does not exist in `_fulltext/`. Updated access field to `abstract-only`.
- Consider creating a synthesis note mapping the 5 levels of slow change (autonomic → regulatory structure → implicit attunement → developmental sequence → procedural memory) and whether they operate sequentially, in parallel, or as nested levels of the same process. This mapping would strengthen the neuroscience layer's contribution to the thesis.
- The BCPSG's "moments of meeting" concept connects directly to the Layer 1b psychoanalytic mechanisms (Kohut's transmuting internalization, Winnicott's destruction-survival, Bromberg's self-state expansion). Consider cross-referencing in the synthesis: BCPSG provides the process-theory bridge between Layer 1b (psychoanalytic mechanism) and Layer 1d (neuroscience mechanism).

**Emerging patterns:**
- **Five levels, one conclusion.** The 7 neuroscience sources describe change as slow at 5 distinct levels (autonomic, structural-neural, intersubjective-implicit, developmental-sequential, procedural-memory). Whether these are independent mechanisms or nested descriptions of one process, the conclusion is the same: change in complex trauma operates at biological levels that cannot be compressed by cognitive effort, therapeutic technique, or increased session frequency. The biology sets the pace.
- **Mechanism without timeline.** Layer 1d provides zero empirical data on treatment duration. Every source explains WHY change is slow; none specify HOW LONG it takes. This is a principled limitation: neuroscience can explain mechanism but cannot (yet) predict individual treatment timelines from brain measures. The layer provides the theoretical foundation for the duration argument but must be paired with Layer 2 (empirical data) to answer the primary research question.
- **The ecophenotype challenge.** Samson/Teicher's concept — that maltreatment-related psychiatric presentations are biologically distinct from non-maltreatment presentations — has profound implications. If the population our review focuses on is neurobiologically different from the populations on which standard treatments were validated, then the entire evidence base for "how long therapy takes" may be built on the wrong population. This connects to the population-definition problem identified in Layer 1a/Layer 3 annotations.
- **Implicit > explicit.** Multiple sources (Schore 2021, BCPSG, Porges) converge on the claim that therapeutic change operates primarily through implicit/procedural/autonomic channels — beneath and prior to conscious awareness. This implies that insight-oriented therapies may be addressing the wrong level, and that the relevant therapeutic "dose" is not interpretations delivered but implicit relational experiences accumulated. This reframes the dose-effect question fundamentally.
- **Access silence continues across all layers.** None of the 7 neuroscience sources address access, cost, or who can benefit from the treatments implied by their frameworks. This is now consistent across approximately 27 annotated sources. The silence is structural: the neuroscience literature describes mechanisms of change without engaging with the social conditions that determine who can access change-producing treatment.

---

### 2026-03-18 Annotation agent: Layer 4 batch (10 sources — practitioner essays)

**Task:** Annotate 10 source stubs in `3_results/sources/4-practitioner/`: alpern-2025-truth-complex-trauma, shedler-2020-tyranny-of-time, wylie-long-shadow-trauma, psychnetworker-evolving-beyond, grossmark-psychoanalytic-companioning, mia-injured-not-broken, mia-psychoanalytic-beats-cbt, substack-traumalescence, blueknot-trauma-practice, psychnetworker-transcending-trauma.

**Layer/file:** Layer 4 — practitioner essays

**Sources annotated:**
1. **alpern-2025-truth-complex-trauma** — Pria Alpern PhD, EMDR/SE specialist. Three-phase model; "cannot be resolved in six sessions of anything." Access updated: inaccessible -> full.
2. **shedler-2020-tyranny-of-time** — Shedler & Gnaulati. Consumer Reports (N=4,000+), Lambert OQ-45 (N=10,000+), Westen survey (N=270). 50% change at 21 sessions, 75% at 40+. Access updated: inaccessible -> full.
3. **wylie-long-shadow-trauma** — Mary Sykes Wylie. Van der Kolk's DTD campaign. No duration data; frames WHY different treatment needed. Access updated: inaccessible -> full.
4. **psychnetworker-evolving-beyond** — Katherine Woodward Thomas. Backward-looking (processing) -> forward-looking (transformation). No duration data. Access updated: inaccessible -> full. Author updated.
5. **grossmark-psychoanalytic-companioning** — Robert Grossmark. "Companioning" dissociated patients; inherently incompatible with time-limited work. Access updated: inaccessible -> full.
6. **mia-injured-not-broken** — Brickel & Associates / Mad in America. CPTSD recognition; "hard to untangle trauma from identity." No duration data. Access updated: inaccessible -> full. Author updated.
7. **mia-psychoanalytic-beats-cbt** — Mad in America summary of Krakau study. PAT median 242 sessions vs CBT 59; PAT superior at 5-year follow-up. Access updated: inaccessible -> full.
8. **substack-traumalescence** — Lauren Auer LCPC. Explicit timeline: 3-6mo awareness, 6-18mo neural strengthening, 18mo-3yr integration. Access updated: inaccessible -> full. Author and duration_data updated.
9. **blueknot-trauma-practice** — Blue Knot Foundation. "May last for decades, whether continuously or episodically." Minimum 10-20 sessions. 84% expert consensus on phase model. Access updated: inaccessible -> full.
10. **psychnetworker-transcending-trauma** — Lisa Ferentz LCSW-C. 7-year case (Judy), multi-year case (Marisa). PTG focus. Somatic + creative adjuncts. Access updated: inaccessible -> full. Author updated.

**Issues identified:**
- All 10 sources annotated from user-provided key data, not from direct full text retrieval. Quotes and claims are based on data provided in the task briefing. Page numbers could not be assigned for any source (all are web articles/blogs without page numbers).
- mia-psychoanalytic-beats-cbt appears to summarise results from a study related to but possibly distinct from the Krakau 2023 MeLAS protocol paper already in Layer 2. The relationship between these should be verified.
- psychnetworker-evolving-beyond is the weakest source in the batch — more self-help/coaching than clinical. Woodward Thomas is primarily known as a relationship coach, not a clinical practitioner. May be a candidate for removal if space is limited.

**Questions raised:**
- The practitioner layer is overwhelmingly supportive of the thesis (all 10 sources support extended treatment). Is there a publication bias issue — do practitioners who favour brief therapy simply not write practitioner essays about it? Should a counterpoint practitioner voice be sought?
- Blue Knot's "decades" claim and the "on and off over their lifetime" model raise the question of what "treatment duration" even means for this population. If treatment is episodic over a lifetime, how do you answer "how long does it take?"
- The Auer "traumalescence" timeline (3mo-3yr) describes a transition phase WITHIN recovery. What precedes and follows it? The total arc may be substantially longer than 3 years.

**Suggestions:**
- The mia-psychoanalytic-beats-cbt source and the krakau-2023-melas-protocol source should be cross-referenced and their relationship clarified.
- Consider whether psychnetworker-evolving-beyond adds enough value to justify inclusion. Its contribution is better articulated with clinical specificity by Ferentz and Joseph (2012).
- The Blue Knot Foundation source should be cross-referenced with the ISTSS Expert Consensus Guidelines (Cloitre et al., 2011) that it appears to draw on.

**Emerging patterns:**
- **Practitioner consensus on extended duration is unanimous.** All 10 Layer 4 sources support extended treatment. Duration estimates range from "more than 6 sessions" (Alpern) to "decades" (Blue Knot), with concrete data at 6 months (Lambert 50%), 1 year (Lambert 75%), 3 years (Auer integration), 7 years (Ferentz/Judy), and lifetime episodic (Blue Knot).
- **The practitioner layer adds the identity dimension.** Multiple sources (Alpern, MIA/injured-not-broken, Auer, Woodward Thomas) frame complex trauma healing as identity restructuring. "Hypervigilance becomes personality" (Alpern), "hard to untangle trauma from identity" (MIA), "shift their identity" (Auer). This connects to Layer 1b psychoanalytic mechanisms (structural change through relational experience).
- **Elapsed time > session count in the practitioner layer.** Auer's timeline is in calendar months. Blue Knot distinguishes "continuously or episodically." Ferentz reports years. Practitioners consistently frame duration in elapsed calendar time rather than session count — aligning with Lindfors 2019 convergence and neuroscience layer arguments.
- **The sleeper effect gets practitioner confirmation.** MIA/Krakau (PAT advantage at 5-year follow-up) and Auer (integration at 18mo-3yr) describe the sleeper effect from practitioner and client perspectives. Now confirmed across academic, empirical, and practitioner layers.
- **Access silence persists.** Of 10 practitioner sources, only Shedler (managed-care critique) and Blue Knot (episodic model) substantively address access. When practitioners describe 7-year treatments or "decades" of engagement, the question of who can afford this goes mostly unasked.

---

### 2026-03-18 Annotation agent: Layer 1c batch (5 sources — humanistic-existential)

**Task:** Annotated 5 source stubs in `3_results/sources/1-academic/humanistic-existential/`: murphy-2009-pct-abuse, joseph-2012-ptg-model, hauser-2022-fragile-process, murphy-2019-pct-eft-trauma, sohal-2022-pct-suicidal.

**Layer/file:** Layer 1c — humanistic-existential

**Sources annotated:**
1. **murphy-2009-pct-abuse** — 160 sessions / ~5 years of non-directive PCT with severe institutional childhood abuse. Richly detailed single case. Full PDF read.
2. **joseph-2012-ptg-model** — Theoretical: organismic valuing theory, curvilinear stress-growth relationship, post-traumatic stress as engine of growth. Full PDF read.
3. **hauser-2022-fragile-process** — Warner's fragile process concept applied to psychodynamic work. Case study of Finella (48 sessions, forced termination by agency). Full PDF read (16 pages).
4. **murphy-2019-pct-eft-trauma** — Four principles for trauma-focused PCT/EFT. Acknowledges RCT evidence gap. Early termination problem. Full PDF read (11 pages).
5. **sohal-2022-pct-suicidal** — N=56, minimum 15 sessions for significant change. **Incomplete annotation** — Wiley paywall blocked access. Key data from user briefing only. Should be re-annotated when full text is available.

**Issues identified:**
- Sohal (2022) annotation is incomplete — no page numbers, no exact quotes, limited detail on methods and results. Marked with caveat in Quality notes. Full text needed.
- All five sources come from the same research network: Murphy is author or co-author on four of the five; Joseph is co-author with Murphy on one; Hauser cites Warner (Murphy's intellectual lineage). This is a coherent research programme, not independent replication. The Layer 1c evidence base for PCT/EFT with trauma is essentially one research group.
- Updated murphy-2009 YAML: corrected `duration_range` from "160 sessions" to "160 sessions over ~5 years"; added `frequency` to `secondary_qs`; added `institutional-abuse` and `non-directive` to topics.
- Updated hauser-2022 YAML: corrected `duration_range` from "implies extended treatment" to "48 sessions (case study, ended due to agency constraints, not completion)"; added `has_access_context: yes`; added `phase-structure` to `secondary_qs`.
- Updated murphy-2019 YAML: set `has_dropout_data: yes` (Cloitre et al. 2010 dropout finding); set `has_access_context: yes` (third-sector vs. statutory discussion); changed `endpoint_definition` from `not-defined` to `mixed`.

**Questions raised:**
- The entire Layer 1c evidence base for PCT with complex trauma rests on Murphy's research programme at Nottingham/CTRG. Is there PCT trauma research from other groups that should be sought? The evidence gap Murphy (2019) acknowledges is real — there are essentially no RCTs of PCT for complex trauma.
- Hauser's case ended at 48 sessions due to agency constraints. Murphy's (2009) case lasted 160 sessions at a charity offering open-ended therapy. This contrast directly illustrates the access question: how long you get depends on where you are seen, not on what you need.
- Sohal's 15-session minimum for significant change vs. IAPT's 6-8 session model: should this be cross-referenced with the Layer 2 dose-response data? The mismatch between minimum therapeutic dose and maximum service provision is a structural finding.

**Emerging patterns:**
- **The endpoint divergence deepens.** Layer 1a defines endpoints structurally (integration, reconnection). Layer 1c defines them even more ambitiously: Murphy (2009) defines success as growth, meaning, and quality of life improvement — explicitly not symptom elimination. Joseph (2012) defines the endpoint as increased PWB (autonomy, mastery, positive relations, growth, purpose, self-acceptance). These are the most open-ended endpoint definitions in the review. If these are the goals, "how long does healing take?" becomes almost unanswerable in fixed terms.
- **The pace problem is theorised.** Joseph (2012) provides the theoretical mechanism: growth cannot be rushed because moderate stress drives processing but excessive stress overwhelms it (curvilinear model). Hauser (2022) provides the clinical mechanism: fragile process clients cannot tolerate interpretation, the first 15 sessions are just "becoming aware," and the process is circular. Murphy (2009) provides the empirical illustration: 160 sessions, with accurate symbolisation of core trauma not occurring until session 68. Together these converge on a single message: the pace of healing is set by the client's processing capacity, not by the therapist's ambition or the service's budget.
- **Access breaks the silence — partially.** Unlike Layer 1a, several Layer 1c sources address access. Murphy (2019) notes PCT therapists work outside statutory healthcare in third-sector organisations. Hauser (2022) documents forced termination at 48 sessions due to agency constraints. Murphy (2009) describes a charity (icap) offering open-ended therapy. The access picture: long-term PCT for complex trauma happens in charities and third-sector organisations, not in the NHS. It depends on the existence of open-ended charity funding, which is rare and precarious.
- **The single-research-group problem.** The entire Layer 1c evidence base is essentially one interconnected research group. This does not invalidate the findings but limits their weight in synthesis. Independent replication from outside the Murphy/Joseph/Elliott network would substantially strengthen the case for long-term PCT with complex trauma.

### 2026-03-18 Annotation agent: Layer 3 counterpoint batch (9 sources)

**Task:** Create stubs and fully annotate 9 counterpoint sources across 5 subdirectories: lilliengren-2025-edt-meta (root), lilliengren-2017-istdp-gad (istdp/), dejongh-2024-emdr-science (emdr/), dejongh-2023-emdr-case (emdr/), farina-2025-rapid-rare (emdr/), mitchell-2021-mdma-phase3 (mdma-ketamine/), gorman-2020-mdma-ptg (mdma-ketamine/), sciarrino-2020-intensive-review (intensive-formats/), feder-2025-ketamine-exposure (mdma-ketamine/).

**Layer/file:** Layer 3 — counterpoint (accelerated and brief models)

**Issues identified:**
- Wiley URLs returned 403 for all 4 open-access DOIs attempted via WebFetch. Used Scholar Gateway instead, which returned full abstracts and key text chunks -- sufficient for annotation but not complete full text for EDT meta and EMDR sources.
- Farina et al. 2025 is paywalled. Annotated from Scholar Gateway excerpts only (access: inaccessible). However, the key quote ("such quick good outcomes cases are rare") and the full commentary on the de Jongh case were captured via Scholar Gateway chunks.
- 4 sources annotated from provided PDFs (Lilliengren 2017, Mitchell 2021, Sciarrino 2020, Feder 2025). All fully read with page-level references.
- Gorman 2020 has a 2024 correction (DOI 10.1002/jts.23097) removing 4 participants due to therapist ethical violation. Noted in annotation.
- The de Jongh 2023 case study is actually published in 2023 (JCLP vol 80, 2024 issue) but cited as 2023 in the task briefing. Used 2023 per task instructions; the Farina commentary cites it as "De Jongh and Hafkemeijer (2024)."

**Questions raised:**
- The EMDR CPTSD data (Voorendonk 2020: 88% CPTSD remission in 8 days; van Vliet 2021: stabilisation adds nothing) is the strongest counterpoint in the entire review. How should the review handle this? The data directly challenge the phase-based model for the defined population. But the endpoint is diagnostic remission (symptom-based), not structural personality change. And Farina et al.'s clinical experience-based rebuttal ("rapid outcomes are rare") is a weak form of evidence against RCT data. The endpoint divergence construct is essential here: what does "no longer meeting CPTSD criteria" actually mean for a patient's long-term trajectory?
- The FDA rejection of MDMA in 2024 significantly weakens the entire MDMA evidence base (Mitchell 2021, Gorman 2020). Should the review treat these sources as "evidence base compromised" or as "strong efficacy signal despite regulatory concerns"? The ethical violations in earlier MAPS trials and the functional unblinding concern are substantive, not merely procedural.
- Feder 2025 (ketamine + WET) reports that 53.8% of participants were in CONCOMITANT PSYCHOTHERAPY. This means the ketamine+WET intervention was ADDITIVE to ongoing therapy. Should this be framed as supporting the long-duration thesis (patients needed ongoing therapy AND the accelerant) rather than challenging it?
- The Sciarrino 2020 dropout finding (5.51% intensive vs 18-39% standard) raises a fundamental question: does standard weekly therapy CAUSE dropout through excessive avoidance between sessions, or does intensive therapy SELECT for more motivated patients? If the former, the entire duration literature is biased by a delivery format that systematically loses the most avoidant patients.

**Suggestions:**
- Voorendonk et al. (2020) and van Vliet et al. (2021) should be considered for standalone stubs as primary sources, rather than only being covered through the de Jongh 2024 review. These are the strongest individual studies challenging the long-duration thesis for CPTSD.
- The counterpoint layer now reveals a clear pattern: ALL accelerated models measure symptom reduction, NONE measure structural personality change. This is the endpoint divergence in action. Consider creating a dedicated cross-cutting analysis note on this.
- The Farina commentary's observation about "different underlying structures despite similar presentations" is potentially the most important theoretical contribution in the entire counterpoint layer. It suggests a resolution to the duration debate: duration is not determined by diagnostic category but by structural depth. Some CPTSD patients have enough "adaptive information" to benefit from rapid processing; others have deeper structural disruption requiring developmental-relational work. This could become a key synthesis argument.

**Emerging patterns:**
- **Endpoint divergence is now empirically grounded.** Every counterpoint source measures symptom reduction or diagnostic remission. None measures structural personality change, earned secure attachment, identity integration, or relational capacity. The disagreement about duration dissolves largely into a disagreement about endpoints: if your endpoint is "no longer meets PTSD criteria," you can often get there in weeks; if your endpoint is "fundamentally changed internal working model and personality organization," the evidence suggests years. The counterpoint sources are not wrong -- they are answering a different question.
- **The stabilisation debate is settled (for now).** De Jongh 2024 (citing van Vliet 2021) provides RCT evidence that stabilisation adds nothing to EMDR outcomes for CPTSD. This is important for the long-duration position: if long treatment is necessary, it is not because of stabilisation exercises but because of the relational process itself. The long-duration argument must be about relationship, not technique.
- **Pharmacological acceleration as a natural experiment.** The MDMA and ketamine studies provide a natural experiment: what happens when you pharmacologically remove the neurobiological constraints on trauma processing? If patients improve rapidly, this suggests the constraint was neurobiological (fear extinction, neuroplasticity), not relational. If they relapse (as ketamine-only patients typically do), this suggests the relational component is necessary for durability. Feder 2025's finding that ketamine + psychotherapy maintains gains better than ketamine alone supports this interpretation.
- **The dropout problem is structural.** Sciarrino 2020 shows that intensive formats reduce dropout from 30-40% to 5%. If one-third of patients in standard weekly therapy drop out, the duration literature systematically overestimates how long healing takes -- because it only measures people who stayed. The actual "healing duration" for the entire population (including dropouts) is unknown. This is the most important methodological insight from the counterpoint layer.
- **The Farina resolution.** Farina et al.'s suggestion that "similar presentations may have different underlying structures" provides a potential resolution to the entire duration debate. Rather than arguing about whether complex trauma requires brief or long treatment, the field should be asking: what determines which patients can benefit from accelerated approaches and which require extended developmental-relational work? The answer likely involves the degree of structural dissociation, the availability of adaptive information (intact positive relational experiences), and the patient's current capacity for affect regulation.

**Inaccessible sources:**
- Farina, B., Dimaggio, G., & Mosquera, D. (2025). Commentary on five CPTSD case studies. JCLP. DOI: 10.1002/jclp.23773 -- paywalled, annotated from Scholar Gateway excerpts.

### 2026-03-18 Agent: Layer 6 memoirs — search and annotation (5 sources)

**Task:** Identify and annotate memoirs/autobiographies narrating the full arc of healing from complex developmental trauma. Budget: 5 initial, 8 max.

**Layer/file:** 3_results/sources/6-memoirs/ (5 source files + README updated)

**Sources annotated:**
1. Foo (2022), *What My Bones Know* — highest value. 8+ years with first therapist, 10+ total, explicit modality-switching, access barriers addressed.
2. Levine (2024), *An Autobiography of Trauma* — wounded healer; 40+ year arc entangled with SE development.
3. Walker (2013), *Complex PTSD: From Surviving to Thriving* — hybrid memoir/guide; 40+ years; addresses "reasonable expectations about rate of recovery."
4. Anderson (2024), *To Be Loved* — IFS developer memoir; identity + sexuality + trauma; multi-decade arc.
5. Eger (2017), *The Choice* — extreme case: 35 years suppression before processing; ongoing at 90+. (Caveat: Holocaust trauma, not developmental in the narrow sense.)

**Issues identified:**
- All 5 sources are abstract-only (annotated from reviews, publisher descriptions, interviews). No full text was available for extraction. Specific session frequency data, exact modality timelines, and verbatim quotes are missing across all sources. Foo would benefit most from full-text annotation — she is the richest source for duration, modality-switching, and access data.
- The "Dina Goldstein" candidate from the methods file could not be identified as a published book. May be confused with a different name.
- 3 of 5 memoirists are clinician-developers (Levine, Walker, Anderson), creating a "wounded healer" bias in the layer. Their healing trajectories are entangled with professional development in ways that are not generalizable.

**Questions raised:**
- Should Eger be included? Her trauma is primarily Holocaust-related, not complex developmental trauma in the narrow clinical sense. I included her because the healing trajectory dynamics (suppression, latency, late-onset processing, ongoing healing) are directly relevant to the duration question, but this is a judgment call.
- Where are the non-clinician memoirs? The search found surprisingly few non-clinician memoirs that explicitly narrate therapeutic healing over time. Most trauma memoirs focus on the abuse narrative and escape/survival, not on the therapy and healing trajectory. This may itself be a finding: memoirs about the therapy process (as opposed to the trauma itself) are rare.
- The "sleeper effect" — continued change after therapy — is implicitly present in all 5 memoirs but none of them name it explicitly. Eger is the strongest case (35 years of latent processing before therapy even began).

**Suggestions:**
- Foo deserves full-text annotation. She is the single most relevant source in this layer and may be the most relevant memoir in the entire project.
- Consider adding a cross-cutting observation about the "memoirable trajectory" bias: people who write memoirs about healing from trauma have, by definition, reached a point of sufficient integration to narrate their story. The memoirs cannot tell us about people who are still in the middle, or who never reached that point.
- The endpoint convergence across all 5 memoirs (relational/functional, never symptom-free) is striking and should be highlighted in synthesis. Not a single memoirist defines healing as symptom elimination.

**Emerging patterns:**
- **Endpoint convergence**: All 5 define "healed" relationally/functionally (capacity for connection, self-forgiveness, thriving), never as symptom-free. This is the strongest finding from this layer.
- **Duration convergence**: All 5 describe decade-plus trajectories. Range: 10+ years (Foo, minimum) to 72 years (Eger). No memoir describes rapid recovery from complex trauma.
- **Modality-switching as norm, not failure**: Foo is most explicit, but Walker and Levine also describe movement through approaches. Foo reframes "breaking up with therapists" as adaptive developmental moves, not dropout.
- **The wounded healer pattern**: 3/5 are clinician-developers. This may reflect publication bias (clinicians have platforms) rather than a genuine pattern in healing trajectories.
- **Access is the invisible variable**: Only Foo addresses it directly ($6,400 pro bono therapy). The other four had extraordinary resources (Harvard training, PhD programs, emigration to the US). The memoir layer systematically underrepresents people without these advantages.

**Inaccessible sources:**
- All 5 memoir sources are annotated from reviews/descriptions only (access: abstract-only). Full texts would significantly enrich the annotations, especially for Foo.

### 2026-03-19 Agent: Layer 5 client narratives — source stubs and annotation (5 sources)

**Task:** Create and annotate 5 source files for Layer 5 (client narratives) from MyPTSD.com forum threads.

**Layer/file:** 3_results/sources/5-client-narratives/ (5 source files + README updated)

**Sources annotated:**
1. myptsd-2019-how-long-therapy — Duration range 8 months to 27 years; therapeutic relationship > modality; escalation gap.
2. myptsd-2024-emdr-cptsd-duration — EMDR clients report YEARS (2-5+), not 8-16 sessions from RCTs. The RCT-reality gap.
3. myptsd-2021-how-long-therapy-2 — Cyclical/episodic engagement; quality > quantity; therapy as ongoing practice.
4. myptsd-2020-session-frequency — Frequency is individual (monthly to twice-weekly); attachment shapes frequency; monthly inadequate.
5. myptsd-2015-cant-afford-therapy — Access as fundamental barrier; forced termination by cost; self-directed healing.

**Issues identified:**
- All 5 sources are from a single forum (MyPTSD.com). Reddit, Quora, and other platforms not yet searched. This creates a platform bias — MyPTSD may attract a particular demographic (English-speaking, tech-literate, sufficiently stable to engage in online community).
- Forum threads have no verification mechanism. Reported durations are self-report and may be inaccurate. Some posters appear across multiple threads (Skywatcher, somerandomguy, Friday), creating pseudoreplication.
- The inclusion criterion "5+ years reflective" was relaxed for shorter accounts (MisterCatLady at 8 months, Chris-duck at 7 months) because they provide useful contrast and newcomer perspective.

**Questions raised:**
- How should pseudoreplication across threads be handled? Skywatcher and somerandomguy appear in both the EMDR thread and the session frequency thread. Their data should not be double-counted in synthesis.
- The EMDR thread (myptsd-2024-emdr-cptsd-duration) directly tests the counterpoint RCT claims. Should this be cross-referenced in the counterpoint annotations as a client-perspective test?
- Should the affordability thread be treated as a methodological note for the entire review (reframing "how long" as "how at all") rather than as a standard source?

**Suggestions:**
- Reddit threads from r/CPTSD and r/TalkTherapy should be searched next to diversify the platform.
- The EMDR thread should be cross-referenced in the counterpoint README — it is the strongest client-perspective evidence that the RCT durations are not generalizable.
- Consider a dedicated cross-cutting note on the RCT-reality gap: the counterpoint says 8-16 sessions; the clients say years; the truth likely involves different populations, different protocols, and different endpoints.

**Emerging patterns:**
- **The RCT-reality gap:** Even clients who endorse EMDR as effective report treatment durations of YEARS, not the 8-16 sessions from RCTs (Voorendonk 2020, de Jongh 2024). The gap is not about whether EMDR works — it does — but about what "working" means in the context of complex, layered trauma vs. single-incident PTSD. The RCTs select, control, and compress; real life is layered, interrupted, and extended. This is the single most important finding from the client layer.
- **The cyclical/episodic pattern:** Multiple posters across threads describe on-off engagement — intensive phases followed by self-managed periods, with anticipated future re-engagement. Friday's description matches Blue Knot's "continuously or episodically." This is not dropout; it is adaptive engagement with a chronic-cyclical condition. The clinical literature largely treats this as non-compliance; the clients experience it as responsive self-management.
- **Therapeutic relationship > modality:** Consistent across all 5 threads. Posters who have tried multiple modalities and therapists consistently attribute progress to the relational match, not to the technique. This aligns with the common-factors literature and with the practitioner layer. It also complicates the counterpoint: if relationship is the mechanism, then the modality-specific duration claims (EMDR in 8 sessions, ISTDP in 20) may be measuring the wrong variable.
- **Frequency is individual, not prescriptive:** The session frequency thread produces no consensus. Monthly is too little, twice-weekly is too much for some and essential for others, and the "right" frequency is shaped by attachment dynamics as much as by clinical need. This challenges any dose-response model that assumes a standard frequency.
- **Access as the invisible variable:** The affordability thread reframes the entire review. The duration literature assumes treatment is accessible. For many with complex trauma, it is not. Sugnim's "I cannot afford therapy" is the data point the academic literature cannot capture. The Albatross's self-directed healing challenges the therapy-centrism of the review itself. Any synthesis must acknowledge that the "how long" question is a privilege — it assumes the "if at all" question has been answered.

**Inaccessible sources:**
- None. All 5 forum threads were fully accessible.

### [2026-03-19 14:30] Agent: Layer 5 annotation — Reddit batch (10 threads)

**Task:** Annotate 10 Reddit threads from r/CPTSD and r/CPTSD_NSCommunity as Layer 5 client-narrative sources.
**Layer/file:** 3_results/sources/5-client-narratives/ — 10 new source files created, README updated.

**Issues identified:**
- reddit-how-long-after-therapy-feel: Comments 2-10 appear to be AI-generated or templated (identical text with only the duration number changed: "2 years... 3 years... 10 years"). These were excluded from analysis. This is a data integrity issue for Reddit sources that should be flagged as a methodological concern.
- Several threads have many deleted comments, limiting the available data. reddit-fully-healed-how-long has 7 of 10 comments unavailable.
- The raw files appear to have been collected via an LLM intermediary (ChatGPT or similar), which introduces potential paraphrasing, summarisation, or fabrication. The reddit-stages-healing-stage3 comments are explicitly labelled "illustrative, as the full content of the top comments was not available." These should be re-scraped directly from Reddit if possible.

**Questions raised:**
- The safety-precondition finding (therapy only works when safe) is now confirmed across multiple independent sources (u/ElishaAlison in two threads, u/WeeLittleSloth, u/Senior_Octopus). Should "safety as rate-limiting factor" be elevated from a theme to a formal construct, on par with the escalation gap?
- u/ElishaAlison's theory about healed people leaving online communities (reverse survivorship bias) has methodological implications for all forum-based data collection. Should this be flagged as a formal limitation in the Layer 5 synthesis?
- The emergence of AI-assisted self-therapy (reddit-2025-full-cure-how-long) is a novel finding. Should this be tracked as an emerging modality?

**Suggestions:**
- Re-scrape reddit-how-long-after-therapy-feel and reddit-stages-healing-stage3 directly from Reddit to verify comment authenticity.
- Consider creating a cross-cutting synthesis note on the "safety precondition" — it is now the second strongest finding after "years, not months."
- u/msk97's recovery narrative (reddit-2024-recovered-cptsd) should be highlighted as the most detailed and specific recovery account in the entire Layer 5 corpus — it provides modality sequencing, timeline, adjuncts, and assessment-confirmed endpoint.

**Emerging patterns:**
- **Safety as the clock-starter:** The clock for effective therapy does not start at the first appointment. It starts when the client achieves environmental safety. u/ElishaAlison saw the same therapist during abuse (no benefit) and after achieving safety (full benefit). u/WeeLittleSloth spent 3 years in therapy while still exposed to the abuser — stalled progress. This reframes the "how long" question: the answer depends on when safety was achieved, not when therapy began.
- **Endpoint divergence is the central disagreement:** The CPTSD community does not agree on what "healed" means. The spectrum runs from "lifelong management" (u/ZzzzoZzzzo: "no one fully heals") to "identity transformation" (u/msk97: "recovered, therapist-confirmed") to "somatic safety signal" (u/almost-crazy: the nervous system declares the threat is over). These are qualitatively different endpoints and would produce radically different duration estimates.
- **Modality sequencing:** u/msk97's trajectory (EFT -> IFS -> psychodynamic with the same therapist) suggests that different modalities serve different phases. This challenges both the single-modality assumption of RCTs and the "modality doesn't matter" claim from the common-factors camp. Modality may matter, but sequentially — the right modality at the right phase.
- **Stage 3 as the hidden duration:** u/cheetosRliife's account of Herman's Stage 3 (reconnection/integration) as the slowest, most transformative, and most invisible phase suggests that a significant portion of healing time happens outside formal therapy and below the threshold of measurable change. This is the sleeper effect from the client's perspective. It also means that therapy outcome studies may terminate measurement too early — before the most important changes have occurred.
- **The escalation gap inflates duration data:** When clients report "10 years in therapy," a significant portion may be escalation-gap time (cycling through bad-fit therapists, receiving treatment during unsafe conditions). The effective dose may be much shorter than the reported duration. This has major implications for interpreting all duration data in the project.
- **Forced termination as its own trauma:** u/Mountain-Science4526's loss of a therapist after 10 years and 900+ sessions, and u/xechasate's 1+ year gap before returning to therapy, suggest that sudden loss of a therapeutic relationship produces its own traumatic disruption — a meta-trauma within the healing process.

**Inaccessible sources:**
- None. All 10 threads were accessible in the _reddit_raw/ directory. However, data quality concerns exist for 2 threads (see Issues above).

### [2026-03-19] Agent: Annotation upgrade agent

**Task:** Upgrade existing source annotations with newly obtained primary and secondary source data for 3 files; assess 2 additional files (Kohut, Winnicott) for upgrade need.
**Layer/file:** 1a-trauma-clinical (herman-1992, vanderhart-2006), 6-memoir (foo_2022)

**Changes made:**

1. **herman-1992-trauma-recovery.md** — MAJOR UPGRADE. Access upgraded from abstract-only to full (via Herman 1998 summary paper). Added 8 primary-source quotes with page numbers from Herman (1998), "Recovery from psychological trauma," *Psychiatry and Clinical Neurosciences*, 52(Suppl), S145–S150. Most significant addition: explicit duration data for Phase 1 ("days to weeks" for acute, "months to years" for chronic abuse — p. S147) and explicit indeterminacy statement for Phase 2 ("no fixed answer... cannot be bypassed or hurried" — p. S148). Citation updated to include 1998 paper. Quality notes updated to reflect primary source access.

2. **foo_2022_what_my_bones_know.md** — MODERATE UPGRADE. Access upgraded from abstract-only to secondary-enriched. Added data from NPR interview, Psychologists Off the Clock podcast, and book summaries: diagnosis context (online session with Samantha at age 30), career change (quit This American Life), book structure (5 parts, 43 chapters), Dr. Ham discovery pathway (podcast), modality sequence detail, marriage as endpoint, intergenerational dimension. Added two interview quotes on healing trajectory and shame reduction. Enriched access/context section with $6,400 pro bono confirmation.

3. **vanderhart-2006-haunted-self.md** — MINOR UPGRADE. Added phase-specific phobia elaboration (Phase 1 phobias vs Phase 2 vs Phase 3), book structure (Theory Parts I-II, Treatment Part III), Janet lineage, 12 CE credits detail, Middleton/ISTSS review reference. Quality notes updated. No primary quotes obtained.

4. **kohut-1984-how-analysis-cures.md** and **winnicott-1965-maturational.md** — NOT UPDATED. Secondary source annotation adequate — no primary upgrade available.

**Issues identified:**
- Herman 1998 is a 6-page summary paper, not the 1992 book itself. The quotes are Herman's own words summarizing her model, but the book contains substantially more clinical detail, case material, and nuance. The upgrade is genuine but partial.
- Foo annotation remains without full-text access. Session frequency, exact timeline with Dr. Ham, and specific modality details still require the book itself.

**Questions raised:**
- Herman 1998 p. S147 gives explicit Phase 1 duration ("months to years" for chronic abuse). Should this be elevated to a key finding in the duration extraction files? It is one of the few explicit duration statements from a foundational author.
- Herman's "survivor mission" concept (p. S149) — is this captured in the endpoint definition extraction? It redefines endpoint as meaning-making and social contribution, not just symptom resolution or even reconnection.

**Suggestions:**
- The Herman 1998 paper should be added to the source list as a standalone entry if it isn't already — it's a distinct publication with distinct claims.
- Consider obtaining the full Foo book for session-level data extraction. It's the richest single-case memoir in the project.

**Emerging patterns:**
- Herman's explicit statement that Phase 2 "cannot be bypassed or hurried" and "will almost surely take longer than the patient wishes" is remarkably similar to the Reddit lived-experience data (u/cheetosRliife on Stage 3 as "the slowest, most transformative" phase). Primary source and lived experience converge on the same point: the deep work takes as long as it takes, and that duration exceeds expectations.

**Inaccessible sources:**
- Herman 1992 book (full text) — still not accessed; 1998 paper is a partial substitute
- Foo 2022 book (full text) — not accessed; interviews/reviews are partial substitute
- Van der Hart 2006 book (full text) — not accessed

### 2026-03-19 Phase 3: Synthesis pass (orchestrator, ultrathink)

**Task:** Read all 16 extraction files, identify cross-layer patterns, generate synthetic constructs, write the synthesising argument in `4_discussion/1_synthesis.md`.

**Layer/file:** `4_discussion/1_synthesis.md`

**Issues identified:**
- None blocking. The extraction data was well-structured and cross-referenced.

**Questions raised:**
- The Brand paradox (higher dissociation = faster improvement) needs resolution. Hypothesis: symptom measures capture room-to-improve, not structural integration. Needs empirical testing.
- The "escalation gap" (years spent finding the right therapist) may inflate all naturalistic duration estimates. How much of "it takes years" is actually "it takes years to find the right match"? This is methodologically irresolvable from the current data.
- Should the synthesis address the AI-assisted self-therapy finding (reddit-2025-full-cure-how-long) more cautiously? It is a single anecdote with no empirical basis. Currently included as "warrants monitoring" — may be better omitted entirely.

**Suggestions:**
- Phase 4 (discussion sections) should be written in the order: counterpoint response (5) → survivorship bias (2) → dose vs time (3) → therapy vs life (4) → access (6) → limitations (7) → implications (8). Rationale: counterpoint response is the most important intellectually and should be written first while the synthesis argument is fresh. Limitations and implications depend on all prior sections.
- The three emergent constructs (endpoint divergence, sleeper effect, developmental mechanism convergence) should each be formally registered as synthetic constructs per CIS methodology. Currently documented in extraction files 8, 9, 10; the synthesis integrates them but they should also be noted in `6_appendix/iterations/` as methodological transparency.
- HUMAN CHECKPOINT recommended before Phase 4: the synthesising argument (the 3-factor model, the claim that the field's disagreement is an artefact) is the review's original contribution. The author should review and approve it before it structures the discussion sections.

**Emerging patterns:**
- The "safety as clock-starter" construct (identified in Reddit data) may deserve its own extraction file or at least formal recognition as a synthetic construct. Multiple sources converge: ElishaAlison's same-therapist different-outcome, r/cant-heal-while-surviving, Eger's 35-year latency, Porges's neuroception, Herman's Phase 1 as prerequisite. The construct: effective therapy duration begins at the establishment of safety, not at the first appointment. All duration data that includes pre-safety time is systematically inflated.
- The "borrowed vs owned" distinction (Kohut) maps precisely onto the sleeper effect. "Borrowed" structure = gains measured at end-of-treatment that may not persist. "Owned" structure = gains that emerge after treatment ends because they are genuinely internalised. This could be a powerful theoretical bridge between psychoanalytic theory and outcome research.

**Inaccessible sources:**
- None new.

### 2026-03-19 Annotation agent: 3 new gap-filling sources

**Task:** Fetch 2 web transcripts and read 1 zettelkasten file, then create annotated source notes for 3 new sources: fisher-cutting-edge-tist (Layer 4), fosha-2019-aedp-intimacy (Layer 3), fisher-transforming-legacy (Layer 1a).
**Layer/file:** 4-practitioner, 3-counterpoint, 1a-trauma-clinical

**Issues identified:**
- The Fisher podcast transcript (therapyonthecuttingedge.com) was truncated — approximately the final third was missing from the web page. The later discussion on suicidality, BPD/CPTSD overlap, and treatment conclusions was available only in summarised form. Quotes from the truncated section are paraphrased, not verbatim.
- The Fosha/Neil Sattin podcast page (neilsattin.com) could not be fetched — the page is JavaScript-rendered (Divi/WordPress theme) and WebFetch only received CSS/metadata. The transcript is reportedly available at neilsattin.com/fosha but that URL also failed. Used the Psychotherapy.net interview with Fosha instead, which covers the same core AEDP material (healing from the get-go, transformance, meta-processing) but is a different interview — not the Neil Sattin episode. The citation and URL have been updated to reflect the actual source used.
- The Fisher workbook (fisher-transforming-legacy) was annotated from 85 Kindle highlights, not the full text. Access is marked as "abstract-only." Coverage is concentrated in introductory chapters and the structural dissociation chapter. Later practical chapters are underrepresented.

**Questions raised:**
- The Fosha source complicates the thesis in an interesting way: AEDP does not claim healing is brief, but that transformation begins immediately. Should the review distinguish between "how long does healing take?" and "when does healing begin?" These are different questions with different implications for the thesis. The current framing assumes healing = elapsed time from start to endpoint. AEDP suggests that the trajectory of change may have a different shape — immediate transformation followed by consolidation — rather than gradual accumulation.
- Fisher's "slower is faster" principle and Fosha's "healing from the get-go" appear to be in direct tension. Both are experienced trauma clinicians. Is this a genuine disagreement, or are they addressing different populations (Fisher: high-complexity/dissociative; Fosha: broader trauma)? This tension could be productive for the discussion chapter.

**Suggestions:**
- Consider adding the Psychotherapy.net Fosha interview as a distinct source from the Neil Sattin episode if the Neil Sattin transcript becomes available later. They may cover different ground.
- The 6-session DVD-documented AEDP treatment (referenced by Fosha) could be a valuable counterpoint source if accessible. It would be the strongest empirical challenge to the multi-year thesis.
- Fisher's two sources (podcast + workbook) are highly complementary and could be cross-referenced in synthesis: the podcast provides the clinical philosophy in spoken form, the workbook provides the theoretical and practical framework in written form.

**Emerging patterns:**
- The "stabilisation as prerequisite" vs "transformation from the get-go" tension maps onto a broader pattern: the field is divided not just on duration but on the *shape* of the healing trajectory. Phase models (Janet/Herman/Fisher) assume a staircase: flat → flat → step up. Experiential models (AEDP/Fosha) assume an immediate slope: change begins and deepens continuously. This shape question may deserve its own synthesis dimension.
- Fisher's emphasis that the workbook must be used *within the therapeutic relationship* (not as homework) reinforces the "relationship as medicine" construct identified in earlier sources. The pacing of healing is relational, not informational — the same content delivered outside the relationship would be less effective.

**Inaccessible sources:**
- Neil Sattin Episode 176 transcript (neilsattin.com/fosha) — JavaScript-rendered page, inaccessible via WebFetch. Substituted with Psychotherapy.net interview.

---

### 2026-03-19 Annotation agent: Carolyn Spring podcast episodes (Layer 6)

**Task:** Fetch and annotate 3 Carolyn Spring podcast episodes as Layer 6 memoir sources.

**Files created:**
- `3_results/sources/6-memoirs/spring-2020-recovering-developmental-trauma.md`
- `3_results/sources/6-memoirs/spring-2020-what-does-recovery-look-like.md`
- `3_results/sources/6-memoirs/spring-2021-falling-down-getting-back-up.md`

**Issues:**
- WebFetch returned summaries rather than verbatim text on first attempt for all three URLs. Second attempts with stronger prompts yielded near-complete text for sources 1 and 2, and a detailed but possibly incomplete text for source 3. Quotes used in annotations are drawn from the fetched text and should be verified against the original if exactness is critical.
- Source 3 (falling-down) was the hardest to extract in full. The final fetch appears comprehensive but may have minor omissions.

**Observations and emerging patterns:**
- The three episodes together form a longitudinal case study spanning ~15 years (2005-2021): breakdown, ~9 years of therapy, ~3 years of stable functioning, return to therapy after new trauma. This is unusually well-documented for a memoir source.
- The episodic pattern in source 3 (therapy-stable-therapy) is analytically important: it challenges the assumption that "duration of therapy" is a single continuous number. Spring's total time in therapy is ~9+ years, but the total elapsed healing timeline is ~15+ years, with significant non-therapy periods that were also part of recovery.
- Spring's developmental-rate metaphor (source 1) provides a theoretical framework for why healing is slow — survivors are rebuilding missed developmental stages. This maps onto the Kohut "borrowed vs owned" structure observation from the previous log entry: developmental acquisition cannot be rushed.
- The access theme is strongest in source 2: Spring explicitly blames systemic failure for people spending 10-30 years in therapy without recovery. This is relevant to the "dose vs elapsed time" cross-cutting dimension — inadequate therapy (low dose, poor quality) inflates apparent duration without producing comparable outcomes.
- Self-compassion as a differentiator between therapy episodes (source 3) is a novel observation: the same person, same diagnosis, but fundamentally different experience in a second therapy episode because of internalised self-compassion from the first. This supports the "sleeper effect" / "owned structure" construct.

**Suggestions:**
- These three sources should be cross-referenced with each other in the synthesis — they form a coherent longitudinal case.
- The "episodic therapy" pattern (therapy-stable-therapy) may warrant recognition as a distinct trajectory type in the primary synthesis, alongside continuous long-term therapy and serial short-term therapy.
- Run `./sync.sh all` to update references, index, and Layer 6 README.

**Inaccessible sources:**
- None.

---

## 2026-03-19 — Comprehensive safety scan (all 78 sources)

**Agent task:** Scan all 78 source annotations for data relevant to the "safety as clock-starter" emergent construct, then append findings to `3_results/primary/11_safety_as_clock_starter.md`.

**Sources scanned:** All 78 annotated sources across all 6 layers (excluding `_reddit_raw/` directory and `SOURCE_TEMPLATE.md`).

**Findings appended:**
- 8 new direct evidence entries (environmental/relational safety as precondition)
- 14 new theoretical support entries (safety as prerequisite for therapeutic mechanism)
- 9 new implicit evidence entries (safety assumed but not discussed)
- 4 counter-evidence entries (safety may not be prerequisite in all cases)
- Silence pattern documented across 4 source categories
- 4 new implications added to synthesis section

**Key emerging patterns:**

1. **Pre-existing safety explains rapid responders.** The counterpoint literature's rapid outcomes (de Jongh EMDR, intensive formats) may reflect patients who arrive with more environmental/relational safety already established. Farina's "adaptive information processing capacity" maps onto pre-existing safety resources.

2. **Intensive formats may achieve safety through containment rather than bypassing it.** Sciarrino's dramatically lower dropout (5.51% vs 18-39%) in intensive formats, combined with the provision of boarding/lodging and removal from daily stressors, suggests the format provides environmental safety that standard weekly therapy does not.

3. **Pharmacological agents create temporary safety windows.** MDMA, ketamine, and cannabis may pharmacologically achieve what relational safety achieves slowly — a neuroceptive state of safety (Porges) that permits processing of defended material.

4. **The dose-effect literature has a systematic measurement artifact.** ALL dose-response data (Howard 1986, Lambert, Leichsenring) measure duration from first session, not from safety establishment. The construct predicts that separating pre-safety sessions from post-safety sessions would produce a steeper, faster dose-effect curve.

5. **The "getting worse before better" phase maps onto safety transition.** Client narratives describing severe exacerbation in early therapy may reflect the nervous system beginning to emerge from defensive shutdown as neuroception detects safety — paradoxically, feeling worse IS the signal that safety is being established.

**Suggestions for plan:**
- The safety construct should be cross-referenced with the endpoint-divergence construct (10_endpoint_divergence.md): different endpoints may require different safety thresholds.
- The counterpoint response (4_discussion/5_counterpoint_response.md) should integrate the "pre-existing safety" explanation for rapid responders.
- Consider whether "safety as clock-starter" should be reframed as "safety as rate-limiting prerequisite" to better capture the recursive nature (Blue Knot: safety must be re-established repeatedly).

**Inaccessible sources:** None (all 78 were readable).

---

### 2026-03-19 Agent: Supplementary safety scan — gap-filling pass

**Task:** Re-scan all 78+ source annotations for safety-relevant data missed by the initial comprehensive scan. Append supplementary findings to `3_results/primary/11_safety_as_clock_starter.md`.
**Layer/file:** `3_results/primary/11_safety_as_clock_starter.md`

**Changes made:**
Appended a "Supplementary findings from full source scan" section with:
- 4 additional direct/empirical evidence entries (griffiths-2025, links-2015, sohal-2022, reddit-2025-stages-healing-stage3)
- 6 additional theoretical support entries (joseph-2012, bcpsg-2010, schore-2021, fonagy-2002, winnicott-1965, plus a note connecting Winnicott's "holding environment" directly to the safety construct)
- 5 additional implicit evidence entries (myptsd-2015, myptsd-2020, paris-2020, fonagy-2015-tads, bateman-fonagy-2008)
- Refined silence pattern distinguishing psychoanalytic silence (describe safety in different vocabulary), dose-effect silence (measurement artifact), and counterpoint strategic silence (conflate stabilisation exercises with felt safety)

**Key findings not in previous scan:**
1. **Sohal 2022 as safety-threshold data:** The 15-session minimum for significant change in PCT with suicidal clients is the clearest empirical marker of safety-establishment duration. Sessions 1-14 produced no measurable change — this IS the safety-building period.
2. **Joseph 2012 curvilinear model as safety argument:** The inverted-U between stress and growth means processing capacity exists only within a safety window. Too little stress = no growth impetus; too much = overwhelm. Safety = calibrating the stress level into the processable range.
3. **Winnicott's "holding environment" IS the safety construct:** The psychoanalytic tradition describes what this review calls "safety" but uses its own vocabulary (holding environment, selfobject transference, surviving destruction). The silence on "safety" is terminological, not substantive.
4. **Paris 2020 naturalistic recovery reread:** The McLean BPD study showing recovery over 24 years may reflect gradual accumulation of environmental safety (financial stability, relationship maturation) rather than "natural course." Safety-as-clock-starter offers an alternative explanation for "naturalistic" improvement.
5. **Bateman-Fonagy MBT as safety-through-structure:** The partial hospitalization format (5 days/week, therapeutic community, coordinated team) may succeed because it provides environmental safety through its structure — not through stabilisation exercises.

**Questions raised:**
- Should the construct distinguish between TYPES of safety (environmental, relational, autonomic/neuroceptive) that may be established at different rates?
- The Links GPM 6-week safety timeline vs. Herman's "months to years" for Phase 1 suggests a population gradient: BPD patients with some pre-existing safety resources may establish safety faster than severely dissociative patients.

**Suggestions:**
- The refined silence pattern (psychoanalytic = different vocabulary, dose-effect = measurement artifact, counterpoint = strategic conflation) should be integrated into the counterpoint response discussion section.
- The sohal-2022 15-session threshold should be cross-referenced with the dose-effect literature as a safety-inflection point.

**Inaccessible sources:** None.

---

## 2026-03-19: Extraction of 11 newly annotated sources into all extraction files

**Task:** Extract data from 11 new source notes (3 Spring memoirs, 2 Fisher, 1 Fosha, 2 Heacock, 1 Bisson, 1 Tilson, 1 Ogden) into all relevant primary (11 files) and secondary (6 files) extraction files.

**What was done:**
- Read all 11 source notes in full
- Read all 17 extraction files to understand existing format
- Found that 4 secondary files (continuity, modality, therapist, frequency) and 2 secondary files (phase_structure, adjuncts) had already been partially updated by a prior process with a `<!-- New sources added 2026-03-19 -->` marker. Verified these were complete and correct.
- Appended new data to the following primary files that needed updating:
  - `1_duration.md` — 11 new rows in summary table + updated layer narratives for Layers 1a, 1d, 3, 4, 6
  - `2_trajectory.md` — trajectory descriptions for all 11 sources, plus 2 new trajectory types in the emergent typology (developmental/maturational, sequential multi-modality)
  - `3_turning_points.md` — turning points from 9 sources (relational breakthroughs, diagnostic shifts, modality shifts, theoretical reframing, systemic access)
  - `4_healing_definitions.md` — 11 new rows + updated pattern analysis
  - `5_surprises.md` — 7 new surprise entries (#17-23): AEDP first-session transformation, episodic gains retained, debunked neuroscience, natural resilience, 3-year trust-building, psychedelic scaffolding, C-PTSD prevalence
  - `6_dropout.md` — indirect dropout data from 5 sources
  - `7_access.md` — 11 new rows (5 with access data, 6 noting silence on access)
  - `8_sleeper_effect.md` — 3 new source entries + updated pattern
  - `9_developmental_mechanism.md` — 8 new entries (6 confirming, 2 complicating) + extended pattern analysis
  - `10_endpoint_divergence.md` — 11 new rows in the specific examples table
  - `11_safety_as_clock_starter.md` — already had comprehensive data from a prior scan; no additional entries needed
- Appended new data to `6_adjuncts.md` (the one secondary file that still needed updating)
- Ran `./sync.sh all` — 89 references, index updated, 6 layer READMEs updated

**Emerging patterns:**
1. **Developmental-rate convergence:** Spring's developmental metaphor (9.5 years = rebuilding childhood), Bisson/Davitt's arrested development ("eight-year-old in a fifty-year-old's body"), and Fisher's "slower is faster" all converge on the same mechanism from completely independent sources (memoir, clinical-diagnostic, practitioner). This is the strongest lived-experience confirmation of the developmental mechanism construct.

2. **AEDP as nuanced counterpoint, not refutation:** Fosha's "healing from the get-go" challenges when change begins but not how long structural repair takes. The 6-session DVD case complicates the thesis but does not invalidate it — the distinction between onset of transformation and completion of developmental repair should be made explicit in the discussion.

3. **Tilson creates a necessary methodological challenge:** By debunking the triune brain and polyvagal frameworks, Tilson weakens the specific neuroscience cited by Ogden and Porges. However, the developmental mechanism convergence survives this challenge because it rests on clinical observation (Spring, Fisher, Heacock, Bisson) as much as on neuroscience. The discussion should distinguish between frameworks that survive Tilson's critique (developmental psychology, attachment theory, outcome research) and those that do not.

4. **Trust-building as measurable safety proxy:** Heacock/Jacklin's 3-year trust-building estimate is the most granular measurement of the safety-establishment period in the dataset. It directly validates the safety-as-clock-starter construct: the therapeutic clock did not start until year 3.

5. **Episodic trajectory as a sixth trajectory type:** Spring's two-episode pattern (9yr + 3yr stable + ongoing) is qualitatively different from the existing five-type trajectory typology. It demonstrates that prior gains are retained across episodes, that new trauma requires new processing, and that the total healing timeline includes functional periods. This should be added to the trajectory typology.

6. **Access silence in new sources:** 6 of 11 new sources say nothing about who can afford the treatment they describe. Fisher's TIST requires training in 4 modalities; Heacock/Jacklin describes 15 years of private weekly therapy; Ogden's sensorimotor psychotherapy requires multi-level certification. The access gap continues to widen as the recommended treatment becomes more specialized.

**Inaccessible sources:** None.

---

### Entry: Synthesis revision agent — 2026-03-19

**Task:** Revise `4_discussion/1_synthesis.md` to integrate 11 new sources, 8 underused Layer 4 sources, 2 emergent constructs (safety-as-clock-starter, borrowed-vs-owned), and the Fisher-Fosha tension.

**What was done:**
- Rewrote synthesis from 165 lines to approximately 280 lines (~70% growth).
- Added safety-as-clock-starter as Factor 0 in the framework (new major section).
- Added fifth endpoint level (recovery-as-direction, Spring) to the endpoint-duration nexus.
- Added sixth trajectory type (episodic/developmental, Spring) to trajectory typology.
- Integrated Fisher-Fosha tension as a fourth dimension of disagreement in "Why the field appears to disagree."
- Added the Fisher-Fosha puzzle to "What the framework cannot explain."
- Integrated Tilson's evidence critique in two places: the developmental mechanism section (contested neuroscience) and the "cannot explain" section (SE's thin evidence base).
- Added Ogden's hierarchical processing, Fisher's "slower is faster," Razvi's three-tier framework, and Spring/Bisson developmental-rate evidence to the developmental mechanism section.
- Integrated borrowed-vs-owned bridge (Kohut) into Factor 3 (elapsed time) with predictions for sleeper/reverse-sleeper effects.
- Added Heacock/Jacklin trust-building data and Bisson/Davitt escalation gap to "right therapist" confound.
- Added psychoanalytic vocabulary problem to literature critique.
- Added Layer 4 gap paragraph integrating all 8 previously underused sources.
- Updated source count from 78 to 89 throughout.
- Updated YAML description to reflect new content.

**Issues and observations:**

1. **The synthesis is approaching maximum density.** At ~280 lines of sustained argument, the text is dense but still readable. Further additions risk losing the coherent argumentative thread. The remaining discussion files (limitations, counterpoint response, implications) should absorb additional source citations rather than expanding the synthesis further.

2. **The Fisher-Fosha tension deserves a dedicated subsection in 4_discussion/3_counterpoint_response.md** rather than being fully resolved here. The synthesis identifies it as a puzzle; the counterpoint response should engage with it more fully.

3. **The safety-as-clock-starter construct is now the review's second strongest finding** (after the endpoint-duration nexus). It has independent implications for research methodology (all dose-effect data is contaminated by pre-safety sessions), clinical practice (safety assessment should precede treatment planning), and policy (environmental safety interventions may be more cost-effective than additional therapy sessions).

4. **The Tilson challenge is genuinely uncomfortable.** The synthesis now acknowledges that the neurobiological rationale for the developmental mechanism is more contested than the mechanism itself. This is honest but weakens one strand of the argument. The remaining strands (clinical convergence, outcome data, lived-experience accounts) are sufficient, but the gap between "it takes years" (robustly supported) and "here is why it takes years" (contested science) should be addressed in the limitations section.

5. **The borrowed-vs-owned bridge is the strongest theoretical contribution of this session.** It connects psychoanalytic theory (Kohut) to outcome research (sleeper effect) to clinical observation (Heacock's real-time observation of Sherlock's self-regulation during Erin's absence). It generates testable predictions. It should be highlighted in the abstract/introduction when those sections are written.

**Questions for orchestrator:**
- Should the Fisher-Fosha tension receive its own subsection in the counterpoint response?
- Should the Tilson challenge receive dedicated treatment in the limitations section?
- The synthesis now cites ~40 unique sources. Is this sufficient coverage of the 89-source dataset, or should more sources be integrated?

**Inaccessible sources:** None.
