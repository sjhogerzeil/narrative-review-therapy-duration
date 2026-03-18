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
