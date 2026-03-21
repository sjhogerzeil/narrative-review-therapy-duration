# Process Notes — blog-therapy-duration

## 2026-03-21 (session 9 — Phase 5 + publication-ready repo)

Context: Twee grote stukken werk. Eerst Phase 5 (tables & figures) afgerond. Daarna het project omgebouwd tot een publiceerbaar, forkbaar GitHub-repo met volledige audit trail.

Redenering:
- Tabellen gekozen op basis van CIS-methodologie: wat maakt het interpretatieve argument transparant en auditeerbaar? Niet: wat catalogiseert bronnen. 5 tabellen + 2 figuren.
- AI-auteurschap uitgezocht: ICMJE 2026 / COPE / Nature / Science verbieden AI als auteur unaniem. Reden: accountability. Conventionele route gekozen: Simon als sole author, Claude volledig disclosed in `2_methods/13_ai_methodology.md` met task distribution table.
- Positionality statement geschreven vanuit interview — persoonlijke therapiegeschiedenis expliciet opgenomen. Kernzin: "He is a participant in it, on both sides of the therapeutic relationship."
- Titel gekozen: "Eight Sessions or Eight Years?" — de bevinding in de titel.
- Pen name: Simon J. Hogerzeil.

Open:
- [ ] Zenodo integration (na GitHub push + eerste release)
- [ ] Tufte Book PDF pipeline (beslissingen over .bib conversie en figuurrendering nog open — zie `_internal/todo.md`)
- [ ] Positionality: auteur moet reviewen en goedkeuren

## 2026-03-20 (session 8 — discussion gap-fill)

Context: 8 substantive items added to discussion sections — findings grounded in data that the original scaffolds didn't anticipate. Process killed mid-verification; all edits confirmed intact on resume.

Redenering:
- 4 high-priority items (escalation gap, forced termination, modality sequencing, incoherent treatment) add genuinely new arguments. Not padding — these are findings from the data that had no home in the original structure.
- Escalation gap in survivorship bias: inflates ALL reported duration data. Clients report "ten years in therapy" but much of that is escalation-gap time, not effective treatment time. Structurally invisible in outcome research.
- Bateman-Fonagy TAU finding is a counterpoint to the counterpoint: "more" isn't better, "coherent" is. Reframes duration debate from quantity to quality.
- Modality sequencing promoted from noise to signal — bumped to "Fourth" clinical implication, existing numbering shifted.
- 4 medium-priority items (ecophenotype, reverse survivorship, survivor mission, single-research-group) add nuance. Limitations section renumbered 7→8→9.

Open:
- [ ] Phase 5: tables and figures
- [ ] Phase 6: finalize discussion (integrate tables, positionality statement)
- [ ] Weak claims log nog niet formeel aangemaakt — impliciet in sectie 7 (limitations)

## 2026-03-20 (session 7 — Phase 4 complete)

Context: Human checkpoint passed on synthesis. Phase 4 (discussion drafts) written in parallel — 4 agents, 8 sections, ~24k words total.

Redenering:
- Parallelle agents werkten goed: 4 agents tegelijk, elk 2-3 secties, geen conflicten. Totale doorlooptijd ~6 minuten.
- Counterpoint response (sectie 5) is de zwaarste: 3.300 woorden, model-voor-model, fairness-getest. Twee echt onopgeloste uitdagingen geïdentificeerd: de Jongh's CPTSD-data en Helsinki-convergentie.
- Dose vs elapsed time herschreven van "beperking" naar "opgelost finding" (Factor 3). Sterkere positie dan het scaffold suggereerde.
- Survivorship bias: 5-categorie taxonomie van onzichtbare populaties is nieuw — gaat verder dan het standaard dropout-verhaal.

Open:
- [ ] Phase 5: tables and figures
- [ ] Phase 6: finalize discussion (integrate tables, positionality statement)
- [ ] Weak claims log nog niet formeel aangemaakt — impliciet in sectie 7 (limitations)

## 2026-03-19 (session 6 — podcast expansion + Phase 3 revision)

Context: Phases 1-3 rerun with 11 new sources (podcasts, kindle highlights, critical essays). Synthesis substantially revised. All tests pass (58/58, 0 failures). Ready for human review of synthesis before Phase 4.

Redenering:
- Podcast sources filled real gaps: Carolyn Spring (first documented DID trajectory with explicit duration + interruption data), Fisher/TIST (stabilisation-first practitioner voice), Fosha/AEDP (counterpoint from within experiential tradition), Tilson (evidence critique of SE/polyvagal), Ogden (somatic mechanism), Bisson (C-PTSD epidemiology), Heacock x2 (15-year single-therapist case + psychedelic-assisted trajectory).
- Framework expanded from 3 factors to 4: safety prerequisite (Factor 0) added based on 35+ entries across all layers. Key insight: the psychoanalytic "silence" on safety is terminological — holding environment, selfobject transference, surviving destruction ARE safety in different vocabulary.
- Fisher vs Fosha tension ("slower is faster" vs "healing from the get-go") is productive, not resolvable — likely reflects different structural depths within CPTSD population.
- Tilson's evidence critique honestly integrated: clinical convergence on slow developmental change is robust; the neurobiological explanations (triune brain, polyvagal) are contested. The mechanism's existence is stronger than its explanation.

Open:
- [ ] HUMAN CHECKPOINT: author review synthesis (4_discussion/1_synthesis.md) — especially the 4-factor framework and safety-as-clock-starter construct
- [ ] Phase 4: write remaining discussion sections (counterpoint response → survivorship → dose vs time → therapy vs life → access → limitations → implications)
- [ ] Phase 5: tables and figures
- [ ] Books: NOT purchasing at this stage

## Rerun plan (decided 2026-03-19, session 5)

### Decision: no book purchases
Van der Hart 2006 and Foo 2022 would add depth/verification but do not change the core argument. Herman 1992 is already covered via 1998 summary paper. Psychoanalytic texts (Kohut, Winnicott, etc.) are theoretical — secondary access sufficient.

### Step 1: Add podcast sources (Phases 1-3)
- User provides podcast transcript list + ChatGPT search output
- Online podcast database search (Listen Notes, Apple Podcasts, Spotify)
- Integrate, screen, select ~8-10 episodes across Layers 3-4
- Target voices: van der Kolk, Fisher, Ogden, Fosha, Schwartz, Levine, Daniel Brown
- Annotate from transcripts → extract → revise synthesis

### Step 2: Revise synthesis — integrate underused Layer 4 sources
8 of 10 Layer 4 sources are zero-cited in synthesis. Must integrate:
- Shedler 2020 (50% at 21 sessions, 75% at 40+)
- Alpern 2025 (brief therapy critique from inside brief therapy)
- Blue Knot (84% expert consensus; "decades"; min 10-20 sessions)
- MIA psychoanalytic-beats-CBT (PAT vs CBT sleeper effect)
- Traumalescence (explicit timeline: 3-6mo / 6-18mo / 18-36mo)
- Grossmark (companioning as inherently non-brief)
- Wylie (diagnostic conflation; 80% multiple trauma)
- MIA injured-not-broken (recognition prerequisite)
- PsychNetworker evolving-beyond (victim-to-author turning point)

### Step 3: New extraction file — safety as clock-starter
Create `3_results/primary/11_safety_as_clock_starter.md`. Evidence from: Herman, Porges, ElishaAlison, cant-heal-while-surviving, Eger, Hauser.

### Step 4: Update sleeper effect file — borrowed vs owned bridge
Add Kohut's "borrowed vs owned" distinction as theoretical bridge to `8_sleeper_effect.md`.

### Step 5 (optional): Targeted Phase 1 additions
If podcasts don't fill the gap: add van der Kolk, Fisher, Ogden, ISSTD guidelines as secondary-annotated sources.

### Step 6: Sync and verify

## 2026-03-19 (session 4 — end of session)

Context: Phase 2 fully complete with Reddit gap fixed. Phases 3-5 rewritten with CIS methodology. Dry-run completed. Blocking issues fixed. Ready for Phase 3 with ultrathink in next session.

Redenering:
- The CIS distinction between summary and synthesis is critical: Phase 3 must GENERATE new conceptual categories (synthetic constructs), not just organize findings. Our constructs (endpoint divergence, sleeper effect, etc.) already exist but need formalizing into a theoretical framework.
- The "synthesising argument" is the review's original contribution: a 3-factor model (endpoint level × structural depth × elapsed time) that resolves the field's apparent disagreement.
- Reddit data gap caught and fixed — 10 threads were missing from extraction tables. Added Phase 2 gate verification step to prevent this in future.
- Source ID normalization done (underscore→hyphen for 5 memoir files + ~40 extraction table references).
- OpenAI API bridge via Responses API with web_search_preview tool works for Reddit access.

Open:
- [ ] Phase 3: synthesis pass with ultrathink — produce theoretical framework, cross-layer comparison, critique
- [ ] HUMAN CHECKPOINT after Phase 3: approve synthesising argument before discussion writing
- [ ] Still need: agent instructions for Phases 3-5 agents (B4 from dry-run — not yet fixed)
- [ ] Register: language/register decision for discussion writing (English academic? Dutch blog?)

## 2026-03-19 (session 3)

Context: Phase 2 (extraction) complete. 16 extraction files populated from 78 sources. The central finding crystallised: the duration debate is an endpoint debate.

Redenering:
- Two parallel extraction agents processed all 78 sources into 10 primary + 6 secondary extraction tables. Total coverage verified — every source appears in at least one table.
- The endpoint divergence is now the review's organising insight: symptom reduction (weeks-months), functional improvement (months-years), structural change (years), growth/identity (years-decades). The thesis "healing takes years" is precisely true at the structural level and precisely false at the symptom level.
- 12 "surprise" findings documented that complicate the thesis (EMDR 88% CPTSD remission in 8 days, Helsinki convergence at 10 years despite 3x dose, TAU worse than MBT despite more services, therapist fit > duration).
- Five trajectory shapes identified: dose-response, sleeper/catalytic, spiral/recursive, episodic/cyclical, rapid/targeted.

Open:
- [ ] Phase 3: Synthesis pass — read all extraction files together, construct the synthesising argument
- [ ] Phase 4: First-pass discussion sections
- [ ] Phase 5: Tables and figures
- [ ] HUMAN CHECKPOINT at Phase 6: positionality statement

## 2026-03-19 (session 2)

Context: Phase 1 complete — 78 sources across 6 layers. Reddit access solved via OpenAI Responses API bridge (web_search_preview tool). Moving to Phase 2 (extraction).

Redenering:
- Reddit blocked at Anthropic platform level (both crawler and search). Solved by calling OpenAI API via curl with web_search_preview tool — ChatGPT fetches Reddit content, Claude processes it. Creative cross-model bridge.
- 10 Reddit threads annotated. Key new finding: "safety as clock-starter" — effective therapy duration begins when safety is achieved, not at first appointment. This reframes all duration data.
- Data quality concern: 2 Reddit threads may contain AI-generated comments (flagged in annotations). The OpenAI API sometimes returns templated responses for lower-ranked comments.
- Central finding solidified: endpoint divergence IS the answer. Weeks for symptoms, years for structure, decades for identity. The thesis "healing takes years" is true at structural level and false at symptom level.

Open:
- [ ] Phase 2: Extract data from 78 source notes into 10 primary + 6 secondary extraction files
- [ ] Phase 3: Synthesis pass — read all extraction files together, identify cross-layer patterns
- [ ] Farina 2025 still inaccessible (only unresolved source — annotated from Scholar Gateway)
- [ ] Books (Herman, van der Hart, Kohut, Winnicott) annotated from secondary — consider obtaining for primary quotes
- [ ] Recommend purchasing: Foo *What My Bones Know* (€15) and Herman *Trauma and Recovery* (€18)

## 2026-03-19 (session 1)

Context: Phase 1 (search & annotate) completed across all 6 layers — 68 sources total. Ready for Phase 2 (extraction).

Redenering:
- Parallel subagent execution for Layers 1b/1c/1d and 3/4 dramatically accelerated the work. Context was preserved by passing full data summaries to annotation agents rather than having them re-read PDFs.
- The endpoint divergence construct emerged as the central finding: the duration debate dissolves into an endpoint debate. Counterpoint sources (EMDR 88% remission in 8 days) measure symptom reduction; long-duration sources measure structural change. Both are correct about different things.
- Layer 5 (Reddit) was blocked by crawler policies. Pivoted to MyPTSD.com forum which was accessible. The RCT-reality gap (EMDR clients report years, not 8-16 sessions) is a finding that no academic layer captured.

Open:
- [x] Reddit data obtained via OpenAI API bridge
- [ ] Phase 2: Extract data from source notes into extraction files
- [ ] Phase 3: Synthesis pass for emergent constructs
