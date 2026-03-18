---
section: synthesis_method
description: "Analytical process (CIS): data reduction → display → comparison → construct generation → synthesising argument. Predefined dimensions + emergent constructs. Reflexivity, saturation, quality weighting."
status: draft
---

# Synthesis method

After source annotation is complete, findings are extracted into `3_results/primary/` and `3_results/secondary/`, then synthesized in `4_discussion/`.

## Primary synthesis dimensions

Data from all source annotations is aggregated along these dimensions:

1. **Duration** — What do different sources say about how long it takes? What's the range? What explains the variation?
2. **Trajectory** — What does the path look like? Linear, nonlinear, spiral, episodic? What are common phases?
3. **Turning points** — What shifts the process? Relational breakthroughs, modality switches, life events, neurobiological thresholds?
4. **Definition of healing** — How do different sources define the endpoint — and how does that definition determine the reported duration?
5. **What doesn't work as expected** — Where does the evidence surprise, complicate, or challenge the working thesis?
6. **Dropout and attrition** — What do sources report about who leaves therapy early, why, and what happens to them? (Feeds survivorship bias discussion.)
7. **Access and context** — What do sources say about financial barriers, insurance, geographic access, and who can actually receive this treatment? (Feeds access/justice discussion.)

## Secondary synthesis dimensions

8. **Continuity vs. interruption** — What does the evidence say about breaks, pauses, resumptions? Is continuity necessary or can interrupted trajectories succeed?
9. **Modality** — Single framework or multiple? What patterns emerge around modality-switching — sequential, parallel, layered?
10. **Therapist(s)** — One long-term relationship or several? What determines when a new therapist is needed?
11. **Frequency and dose** — What session frequencies are reported? Is there evidence that higher frequency shortens calendar duration?
12. **Phase structure** — Do sources describe phases, and if so, how consistent are they across traditions?
13. **Adjuncts** — What non-primary-therapy elements appear in the healing accounts — medication, bodywork, groups, community, creative practice?

## Analytical process

Following Whittemore & Knafl (2005) and CIS methodology (Dixon-Woods et al., 2006), the synthesis proceeds through five stages:

### 1. Data reduction
Extract dimension-specific data from source notes into the extraction files (`3_results/primary/` and `3_results/secondary/`). Each extraction preserves the source ID and page reference for traceability.

### 2. Data display
Create summary tables and visual representations that make cross-layer patterns visible. Planned outputs in `5_tables_and_figures/`:

- **Cross-layer evidence matrix** — which layers contribute to which synthesis dimensions, and where the gaps are
- **Duration estimate table** — reported durations by source, layer, population, and definition of endpoint
- **Convergence/divergence map** — where layers agree and disagree, and what explains the disagreement
- **Trajectory typology** — visual representation of reported healing trajectories (if patterns emerge)

### 3. Data comparison (cross-layer triangulation)
For each synthesis dimension, findings are compared across layers using constant comparison. Convergence across layers (e.g., academic literature, practitioner essays, and client narratives all pointing to 5-10 years) is stronger evidence than any single layer. Divergence is noted and analyzed — it may reflect different populations, different definitions of healing, or different evidence types.

### 4. Emergent synthetic constructs
The predefined dimensions (1–11 above) are the starting framework, not the final categories. During analysis, watch for conceptual patterns that cut across dimensions or that no single dimension captures — new categories that emerge from interpretation across the evidence.

When a synthetic construct emerges:
- Document it in `3_results/primary/` with a new file, marked `[emergent, iteration N]`
- Describe what evidence it integrates and why it requires a new category
- Re-scan relevant sources for data that speaks to the new construct

Examples of what might emerge: "the plateau-and-leap pattern," "the modality-grief cycle," "therapeutic dose vs. developmental readiness."

### 5. Synthesising argument
The final synthesis (`4_discussion/1_synthesis.md`) is not a thematic summary organized by dimension. It is a coherent argument about the temporal structure of healing from complex developmental trauma — integrating evidence from across layers into a theoretical framework. The argument should:
- Make a clear claim, grounded in the evidence pattern
- Show how the claim holds under cross-layer triangulation
- Identify where the claim is strongest and where it is weakest
- Integrate the counterpoint evidence rather than merely rebutting it

## Quality weighting

Sources are not weighted by a formal hierarchy (RCT > cohort > case study). Instead, each source's contribution is assessed in context:

- A well-designed naturalistic study carries more weight on **duration claims** than a single memoir
- A memoir may contribute **conceptual insight** (trajectory shape, turning points) that no study captures
- Practitioner essays carry weight on **clinical wisdom** about what the process looks like, but not on prevalence
- Client narratives carry weight on **lived experience** of trajectory, but suffer from survivorship and selection bias

Quality concerns are noted per source in a `quality_notes` field in the body (not YAML — these are narrative assessments, not categorical). Quality concerns that affect the weight given to a source in the synthesis are made explicit in the discussion.

## Reflexivity

### Positionality
*To be completed by the author.* Describe: clinical role, theoretical orientation, personal relationship to the topic, prior commitments that may shape interpretation.

### How bias is monitored
- The counterpoint layer (Layer 3) is a structural check against confirmation bias
- The cross-cutting observations (survivorship bias, dose vs. time, therapy vs. life) force engagement with methodological weaknesses
- Surprises are documented in `3_results/primary/5_surprises.md` — actively seeking and recording disconfirming evidence
- The agent execution log (`execution_log.md`) captures meta-commentary from execution agents that may flag blind spots
- The "no data is a finding" principle forces attention to what sources fail to address

### Saturation
Alongside the quantitative source budgets (see `2_search_strategy.md`), a conceptual saturation criterion applies: stop adding sources to a layer when new sources repeat existing patterns without adding new dimensions, challenges, or duration estimates. Document the saturation decision in the layer's README when stopping.

## Question evolution
When the review is complete, add a methodological reflection to the discussion describing how the research question, population definition, and working definition of healing evolved through the review process. The initial question and definitions are preserved in git (tag `iteration-0-initial`); the final versions are in the current state of `1_introduction/`. The gap between them is itself a finding.

## Critique of the literature as a body
Beyond appraising individual sources, the synthesis should examine how the field has constructed the question of therapy duration:
- Why does the RCT literature impose short time horizons?
- What assumptions about healthcare delivery shape the evidence base?
- How does the absence of long-term outcome data reflect institutional priorities?
- What meta-narratives (evidence-based practice, brief therapy movement, insurance economics) have shaped what gets studied?

This critique belongs in `4_discussion/1_synthesis.md` and/or a dedicated section.
