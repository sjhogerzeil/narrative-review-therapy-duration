---
dimension: duration
description: Extracted duration data from all sources — reported treatment lengths, ranges, and what explains variation
status: draft
---

# Duration

*What do different sources say about how long healing takes? What's the range? What explains the variation?*

Data extracted from source annotations. Each entry references the source ID.

## Summary table

| Source ID | Layer | Population | Duration reported | Measure (sessions/years/both) | Definition of endpoint |
|-----------|-------|-----------|-------------------|-------------------------------|----------------------|
| howard-1986-dose-effect | 2 | Mixed psychiatric | 50% at 8 sessions; 75% at 26; 85% at 52. Borderline-psychotic: 50% at 13-26 (patient) or 26-52 (chart) | sessions | symptom-reduction |
| leichsenring-2013-emerging-evidence | 2 | PD (Perry et al. 1999) | 50% PD at 92 sessions / 1.3yr; 75% at 216 sessions / 2.2yr. Chronic distress: 60% at 25 sessions; PD: only 40% at 25 sessions | both | mixed |
| fonagy-2015-tads | 2 | Treatment-resistant depression | 18 months treatment (~72 sessions); effects at 42-month follow-up (30% vs 4.4% partial remission) | both | mixed (delayed effect) |
| bateman-fonagy-2008-mbt-8yr | 1b | BPD | 18 months partial hospitalization + 18 months group = 36 months total; gains grew through 8-year follow-up | both | mixed |
| lindfors-2019-helsinki-10yr | 2 | Anxiety/mood disorders | PA: 646 sessions / 56.3 months; LPP: 232 sessions / 31.3 months; outcomes converged at 10 years | both | structural |
| zimmermann-2014-munich-dose | 2 | Major depression | PA: 241 sessions / 39 months (2-3x/wk); PD: 85 sessions / 33 months; CBT: 51 sessions / 29 months | both | mixed |
| koeser-2023-tads-cost | 2 | Treatment-resistant depression | 60 planned sessions / 18 months (48 attended); population had mean 25 years depression, 4.3 failed treatments | both | functional |
| krakau-2023-melas-protocol | 2 | Complex mental disorders | Defines LTPP as >=1 year or >=50 sessions; high-intensity >=3x/wk vs low-intensity 1-2x/wk | sessions/years | mixed (protocol only) |
| leichsenring-2011-ltpp-meta | 2 | Complex/PD | LTPP (>=50 sessions or >=1 year) superior to shorter therapy; ES 0.44-0.68 | sessions/years | symptom-reduction |
| brand-2019-topdd | 2 | DID/dissociative disorders | 1-2 year follow-up showing ongoing improvement; no ceiling reached | years | symptom-reduction |
| shedler-2010-efficacy | 2 | Mixed psychiatric | ES at treatment end 0.97; at >9-month FU 1.51 (growing). PD: ES 1.46 at end, still increasing at 23-month FU | years (follow-up) | mixed |
| griffiths-2025-phase-oriented-review | 1a | Dissociative disorders | Range 7 days to 5 years across studies; DID projected 3-5 years; Boyd: 111 sessions / 22 months; Brand: 5 years; most still symptomatic at end | both | mixed |
| links-2015-gpm-bpd | 1a | BPD | 6wk (less distress), 6mo (reduced self-harm), 12mo (improved relationships), 18mo (improved social functioning) | calendar milestones | functional |
| murphy-2009-pct-abuse | 1c | Severe childhood abuse | 160 sessions / ~5 years (140 weekly + 20 spaced); first 15 sessions just "becoming aware" | both | structural |
| sohal-2022-pct-suicidal | 1c | Suicidal clients | Minimum 15 sessions for significant change (N=56) | sessions | symptom-reduction |
| hauser-2022-fragile-process | 1c | Fragile process / developmental trauma | 48 sessions (ended by agency constraints, NOT complete); first 15 sessions spent "becoming aware" | sessions | structural (not reached) |
| herman-1992-trauma-recovery | 1a | Complex trauma | Safety phase alone "months to years"; reconnection is lifelong | years (implicit) | structural |
| steele-2005-phase-oriented | 1a | Structural dissociation | Secondary/tertiary requires "much more strenuous and long-term" effort; primary may be short-term | implicit | structural |
| vanderhart-2006-haunted-self | 1a | Chronic traumatization | Implied multi-year; scales with dissociative complexity (primary < secondary < tertiary) | implicit | structural |
| kohut-1984-how-analysis-cures | 1b | Self disorders | Implies years; 4-5x/wk for years (standard psychoanalytic context) | implicit | structural |
| winnicott-1965-maturational | 1b | Early environmental failure | "There is no short cut"; developmental time = years | implicit | structural |
| fonagy-2002-affect-regulation | 1b | BPD/developmental psychopathology | "Developmental time" — mentalizing develops through relationship, not instruction | implicit | structural |
| bromberg-1998-standing-spaces | 1b | Trauma/dissociation | Gradual expansion of capacity — implied years | implicit | structural |
| benjamin-1988-bonds-of-love | 1b | General psychoanalytic | Repeated cycles of destruction and survival — implied extended | implicit | structural |
| bcpsg-2010-change-psychotherapy | 1d | General psychotherapy | "Accumulation of many small shifts" — inherently incremental and extended | implicit | structural |
| schore-2000-right-brain | 1d | Developmental trauma | Experience-dependent repair — inherently sustained | implicit | structural |
| schore-2021-intersubjectivity | 1d | General psychotherapy | Accumulative right-brain-to-right-brain process | implicit | structural |
| porges-2022-polyvagal | 1d | Trauma | Autonomic reorganization is inherently slow | implicit | structural |
| hambrick-perry-2019-nmt | 1d | Developmental adversity (children) | Sequential layers of brain reorganization — each needs repetitive patterned experience | implicit | structural |
| lanius-2011-neurobiology-cptsd | 1d | Complex PTSD | Multi-system disruption — must address 4 neural systems sequentially | implicit | structural |
| samson-teicher-2023-maltreatment | 1d | Childhood maltreatment | Maltreated show poorer responses to standard treatments; implies standard durations insufficient | implicit | not-defined |
| dejongh-2024-emdr-science | 3 | CPTSD | 8-day intensive: 88% CPTSD remission; 16 outpatient sessions: 70% lost PTSD, 3% retained CPTSD | sessions/days | symptom-reduction |
| dejongh-2023-emdr-case | 3 | CPTSD + BPD | 10 sessions / 5 weeks: no longer met CPTSD or BPD criteria | sessions | symptom-reduction |
| mitchell-2021-mdma-phase3 | 3 | Severe PTSD (87% developmental) | 18 weeks (3 prep + 3 experimental + 9 integration); 67% no longer met PTSD criteria | weeks | symptom-reduction |
| feder-2025-ketamine-exposure | 3 | Chronic PTSD (18yr mean) | ~3 weeks (6 ketamine + 5 WET sessions); d=1.9; 54% lost diagnosis; 61.5% durable at 6mo | weeks | symptom-reduction |
| gorman-2020-mdma-ptg | 3 | Treatment-resistant PTSD | 2-3 MDMA sessions; 67.2% no longer met PTSD at 12-month FU; also large PTG effect | sessions | mixed |
| sciarrino-2020-intensive-review | 3 | PTSD (various) | 1-3 weeks intensive; d=1.57; dropout only 5.51% (vs 18-39% standard delivery) | weeks | symptom-reduction |
| lilliengren-2017-istdp-gad | 3 | GAD (55.8% PD comorbidity) | Mean 8.3 sessions (range 1-70); healthcare cost reductions sustained 4 years | sessions | symptom-reduction |
| lilliengren-2025-edt-meta | 3 | Mood, anxiety, PD, somatic | Short-term (8-40 sessions); g=-0.96 vs inactive; follow-up advantage g=-0.40 vs active | sessions | symptom-reduction |
| abbass-2014-stpp-cochrane | 3 | Common mental disorders | <=40 sessions; gains but loss of significance at long-term FU | sessions | symptom-reduction |
| paris-2020-access-pd | 3 | Personality disorders | Most improvement by 20 weeks (asymptotic); "a few months" sufficient; McLean study: naturalistic recovery over 24 years | weeks/years | symptom-reduction |
| alpern-2025-truth-complex-trauma | 4 | CPTSD | "Cannot be resolved in six sessions of anything"; implicitly multi-year | implicit | structural |
| blueknot-trauma-practice | 4 | Complex trauma | "May last for decades, whether provided continuously or episodically"; minimum 10-20 sessions | sessions/decades | structural |
| shedler-2020-tyranny-of-time | 4 | General/trauma | Lambert: 50% at 21 sessions, 75% at 40+; Westen: 52-75 sessions for success; Consumer Reports: improvement up to 2+ years, no ceiling | both | mixed |
| substack-traumalescence | 4 | Trauma survivors | 3-6 months (awareness), 6-18 months (neural strengthening), 18 months-3 years (integration) | months/years | structural |
| psychnetworker-transcending-trauma | 4 | Trauma survivors | Judy: 7 years; Marisa: multiple years with shift after year 1 | years | structural |
| mia-psychoanalytic-beats-cbt | 4 | Chronic depression + trauma | PAT: median 242 sessions; CBT: median 59 sessions; PAT advantage at 5-year FU | both | mixed |
| myptsd-2019-how-long-therapy | 5 | PTSD/CPTSD | 8 months to 27 years (range across posters) | years | implicit |
| myptsd-2021-how-long-therapy-2 | 5 | PTSD/CPTSD | 1+ to 20+ years; quality > quantity; episodic engagement | years | mixed |
| myptsd-2024-emdr-cptsd-duration | 5 | CPTSD using EMDR | 7 months to 5+ years (even with EMDR, years not sessions) | years | mixed |
| myptsd-2020-session-frequency | 5 | PTSD/CPTSD | Frequency: monthly to twice-weekly; shaped by attachment, not protocol | frequency data | not-defined |
| myptsd-2015-cant-afford-therapy | 5 | PTSD/CPTSD (unable to afford) | N/A — access barrier prevents treatment entirely | N/A | not-defined |
| foo-2022-what-my-bones-know | 6 | CPTSD | 8+ years with first therapist before diagnosis; additional years after; $6,400 pro bono | years | structural |
| walker-2013-complex-ptsd | 6 | CPTSD | 40+ year healing journey | years/decades | structural |
| levine-2024-autobiography-of-trauma | 6 | Childhood trauma | 40+ year arc from trauma to "healed healer" | decades | structural |
| eger-2017-the-choice | 6 | Holocaust/complex trauma | 35 years before beginning full processing; healing described as ongoing at 90+ | decades | structural |
| anderson-2024-to-be-loved | 6 | Childhood abuse | Multi-decade trajectory; "everlasting healing journey" | decades | structural |

<!-- Reddit threads added 2026-03-19 -->
| reddit-2023-how-long-in-therapy | 5 | CPTSD | 2-13+ years across posters; several frame as lifelong | years | implicit (lifelong maintenance) |
| reddit-2024-what-feels-like-after | 5 | CPTSD | 11 years (5 behavioural + 6 emotional healing) | years | structural |
| reddit-2023-fully-healed-how-long | 5 | CPTSD | 3.5 years (fastest "full healing" claim) to lifelong management | years | mixed |
| reddit-2025-full-cure-how-long | 5 | CPTSD | Years of self-reflection + 1-week EMDR intensive; weeks of AI-assisted processing | mixed | mixed |
| reddit-2023-7-therapists-average | 5 | CPTSD | Implicit — years lost in escalation gap (1-30+ therapists cycled) | implicit | implicit |
| reddit-2021-cant-heal-while-surviving | 5 | CPTSD | 3+ years (OP, stalled by ongoing exposure); "many many years" (u/Senior_Octopus) | years | implicit |
| reddit-2021-how-long-after-therapy-feel | 5 | CPTSD | 1 month (OP, in crisis); 15+ years of suppression before therapy | years | implicit |
| reddit-2024-recovered-cptsd | 5 | CPTSD | 5 years weekly/biweekly (EFT -> IFS -> psychodynamic); therapist-confirmed recovered | both | structural |
| reddit-2025-stages-healing-stage3 | 5 | Trauma | Stage 3 described as "painfully slow" — longest phase; overall duration not specified | implicit | structural |
| reddit-2024-10-years-900-appointments | 5 | Long-term therapy | 5-15 years across posters; 900+ sessions (OP, twice weekly for 10 years) | both | not-defined |

## Duration estimates by layer

### Layer 1: Academic and clinical literature

**Trauma-clinical (1a):** The most directly relevant sources describe treatment durations of 1-5 years for dissociative disorders (Griffiths 2025), with DID projected at 3-5 years. Links (2015) provides shorter milestones for BPD (6wk-18mo) but explicitly acknowledges non-responders need escalation. Herman (1992) describes safety phase alone as "months to years" and reconnection as lifelong.

**Psychoanalytic (1b):** Duration is implicit in developmental metaphors. Kohut's transmuting internalization, Winnicott's "no short cut," Fonagy's mentalizing development, and Bromberg's self-state expansion all describe inherently extended processes. Bateman & Fonagy (2008) provides the hardest data: 36 months of treatment with gains still growing at 8-year follow-up.

**Humanistic-existential (1c):** Murphy (2009) provides the most detailed single-case data: 160 sessions over ~5 years. Sohal (2022) establishes a minimum of 15 sessions for significant change. Hauser (2022) documents forced termination at 48 sessions with work incomplete.

**Neuroscience (1d):** No explicit duration data. All sources explain mechanism (WHY change is slow) rather than timeline (HOW LONG). Key arguments: experience-dependent brain maturation (Schore), autonomic reorganization (Porges), bottom-up sequential repair (Perry), multi-system disruption (Lanius), accumulation of implicit relational shifts (BCPSG), and treatment resistance in maltreated populations (Teicher).

### Layer 2: Naturalistic outcome studies

The empirical data converge on a dose-response relationship moderated by severity:
- General psychiatric: 50% at 8 sessions, 75% at 26, 85% at 52 (Howard 1986)
- PD specifically: 50% at 92 sessions / 1.3 years, 75% at 216 sessions / 2.2 years (Perry via Leichsenring 2013)
- Lambert via Shedler: 50% at 21 sessions, 75% at 40+ sessions
- LTPP (>=50 sessions/1 year) superior to shorter therapy for complex disorders (Leichsenring 2011)
- Helsinki 10-year: PA (646 sessions) and LPP (232 sessions) converged at 10 years (Lindfors 2019)
- Sleeper effect confirmed across multiple sources: gains grow after treatment ends (Shedler 2010, Fonagy 2015, Bateman & Fonagy 2008)

### Layer 3: Counterpoint

The strongest challenges come from EMDR and pharmacologically-assisted therapies:
- EMDR intensive: 8 days for 88% CPTSD remission (Voorendonk via de Jongh 2024)
- EMDR outpatient: 16 sessions for 70% PTSD loss (van Vliet via de Jongh 2024)
- EMDR case: 10 sessions / 5 weeks for CPTSD + BPD resolution (de Jongh 2023)
- MDMA: 18 weeks for 67% PTSD loss (Mitchell 2021)
- Ketamine + WET: ~3 weeks for d=1.9 effect (Feder 2025)
- Intensive delivery: 1-3 weeks, d=1.57, dropout only 5.51% (Sciarrino 2020)
- ISTDP: mean 8.3 sessions for GAD (Lilliengren 2017)
- Paris (2020): most PD improvement by 20 weeks

Critical caveat from Farina (2025): experienced clinicians state that "such quick good outcomes cases are rare" and typical CPTSD+PD cases are "complex, difficult and time-consuming."

### Layer 4: Practitioner essays

- Blue Knot: "may last for decades, whether provided continuously or episodically"
- Auer traumalescence: 3-6 months awareness, 6-18 months neural strengthening, 18 months-3 years integration
- Shedler & Gnaulati: 6 months for 50% change, 1 year for 75%, 2+ years with no ceiling
- Ferentz: case examples of 7 years (Judy), multiple years (Marisa)
- Alpern: "cannot be resolved in six sessions of anything"

### Layer 5: Client narratives

Self-reported durations from forum threads: 8 months to 27 years. Even clients using EMDR for CPTSD report 2-5+ years, not the 8-16 sessions from RCTs (myptsd-2024-emdr-cptsd-duration). Episodic engagement is common. Quality of therapeutic relationship matters more than quantity of sessions.

### Layer 6: Memoirs

Multi-decade trajectories: Foo (10+ years of therapy), Walker (40+ years healing journey), Levine (40+ years), Eger (35 years before full processing, ongoing at 90+), Anderson ("everlasting healing journey").

<!-- New sources added 2026-03-19 -->
| spring-2020-recovering-developmental-trauma | 6 | DID/complex developmental trauma | 9.5 years therapy; developmental analogy implies 18-25 year arc | years | functional |
| spring-2020-what-does-recovery-look-like | 6 | DID/complex developmental trauma | 15 years (breakdown to "good life"); references others in therapy 10-30 years | years | functional |
| spring-2021-falling-down-getting-back-up | 6 | DID/complex developmental trauma | ~9 years first episode + ~3 years stable + second episode ongoing; ~15 years total elapsed | years (episodic) | functional |
| fisher-cutting-edge-tist | 4 | Complex PTSD/DESNOS | Not specified; implicitly long-term through stabilisation-first model and refusal of rapid-processing EMDR | implicit | structural |
| fosha-2019-aedp-intimacy | 3 | Trauma/attachment-injured adults | 6-session complete treatment on DVD; within-session transformation; no multi-year timeline specified | sessions | mixed |
| fisher-transforming-legacy | 1a | Complex PTSD/childhood trauma | Not specified; "slower is faster" principle; workbook is preparation for processing modalities — total arc implicitly long | implicit | structural |
| heacock-2022-psychotherapy-twice-told | 4 | CSA, attachment disruption, transgender identity | 15 years (ongoing); trust-building ~3 years; initial mandated 8 sessions; ~1-year gap | years | implicit (relational) |
| heacock-2019-healing-psychedelics | 4 | Early childhood neglect/dissociative attachment | 4-5+ years conventional (2.5yr somatic + 1.5-2yr attachment) + MDMA; conventional somatic: 6-12mo per core issue | both | implicit |
| bisson-2024-recognising-cptsd | 1a | C-PTSD (UK epidemiological) | Implicitly years to decades; lived experience: ~10 years ongoing, still symptomatic at 53; C-PTSD has lower recovery rates than PTSD | implicit | mixed |
| tilson-2025-body-not-keeping-score | 3 | General/trauma critique | No explicit data; undermines theoretical basis for extended somatic processing; "many people turn out okay" without specialized intervention | N/A | not-defined |
| ogden-2006-trauma-and-the-body | 1d | Adults with unresolved trauma | No explicit data; hierarchical processing model implies extended treatment — lower-level (sensorimotor) patterns are "read-only memory," hardest to change | implicit | implicit (structural) |

### Layer 6 (updated): Memoirs

Spring adds three closely documented data points: 9.5 years of therapy (spring-2020-recovering-developmental-trauma), a 15-year total arc from suicidal DID to "good life" (spring-2020-what-does-recovery-look-like), and an episodic pattern with two distinct therapy episodes separated by 3 years of stable functioning (spring-2021-falling-down-getting-back-up). Spring's developmental-rate metaphor reframes the 9.5-year timeline as equivalent to normal child development — slow because it must be slow, not because therapy failed. The episodic pattern complicates single-arc duration reporting: the question is not just "how long" but "how many episodes, over what total span?"

### Layer 4 (updated): Practitioner essays

Heacock-2022-psychotherapy-twice-told adds a 15-year single-therapist case with granular trust-building data: approximately 3 years before the client stopped hiding behind anger. Heacock-2019-healing-psychedelics provides Razvi's personal 4-5+ year trajectory across multiple modalities (talk → somatic → attachment → MDMA), with the clinical observation that conventional somatic therapy takes 6-12 months per core issue. Fisher (fisher-cutting-edge-tist) argues implicitly for extended timelines through her stabilisation-first model and refusal of EMDR for complex trauma populations.

### Layer 3 (updated): Counterpoint

Fosha (fosha-2019-aedp-intimacy) provides the strongest counterpoint to multi-year timelines: a 6-session complete treatment documented on DVD, and the theoretical position that healing begins "from the get-go." However, AEDP does not claim that complex developmental trauma resolves in 6 sessions — it claims that transformation begins immediately. Tilson (tilson-2025-body-not-keeping-score) challenges the body-based rationale for extended treatment by debunking the neuroscientific frameworks (triune brain, polyvagal theory) underlying van der Kolk's work. The challenge is to mechanism, not to timeline per se.

### Layer 1a (updated): Trauma-clinical

Bisson (bisson-2024-recognising-cptsd) adds epidemiological context: C-PTSD is more common than PTSD in the UK and has lower recovery rates. The lived experience case (Davitt, age 53) remains symptomatic after ~10 years of active work. Fisher's workbook (fisher-transforming-legacy) crystallises the "slower is faster" principle and positions stabilisation as a substantial pre-treatment phase.

### Layer 1d (updated): Neuroscience

Ogden (ogden-2006-trauma-and-the-body) adds theoretical weight to the duration argument: trauma is encoded at the sensorimotor level, which is characterised by "greater fixity and concreteness" — "read-only memory" that is harder and slower to change than cognition. The hierarchical model (sensorimotor → emotional → cognitive) implies sequential processing that adds time to treatment.
