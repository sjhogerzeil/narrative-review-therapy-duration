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
2. `_index/index.md` — which sources are annotated and their status
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
   - **Step A. Search:** Search-agent creates source stubs. See `7_process/14_agent_instructions.md` § Search-agent.
   - **Step B. Annotate:** Annotation-agent fills source templates. See `7_process/14_agent_instructions.md` § Annotation-agent.
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

**If a layer has fewer sources than budget:** If fewer relevant sources exist than the budget allows, document this in the saturation note ("exhausted — only N relevant sources found") and proceed. The 50% `access: full` rule applies to the number actually found, not the planned budget. If after the user's best efforts fewer than 50% are `access: full`, discuss with the user: (a) expand search for alternative open-access sources, (b) accept abstract-only as sufficient for some, or (c) accept thinner evidence and document prominently.

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

**Verification step (added after Phase 2 gap discovered 2026-03-19):** Before proceeding to Phase 3, run this check:
```bash
# List all annotated source IDs
find 3_results/sources -name '*.md' ! -name 'README.md' ! -name 'SOURCE_TEMPLATE.md' ! -path '*_reddit_raw*' ! -path '*_fulltext*' ! -path '*_media*' -exec grep -l '^id:' {} \; | while read f; do grep '^id:' "$f" | head -1; done | sort > /tmp/all_sources.txt

# List all source IDs appearing in extraction tables
grep -roh '[a-z].*-[0-9]\{4\}-[a-z].*' 3_results/primary/*.md 3_results/secondary/*.md | sort -u > /tmp/extracted_sources.txt

# Find sources NOT in any extraction table
comm -23 /tmp/all_sources.txt /tmp/extracted_sources.txt
```
If any sources are missing from all extraction tables, run a targeted extraction before proceeding. This prevents the gap we discovered where sources committed between extraction agent launch and completion were missed.

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

### Phase 3: Synthesis pass (CIS construct generation + synthesising argument)

**Goal (CIS-specific):** This is NOT a summary phase. It is a GENERATIVE phase. The goal is to produce two things that did not exist before this review:
1. **Synthetic constructs** — new conceptual categories that transform the evidence into a new form (Dixon-Woods et al., 2006)
2. **A synthesising argument** — an integrated theoretical framework that resolves the apparent contradictions in the field

**What the synthesis is NOT:** A thematic summary organized by predefined dimensions. That's what the extraction tables already are.

**What the synthesis IS:** A new theoretical framework for understanding therapy duration that explains why the field appears to disagree, what the actual answer is, and what determines duration for whom.

**Process:**

**Step 0: Constant comparison across layers (CIS core method).**
Before formalizing constructs, systematically compare what each layer says about each dimension. For each of the 16 extraction files, ask:
- Do Layers 1-6 converge or diverge on this dimension?
- WHERE they converge: is it because they're studying the same thing, or because independent evidence points the same way (stronger)?
- WHERE they diverge: is it because of different populations, different endpoints, different methods, or genuine disagreement?
- What does one layer reveal that NO other layer captures? (each layer's unique contribution)

Create a **cross-layer comparison matrix** (`3_results/synthesis_pass_comparison.md`):

```markdown
| Dimension | L1a trauma | L1b psychoanalytic | L1c humanistic | L1d neuro | L2 naturalistic | L3 counterpoint | L4 practitioner | L5 client | L6 memoir | Convergence? | Divergence explained by |
```

This matrix IS the constant comparison. Every cell should be filled (even if "no data"). The pattern of filled and empty cells reveals the structure of the evidence base.

**Step 1: Formalize synthetic constructs.** We have already identified emergent constructs through Phases 1-2 (logged in execution_log.md). Formalize each as a named construct with:
- Definition (1-2 sentences)
- Evidence base (which sources, which layers)
- How it emerged (what cross-layer comparison produced it)
- Status: confirmed / provisional / hypothesis

Known constructs to formalize:
- Endpoint divergence (central)
- Sleeper effect
- Developmental mechanism convergence
- Treatment-engagement paradox
- Escalation gap
- Safety as clock-starter
- The Farina resolution
- RCT-reality gap
- Identity dimension
- Access silence

**Step 2: Construct the synthesising argument.** Write a 1-page theoretical framework that integrates the constructs. This is the review's original contribution. Draft format:

```
THE ENDPOINT-DURATION NEXUS: A FRAMEWORK

[Thesis statement: 2-3 sentences answering the primary question]

[Framework: how the 3 interacting factors determine duration]
  Factor 1: Level of change sought (symptom → functional → structural → identity)
  Factor 2: Structural depth of patient's dissociative organization
  Factor 3: Elapsed time for developmental processes (sleeper effect)

[Why the field appears to disagree: endpoint divergence explains most of the variance]

[What the framework cannot explain: limits and open questions]
```

**Step 3: Test the argument against counterevidence.** Explicitly check:
- Does the framework account for EMDR 88% CPTSD remission in 8 days?
- Does it account for the Helsinki convergence (3x dose → same outcome)?
- Does it account for the treatment-engagement paradox (who needs most drops out)?
- Does it account for Paris's access argument?
- Where does it break down?

**Step 4: Critique the literature as a body (CIS requirement).** This is NOT about individual source quality. It asks:
- WHY has the field framed duration as a single-number question?
- What meta-narratives (evidence-based practice, insurance economics, brief therapy movement) shaped the evidence base?
- Why is there almost no research specifically on our defined population?
- Why is access virtually never discussed in duration research?

**Step 5: Strength/weakness assessment.** For each claim in the synthesising argument:
- How many layers support it?
- How many sources?
- What is the strongest counterargument?
- What would change the conclusion?

**Output:** Write all of the above into `3_results/synthesis_pass.md` (new file).

**PAUSE — HUMAN CHECKPOINT:** Present the synthesising argument to the user. The user decides:
- Is the argument convincing?
- Does it need refinement?
- Are there gaps that require returning to Phase 1/2?
- Proceed to Phase 4?

**Gate to Phase 4:** Synthesising argument written and approved by user. Synthetic constructs formalized. Critique of literature drafted. Strength/weakness assessment complete.

**Deliverables:**
- [ ] `3_results/synthesis_pass.md` — the theoretical framework
- [ ] Synthetic constructs formalized (updated extraction files or new files)
- [ ] Critique of literature as a body (draft, will be expanded in Phase 4)
- [ ] Strength/weakness assessment
- [ ] Gap assessment: proceed or iterate?

---

### Phase 3→4→5 iteration protocol

Phases 3, 4, and 5 are NOT strictly sequential. Insights from writing discussion (Phase 4) or creating figures (Phase 5) may reveal gaps or sharpen the synthesis (Phase 3). The iteration protocol:

```
Phase 3 (synthesis) → present to user → approved?
  ├── YES → Phase 4 (discussion drafts)
  │         ├── Writing reveals weak claim → back to Phase 2/3 (targeted extraction or argument revision)
  │         ├── Writing reveals missing source → back to Phase 1 (targeted search)
  │         └── All sections drafted → Phase 5 (figures)
  │                ├── Visualization reveals pattern not in synthesis → back to Phase 3 (argument revision)
  │                └── Figures created → Phase 6 (finalize)
  └── NO → revise argument → re-present
```

Each backward loop:
1. Document what triggered it in `execution_log.md`
2. Make the minimum change needed (don't redo entire phases)
3. Commit before and after the change
4. Update the affected extraction/discussion files (append-only)

**Circuit breaker:** Maximum 3 backward loops per phase. If a claim cannot be supported after 3 attempts, move it to limitations rather than searching indefinitely.

---

### Phase 4: First-pass discussion

**Goal:** Write initial drafts of all discussion sections. Each section elaborates one aspect of the synthesising argument from Phase 3.

**Input:** The synthesising argument (`3_results/synthesis_pass.md`) is the backbone. Each discussion section develops one part of it, grounded in the extraction data.

**Process:**
1. Write `4_discussion/1_synthesis.md` first — this is the full synthesising argument from Phase 3, expanded with evidence, quotes, and cross-layer triangulation. NOT a thematic summary — an ARGUMENT.
2. Write limitation sections (2–4, 7, 9) — each has its own scaffold already. Fill the "feed-back into the plan" sections with actual findings.
3. Write `4_discussion/5_counterpoint_response.md` — use the Phase 3 strength/weakness assessment. Engage the EMDR counterpoint honestly through the Farina resolution.
4. Write `4_discussion/6_access_and_justice.md` — the access silence finding is strong. Use the extraction data from `7_access.md`.
5. Draft `4_discussion/8_implications.md` — decompose by endpoint level (what does the framework imply for clinical practice at each level of change?).

**Back-references:** Every claim must reference source IDs. Use format: `[source-id]`.

**Iteration triggers:**
- A claim in the synthesis has fewer than 3 supporting sources → flag as weak, consider Phase 1 targeted search
- A limitation section reveals that the thesis cannot address a gap → revise the synthesising argument (Phase 3)
- The counterpoint response feels dismissive rather than honest → revise the framing

**Gate to Phase 5:** All 9 discussion sections have first drafts. Claims are back-referenced. Weak points are flagged. The synthesising argument in `1_synthesis.md` reads as a coherent argument, not a list.

**Deliverables:**
- [ ] `4_discussion/1_synthesis.md` — first draft (the argument)
- [ ] `4_discussion/2_survivorship_bias.md` — first draft
- [ ] `4_discussion/3_dose_vs_elapsed_time.md` — first draft
- [ ] `4_discussion/4_therapy_vs_life.md` — first draft
- [ ] `4_discussion/5_counterpoint_response.md` — first draft
- [ ] `4_discussion/6_access_and_justice.md` — first draft
- [ ] `4_discussion/7_limitations.md` — first draft
- [ ] `4_discussion/8_implications.md` — first draft
- [ ] `4_discussion/9_inaccessible_sources.md` — first draft
- [ ] Weak claims log (which claims need strengthening?)

---

### Phase 5: Tables & figures

**Goal:** Create visual representations that make the synthesising argument visible. Figures serve the argument — they don't just display data.

**Input:** The synthesising argument (Phase 3), the discussion sections (Phase 4), and the extraction tables (Phase 2).

**Process:**

**Table 1: The endpoint-duration nexus** (the central figure)
- Rows: endpoint levels (symptom reduction, functional improvement, structural change, growth/identity)
- Columns: typical duration range, evidence sources by layer, example measures, number of sources
- This IS the synthesising argument in visual form

**Table 2: Duration estimates across all sources**
- One row per source with explicit duration data (from `1_duration.md`)
- Columns: source ID, layer, population, duration, sessions/years/both, endpoint

**Table 3: Cross-layer evidence matrix**
- Rows: synthesis dimensions + secondary questions
- Columns: layers 1a through 6
- Cells: number of sources contributing + key finding
- Shows where evidence converges and where gaps exist

**Figure 1: Trajectory typology**
- Visual representation of the 5 trajectory shapes (dose-response, sleeper, spiral, episodic, rapid)
- Each annotated with which populations/modalities it applies to

**Table 4: Synthetic constructs**
- Each construct: name, definition, evidence base, which layers confirm it

**Table 5: Counterpoint comparison**
- Model | Population studied | Endpoint measured | Duration claimed | Applicable to our population?

**Iteration trigger:** If creating a figure reveals that a pattern is stronger or weaker than the text claims, flag for Phase 3/4 revision.

**Gate to Phase 6:** All tables/figures created. Each is referenced from at least one discussion section. No figure contradicts the synthesising argument (if it does, revise the argument, not the figure).

**Deliverables:**
- [ ] Tables and figures in `5_tables_and_figures/`
- [ ] Each figure referenced from discussion sections
- [ ] Iteration notes (did visualization reveal anything new?)

---

### Phase 6: Finalize discussion

**Goal:** Revise discussion sections incorporating tables, cross-references, and insights from visualization. Ensure the synthesising argument is coherent and well-supported.

**Process:**
1. Revise `1_synthesis.md` — integrate tables, strengthen argument, address weak points
2. Revise limitation sections — incorporate "pattern of silence" findings from extraction
3. Add the **critique of the literature as a body** (CIS requirement) — how the field has constructed the question of therapy duration
4. Add the **question evolution** section — how the research question changed through the review. Run `git diff iteration-0-initial -- 1_introduction/` to document evolution.
5. **PAUSE — HUMAN CHECKPOINT:** The author must write the **positionality statement** in `2_methods/11_synthesis_method.md` § Reflexivity § Positionality. This cannot be delegated to an agent — it requires the author to declare their clinical role, theoretical orientation, and personal relationship to the topic.
6. After the author completes the positionality statement, finalize the reflexivity section.

**Gate to Phase 7:** Discussion is coherent. All claims back-referenced. Limitations honestly stated. Counterpoint fairly engaged. Positionality statement written by the author.

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
4. Verify `6_references/references.md` is complete and correctly formatted (APA 7)
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
- **Discussion data map:** `7_process/13_discussion_data_map.md`
