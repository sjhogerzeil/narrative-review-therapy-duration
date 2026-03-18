# Execution plan

This file describes **what to do and in what order**. The research design and methods documentation live in `2_methods/`. This file is the workflow — the sequence of phases, their dependencies, and the gates between them.

## Execution resilience

### Chunking: one layer per work session

A single Claude Code session cannot execute the entire Phase 1. Plan for **one layer per session**, with natural pause points between layers. Each session:

1. Reads `progress.md` to determine what's next
2. Executes one layer (search + annotation) or a portion of one layer
3. Commits all work to git
4. Updates `progress.md` with current state
5. Ends cleanly — the next session picks up from `progress.md`

For large layers (1a trauma-clinical: budget 10-15), split into two sessions: search stubs first, annotation second.

### Internet failures

If MCP calls or WebFetch fail mid-session:
- **Transient failure** (timeout, 503): retry once. If it fails again, log the source as `access: inaccessible` with a note "network error — retry next session" and move on.
- **Persistent failure** (no internet): commit all work done so far, update `progress.md`, stop. The next session resumes from the last committed state.
- **Partial annotation**: if an annotation is interrupted mid-source, the stub exists with whatever YAML was filled. The next session can detect incomplete annotations (body sections still contain template placeholders) and resume.

### Session recovery

All state is on disk. A fresh session recovers by:
1. `progress.md` — what phase/layer is current, what's done, what's waiting
2. `99_search/index.md` — which sources are annotated and their status
3. Layer READMEs — search logs, annotated sources tables, saturation notes
4. `todo.md` — what's waiting for human input (full texts, media downloads)
5. `execution_log.md` — issues from previous sessions

### Git as checkpoint

Commit after every meaningful work chunk (not every file write, but after completing a search batch or annotating a source). This means:
- If a session crashes, at most one source annotation is lost
- The user can `git log` to see exactly what was done when
- `git diff HEAD` shows uncommitted work from an interrupted session

### What to do on resume

```
1. Read progress.md
2. git status              — any uncommitted work from crashed session?
3. If uncommitted work:    — review, commit or discard
4. Read the current layer's README
5. Continue from where the table shows incomplete work
6. Update progress.md when done
```

## Phase overview

```
Phase 0  Setup                          ✓ complete
Phase 1  Search & annotate              → 3_results/sources/
Phase 2  Extract                        → 3_results/primary/, secondary/
Phase 3  Synthesis pass                 → emergent constructs, pattern identification
Phase 4  First-pass discussion          → 4_discussion/ (drafts)
   ↺     Back to Phase 1/2 if gaps found
Phase 5  Tables & figures               → 5_tables_and_figures/
Phase 6  Finalize discussion            → 4_discussion/ (final)
Phase 7  Write introduction             → 1_introduction/ (finalize)
Phase 8  Write abstract                 → 0_abstract/
Phase 9  Audit & finalize               → references, consistency check
```

## Phase details

### Phase 0: Setup ✓

Project structure, methods documentation, templates, protocols, sync script. **Complete.**

Output: everything currently committed.

---

### Phase 1: Search & annotate

**Goal:** Populate `3_results/sources/` with annotated source notes across all 6 layers.

**Process:**
1. Work through layers in order: Layer 2 (naturalistic) first — the empirical backbone gives calibration for interpreting other layers. Then Layer 1 (academic), Layer 3 (counterpoint), Layer 4 (practitioner), Layer 5 (client narratives), Layer 6 (memoirs).
2. For each layer, execute two sub-phases:
   - **1a. Search:** Search-agent creates source stubs. See `2_methods/14_agent_instructions.md` § Search-agent.
   - **1b. Annotate:** Annotation-agent fills source templates. See `2_methods/14_agent_instructions.md` § Annotation-agent.
3. Follow the iterative search protocol (`2_methods/2_search_strategy.md`): search → annotate → extend → log.
4. Apply the annotation protocol (`2_methods/9_annotation_protocol.md`): full template including secondary questions, cross-cutting observations, quality notes.
5. Log inaccessible sources in `todo.md`.
6. Append agent meta-commentary to `execution_log.md`.
7. Run `./sync.sh all` after each batch.

**Human-in-the-loop: full text provision.**
Many academic sources (Layers 1, 2, 3) will be paywalled. After each layer's search sub-phase:
1. The orchestrator presents the user with a list of inaccessible sources from `todo.md`, ranked by expected impact.
2. The user obtains full texts where possible (library access, ILL, colleagues, Sci-Hub, direct author contact) and places PDFs or text files in a `_fulltext/` directory in the layer's source folder.
3. The orchestrator updates `access: provided-manually` on the corresponding stubs and dispatches the annotation-agent.
4. Sources the user cannot obtain remain `access: inaccessible` — their absence is documented in the discussion.

**This is a natural pause point in the workflow.** The orchestrator should not proceed to annotation until the user has had the opportunity to provide full texts. Layers with mostly freely available content (4, 5, 6) can proceed without this pause.

**Iteration within this phase:**
- Annotating sources will surface new sources (snowball). Follow leads within the source budget.
- If a new secondary question emerges, trigger the re-run protocol (`2_methods/12_rerun_protocol.md`).
- If a prior review is found, follow the prior-review protocol (`2_methods/2_search_strategy.md` § Prior reviews).

**Gate to Phase 2:** All layers have reached their source budget or conceptual saturation. At least 50% of each layer's budget is `access: full` annotations. Saturation notes written in each layer README. Search results summary tables filled in. User has reviewed `todo.md` and provided full texts where possible.

**Deliverables:**
- [ ] Layer 2: naturalistic studies — search complete, user reviewed inaccessible, annotated
- [ ] Layer 1a: trauma-clinical — search complete, user reviewed inaccessible, annotated
- [ ] Layer 1b: psychoanalytic — annotated
- [ ] Layer 1c: humanistic-existential — annotated
- [ ] Layer 1d: neuroscience — annotated
- [ ] Layer 3: counterpoint models — search complete, user reviewed inaccessible, annotated
- [ ] Layer 4: practitioner essays — annotated (mostly open access)
- [ ] Layer 5: client narratives — annotated (open access)
- [ ] Layer 6: memoirs — annotated
- [ ] All search results summaries completed
- [ ] All saturation notes written
- [ ] `todo.md` reviewed by user — remaining inaccessible sources accepted

---

### Phase 2: Extract

**Goal:** Pull structured data from source annotations into the extraction files (`3_results/primary/` and `3_results/secondary/`).

**Process:**
1. For each extraction file, scan all source notes (using YAML headers for relevance) and populate the tables.
2. Primary dimensions: duration, trajectory, turning points, healing definitions, surprises, dropout data, access context.
3. Secondary questions: continuity, modality, therapist, frequency, phase structure, adjuncts.
4. Each row in an extraction table carries its source ID for traceability.

**Gate to Phase 3:** All extraction files populated. No source note without at least one row in an extraction table.

**Deliverables:**
- [ ] `3_results/primary/1_duration.md` — duration table complete
- [ ] `3_results/primary/2_trajectory.md` — trajectory descriptions complete
- [ ] `3_results/primary/3_turning_points.md` — turning points complete
- [ ] `3_results/primary/4_healing_definitions.md` — definitions table complete
- [ ] `3_results/primary/5_surprises.md` — surprises documented
- [ ] `3_results/primary/6_dropout.md` — dropout data aggregated
- [ ] `3_results/primary/7_access.md` — access data aggregated
- [ ] `3_results/secondary/1–6` — all secondary question tables complete

---

### Phase 3: Synthesis pass

**Goal:** Read all extraction files together. Identify patterns, convergences, divergences, and emergent constructs that no single extraction file captures.

**Process:**
1. Read all primary extraction files in sequence. What patterns emerge across dimensions?
2. Read all secondary extraction files. Do they interact? (e.g., does modality-switching correlate with longer duration?)
3. Identify **emergent synthetic constructs** (CIS requirement) — conceptual patterns that cut across predefined dimensions. Document in new extraction files marked `[emergent, iteration N]`.
4. Identify the **strongest and weakest points** of the working thesis. Where does evidence converge? Where does it thin out?
5. Identify **gaps** — secondary questions with sparse data, layers with thin coverage, cross-cutting observations with overwhelmingly "no data" patterns.

**Gate to Phase 4:** Synthesis pass notes written. Emergent constructs documented. Gaps identified — decide whether to return to Phase 1 for targeted re-runs or proceed.

**Decision point:** If gaps are significant enough to weaken key claims, return to Phase 1/2 with targeted searches before proceeding to discussion.

**Deliverables:**
- [ ] Synthesis pass notes (can be in `execution_log.md` or a dedicated file)
- [ ] Emergent constructs documented (new files in `3_results/primary/`)
- [ ] Gap assessment: proceed or re-run?

---

### Phase 4: First-pass discussion

**Goal:** Write initial drafts of all discussion sections from the extraction data.

**Process:**
1. Write `4_discussion/1_synthesis.md` first — the main argument. This is the synthesising argument (CIS), not a thematic summary.
2. Write limitation sections (2–4, 7, 9) next — each draws on its specific extraction data and cross-cutting observation patterns.
3. Write `4_discussion/5_counterpoint_response.md` — directly from Layer 3 source annotations.
4. Write `4_discussion/6_access_and_justice.md` — from access data + the implications of the synthesis.
5. Draft `4_discussion/8_implications.md` — depends on synthesis and limitations.

**Iteration:** Writing discussion will reveal:
- Claims that need more evidence → return to Phase 1 (targeted search)
- Extraction gaps → return to Phase 2
- New questions or constructs → document and decide whether to re-run

**Gate to Phase 5:** All discussion sections have first drafts. Claims are back-referenced to source IDs. Weak points are flagged.

**Deliverables:**
- [ ] `4_discussion/1_synthesis.md` — first draft
- [ ] `4_discussion/2_survivorship_bias.md` — first draft
- [ ] `4_discussion/3_dose_vs_elapsed_time.md` — first draft
- [ ] `4_discussion/4_therapy_vs_life.md` — first draft
- [ ] `4_discussion/5_counterpoint_response.md` — first draft
- [ ] `4_discussion/6_access_and_justice.md` — first draft
- [ ] `4_discussion/7_limitations.md` — first draft
- [ ] `4_discussion/8_implications.md` — first draft
- [ ] `4_discussion/9_inaccessible_sources.md` — first draft

---

### Phase 5: Tables & figures

**Goal:** Create visual representations that support the synthesising argument.

**Process:**
1. Cross-layer evidence matrix — which layers contribute to which dimensions
2. Duration estimate table — reported durations by source, layer, population, endpoint definition
3. Convergence/divergence map — where layers agree and disagree
4. Trajectory typology — if patterns emerged in Phase 3
5. Any additional visualizations suggested by the data

**Gate to Phase 6:** Tables and figures created. Referenced from discussion sections.

**Deliverables:**
- [ ] Tables and figures in `5_tables_and_figures/`
- [ ] Cross-references added to discussion sections

---

### Phase 6: Finalize discussion

**Goal:** Revise discussion sections incorporating tables, cross-references, and insights from visualization. Ensure the synthesising argument is coherent and well-supported.

**Process:**
1. Revise `1_synthesis.md` — integrate tables, strengthen argument, address weak points
2. Revise limitation sections — incorporate "pattern of silence" findings from extraction
3. Add the **critique of the literature as a body** (CIS requirement) — how the field has constructed the question of therapy duration
4. Add the **question evolution** section — how the research question changed through the review (compare `iteration-0-initial` tag with current state)
5. Complete the **reflexivity** section in `2_methods/11_synthesis_method.md`

**Gate to Phase 7:** Discussion is coherent. All claims back-referenced. Limitations honestly stated. Counterpoint fairly engaged.

---

### Phase 7: Write introduction

**Goal:** Finalize `1_introduction/` sections. Written last because the introduction must accurately frame what the review found — you can't write a good introduction until you know the conclusion.

**Process:**
1. Revise `1_background.md` — now informed by what the review actually found
2. Revise `2_population.md` — did the population definition shift during the review?
3. Revise `3_healing_definition.md` — incorporate "definition of healing" as a finding
4. Revise `4_research_questions.md` — document any questions that were added during the review
5. Revise `5_stance.md` — does the honest advocacy stance hold up? Was the thesis confirmed, refined, or challenged?

---

### Phase 8: Write abstract

**Goal:** Create `0_abstract/` with a concise summary of the review.

**Process:**
1. Create `0_abstract/abstract.md`
2. Structure: background (1-2 sentences), methods (1-2 sentences), key findings (2-3 sentences), implications (1-2 sentences), limitations (1 sentence)
3. The abstract is the last thing written because it must accurately represent the final state of the review.

---

### Phase 9: Audit & finalize

**Goal:** Verify integrity of the audit trail, references, and cross-references.

**Process:**
1. Run `./sync.sh check` — verify all sources have citations, all are indexed
2. Run `./sync.sh all` — regenerate references and index
3. Verify audit trail: sample 5-10 discussion claims → trace back through extraction → source note → original source
4. Verify `7_references/references.md` is complete and correctly formatted (APA 7)
5. Review `todo.md` — are all unresolved inaccessible sources documented in `4_discussion/9_inaccessible_sources.md`?
6. Review `execution_log.md` — any unaddressed issues?
7. Final git commit and tag: `iteration-final`

**Optional:** Peer review checkpoint — ask a colleague to review source annotation sample and synthesis.

**Deliverables:**
- [ ] `./sync.sh check` passes
- [ ] Audit trail verified (5-10 sampled claims)
- [ ] References complete
- [ ] Inaccessible sources documented
- [ ] Execution log reviewed
- [ ] Final commit and tag

---

## Methods documentation (reference)

The research design and protocols live in `2_methods/`:

- **Research questions:** `1_introduction/4_research_questions.md`
- **Design:** `2_methods/1_design.md`
- **Search strategy:** `2_methods/2_search_strategy.md`
- **Layer-specific search plans:** `2_methods/3_layer_1_academic.md` through `2_methods/8_layer_6_memoirs.md`
- **Annotation protocol:** `2_methods/9_annotation_protocol.md`
- **Audit trail:** `2_methods/10_audit_trail.md`
- **Synthesis method:** `2_methods/11_synthesis_method.md`
- **Re-run protocol:** `2_methods/12_rerun_protocol.md`
- **Discussion data map:** `2_methods/13_discussion_data_map.md`
