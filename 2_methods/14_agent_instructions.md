---
section: agent_instructions
description: "Concrete instructions for search-agents and annotation-agents — tool usage, handoff protocol, stopping rules, confidence indicators, disambiguation of ambiguous fields"
status: draft
---

# Agent execution instructions

This file provides concrete, unambiguous instructions for AI agents executing the research plan. It supplements the methods files with operational detail.

## Safety limits — circuit breakers

These hard limits prevent runaway agents from filling disk or creating unbounded output.

### File count limits

| Directory | Max files | Action if exceeded |
|-----------|-----------|-------------------|
| Any single layer/sublayer source dir | 20 | Stop. Log in execution_log.md. Do not create more files. |
| `3_results/sources/` total | 150 | Stop all search agents. Review with orchestrator. |
| `3_results/primary/` | 15 | Stop. This should never exceed the number of dimensions. |
| `3_results/secondary/` | 15 | Stop. Same. |
| `_media/` per layer | 10 | Stop. Flag for human review. |

### File size limits

| File | Max size | Action if exceeded |
|------|----------|-------------------|
| Any single source note .md | 50 KB | Something is wrong. Stop annotating this source. Trim or split. |
| `execution_log.md` | 100 KB | Archive to `6_appendix/execution_log_archive_[date].md`, start fresh. |
| `todo.md` | 50 KB | Review with human — too many inaccessible sources suggests a scope problem. |
| Any transcript in `_media/` | 500 KB | Acceptable for long podcasts. Over 1 MB: truncate to relevant sections only. |

### Per-session limits

- **Max source stubs created per session:** 20
- **Max source annotations per session:** 10
- **Max WebFetch calls per session:** 50
- **Max PubMed searches per session:** 30

If an agent approaches these limits, it must commit current work, update `progress.md`, and stop cleanly.

### Self-check before writing

Before creating a file, the agent must verify:
1. The target directory exists
2. The file does not already exist (don't overwrite — append-only semantics)
3. The file count in that directory is below the limit

```bash
# Quick check: how many .md files in a directory?
find 3_results/sources/2-naturalistic-studies -name '*.md' | wc -l
```

If the count is at the limit, stop and log: "Source budget exhausted for [layer]. Not creating more files."

## Tool usage by database

| Database | Tool to use | Notes |
|----------|-----------|-------|
| PubMed | `mcp__claude_ai_PubMed__search_articles`, `mcp__claude_ai_PubMed__get_full_text_article`, `mcp__claude_ai_PubMed__get_article_metadata` | Use search for discovery, get_full_text for open-access articles, get_article_metadata for citation details |
| Google Scholar | `mcp__claude_ai_Scholar_Gateway__semanticSearch` | For broader discovery, especially grey literature |
| Cochrane Library | `WebSearch` or `WebFetch` | No MCP tool; search via web |
| PsycINFO | `WebSearch` | No MCP tool; search via web |
| Substack / Medium / blogs | `WebSearch` then `WebFetch` for full text | Layer 4 sources |
| Reddit | `WebSearch` with `site:reddit.com` | Layer 5 sources |
| Amazon / Goodreads | `WebSearch` | Layer 6 — finding memoirs, not purchasing |

## Search-agent instructions

### What the search-agent produces

The search-agent produces **two artifacts** per batch:

1. **Rows in the layer README search log** — date, database, search terms, number of results, notes
2. **Minimal source note stubs** — one `.md` file per relevant source, placed in the correct layer directory, with YAML frontmatter only (no body sections filled)

The stub contains all YAML fields populated from available metadata (title, author, year, citation, DOI/URL, access status). Body sections are left as template placeholders. This is the handoff artifact for the annotation-agent.

### Search workflow

1. **Named sources first.** If the layer methods file lists specific studies to locate (e.g., "Leichsenring & Rabung 2008"), search for these by author name first. These are high-priority.
2. **General search terms second.** Run each search term from the layer methods file. Screen results against inclusion criteria.
3. **Screen against inclusion criteria.** The source must address the population (complex developmental trauma, not single-incident PTSD) and the question (duration, trajectory, or temporal experience of healing). When in doubt, include — the annotation-agent can exclude later.

### When search returns too many results (>30 per search term)

A PubMed search for "complex PTSD long-term treatment" may return hundreds of results. Do not attempt to screen all of them. This is a **human-in-the-loop decision point**.

#### Step 1: Agent screens and recommends

Sort results by relevance or citation count. Screen titles of the first 50 results. For each potentially relevant result, assign a tier:

| Tier | Criteria | Recommendation |
|------|----------|---------------|
| **1 — Include** | Directly measures/reports therapy duration for the defined population; meta-analysis or systematic review of duration/outcomes; named in the layer methods file; cited by 3+ sources already in the project | Create stub |
| **2 — Recommend** | Addresses the population but duration is secondary; theoretical paper modelling why treatment is long/short; reports on a modality relevant to secondary questions | Present to user |
| **3 — Exclude** | Single-incident PTSD; protocol papers without outcome data; populations outside definition; duplicate content | Log in excluded sources |

#### Step 2: Present shortlist to user

After screening, the agent presents the user with:

```markdown
## Search results for [layer]: [search term]

**Total results:** [N]
**Titles screened:** [N]
**Budget remaining:** [N]

### Tier 1 — recommended for inclusion (creating stubs)
1. [Author (Year)] — [Title] — [why: directly measures duration for complex trauma]
2. ...

### Tier 2 — potentially relevant, your call
3. [Author (Year)] — [Title] — [why: addresses population, duration mentioned in abstract]
4. [Author (Year)] — [Title] — [why: relevant modality, no duration data visible]
5. ...

### Tier 3 — recommending exclusion
6. [Author (Year)] — [Title] — [why excluding: single-incident PTSD population]
7. ...
```

The user selects which Tier 2 sources to include. Tier 1 sources are created as stubs immediately. Tier 3 sources are logged in `6_appendix/excluded_sources.md`.

#### Step 3: Log ALL identified sources — included and excluded

Every source identified as potentially relevant must be accounted for. CIS methodology requires that source selection decisions are transparent and defensible.

- **Included sources** → stub in `3_results/sources/[layer]/`
- **Excluded sources** → entry in `6_appendix/excluded_sources.md` with reason for exclusion

This creates the audit trail from "found" to "included/excluded" that a reader needs to evaluate the review's source selection.

#### For Reddit/forum searches (Layer 5)

Sort by "top" or "most comments." Screen thread titles. Present the user with a shortlist of threads with 20+ comments or explicit duration mentions. Skip and log: short threads, crisis posts, threads focused on specific techniques without temporal data.

#### For large book bibliographies (snowball from Layer 1)

When a source cites 30+ potentially relevant references, do not chase all of them. Present the top 10 (by estimated relevance to duration question) to the user, with reasons. Log the rest in `6_appendix/excluded_sources.md` as "identified via snowball from [source-id], not pursued — budget constraint."
4. **Determine access status.** For each relevant result:
   - Try `get_full_text_article` (PubMed). If it returns full text → `access: full`
   - If only abstract available → `access: abstract-only`
   - If nothing available (paywalled, no abstract) → `access: inaccessible`
5. **Create stub.** Place in correct directory with correct filename convention (`author-year-slug.md`).
6. **Log in README.** Add row to search log table and search results summary table.
7. **Log inaccessible sources.** If `access: inaccessible` and the source appears important (based on title/abstract), add entry to `todo.md`.

### Stopping rule (clarified)

The **source budget counts annotatable sources** — stubs with `access: full` or `access: abstract-only`. Stubs with `access: inaccessible` do not count toward the budget (they are logged but don't represent usable evidence).

- Stop creating stubs when the budget of annotatable sources is reached
- OR when all search terms are exhausted with fewer results
- If the priority list alone fills the budget, general search terms are still run briefly to check for major sources not on the list — but don't need to be exhaustive

### What the search-agent does NOT do

- Does not fill body sections of source notes (that's the annotation-agent)
- Does not extract data into `3_results/primary/` or `secondary/` (that's Phase 2)
- Does not run `./sync.sh` (orchestrator handles this between batches)

## Annotation-agent instructions

### Input

The annotation-agent receives a list of source note stubs (file paths) created by the search-agent, with `access: full` or `access: abstract-only`.

### Workflow per source

1. **Get full text.** If `access: full`, retrieve the article using `get_full_text_article` or `WebFetch`. If `access: abstract-only`, work from the abstract/metadata only.
2. **Fill template sections in order:**
   - Summary (what does this say about duration/trajectory?)
   - Key claims (with page/section references)
   - Duration data (explicit numbers, ranges, timelines)
   - Trajectory description
   - Relevance to thesis
   - Quotes (verbatim, with page references)
   - Quality notes
   - Cross-cutting observations (survivorship, dose/time, therapy/life, access, endpoint definition, dropout)
   - Secondary questions (continuity, modality, therapist, frequency, phases, adjuncts)
3. **Update YAML scanning fields** based on what was found in the body.
4. **Log discovered sources.** While reading, note references cited by this source that are not yet in the project. Add to README "Discovered sources" table.
5. **Append to execution_log.md** — issues, questions, emerging patterns, suggestions.

### Abstract-only annotation

When only the abstract is available:
- Fill Summary, Key claims, and Duration data from abstract (often the abstract contains the key numbers)
- Mark all other sections: `[abstract-only — body sections not available]`
- In secondary questions and cross-cutting observations: `no data (abstract only)`
- Set YAML: `access: abstract-only`
- This counts as an annotated source, but its limitations are explicit

### Confidence indicators for "no data"

When recording "no data" for a secondary question or cross-cutting observation, use one of:

- `No data (full text reviewed)` — the agent read the full text and the topic is genuinely absent
- `No data (abstract only)` — only the abstract was available; the topic may be in the full text
- `No data (partial review — [which chapters/sections read])` — for books, only relevant chapters were read
- `No data (inaccessible)` — the source was not accessed at all

## Disambiguation of ambiguous fields

### `duration_data` values

| Value | Meaning | Example |
|-------|---------|---------|
| `yes` | The source contains explicit statements about how long treatment takes — numbers, ranges, or specific timelines | "Treatment lasted an average of 6.2 years" |
| `implicit` | The source implies a duration without stating it directly — through study design, follow-up period, or descriptions of therapeutic phases | "Patients were followed for 5 years" (study design implies treatment lasted at least that long); "After several years of analysis..." (narrative description) |
| `no` | The source does not address treatment duration at all, even implicitly | A theoretical paper on attachment that never discusses treatment length |

### `endpoint_definition` values

| Value | Meaning | Example |
|-------|---------|---------|
| `symptom-reduction` | Endpoint is measured by symptom scales (PCL-5, BDI, IES-R, etc.) | "Treatment response defined as ≥50% reduction in PCL-5 score" |
| `functional` | Endpoint is measured by functional outcomes (GAF, employment, relationship stability, crisis episodes) | "Patients achieved GAF ≥ 60" |
| `structural` | Endpoint is described in terms of personality reorganization, self-cohesion, relational capacity, or deep psychological change | "The patient developed a coherent narrative identity" |
| `mixed` | Source uses multiple endpoint types at different levels | Study uses both PCL-5 and GAF |
| `implicit` | The source discusses improvement or recovery but never defines what that means — the endpoint is assumed, not stated | "The patient recovered" without specifying criteria |
| `not-defined` | The source discusses duration but has no concept of an endpoint at all — e.g., a memoir that describes an ongoing process | A Reddit post about "10 years of therapy" with no concept of "done" |

### `access` values

| Value | When to use |
|-------|------------|
| `full` | Full text was accessed and read (open access, library, freely available book) |
| `abstract-only` | Only abstract, summary, or metadata available (paywalled article with visible abstract) |
| `inaccessible` | Source identified as relevant but no content accessed at all (no abstract, paywall, out of print) |
| `provided-manually` | Initially inaccessible, later provided by the user and annotated |
| `transcript-pending` | Media source (video/podcast/lecture) identified; awaiting download and transcription |

### `has_dropout_data` values

| Value | When to use |
|-------|------------|
| `yes` | Source reports dropout/attrition rates, premature termination data, or outcomes for people who left therapy. Any mention of who left and why. |
| `no` | Source does not mention dropout at all — neither rates nor reasons nor outcomes for leavers. |

### `has_access_context` values

| Value | When to use |
|-------|------------|
| `yes` | Source mentions financial barriers, insurance limitations, session caps, geographic access, forced termination, socioeconomic context, or who can/cannot access this treatment. |
| `no` | Source does not address access, cost, or structural barriers at all. |

## Media sources: videos, podcasts, lectures

Searches may turn up relevant videos (YouTube talks, conference presentations), podcasts, or recorded lectures. These are valid sources — especially for Layers 3 (counterpoint — clinicians presenting their models) and 4 (practitioner reflections). They require a download → transcribe → annotate pipeline.

### When the search-agent finds a media source

1. **Create a source stub** as usual, with `type: video`, `type: podcast`, or `type: lecture`
2. Set `access: transcript-pending`
3. Set `url:` to the video/podcast URL
4. Add an entry to `todo.md` under a `## Media to download and transcribe` section:

```markdown
### [author-year-slug]

- **URL:** [video/podcast URL]
- **Type:** [video | podcast | lecture]
- **Platform:** [YouTube | Vimeo | podcast platform | conference site]
- **Duration:** [if known]
- **Why relevant:** [why this media source matters for the review]
- **Date identified:** [YYYY-MM-DD]
- **Status:** pending-download
```

### Human-in-the-loop: download and transcription

This is a pause point — the orchestrator presents the media list to the user.

1. **User downloads** the media file and places it in the layer's `_media/` directory:
   `3_results/sources/[layer]/_media/[author-year-slug].[ext]`

2. **Transcription** — three options:
   - **Soniox pipeline** (preferred) — use the adapted Soniox pipeline in the skills directory for high-quality transcription of podcasts and videos
   - **Whisper / `/transcribe-lecture`** — for lecture-format recordings
   - **User transcribes** manually, places transcript at:
     `3_results/sources/[layer]/_media/[author-year-slug]-transcript.md`

3. **Update the source stub:**
   - `access: full`
   - `media_file: _media/[author-year-slug].[ext]`
   - `transcript_file: _media/[author-year-slug]-transcript.md`

4. **Annotation-agent** then annotates from the transcript, treating it as full text. References use timestamps instead of page numbers: `[claim] — [HH:MM:SS]`

### Directory structure

```
3_results/sources/[layer]/
├── _media/
│   ├── fosha-2019-aedp-talk.mp4          ← gitignored
│   ├── fosha-2019-aedp-talk-transcript.md ← tracked in git
│   └── ...
├── fosha-2019-aedp-talk.md               ← source note (tracked)
└── ...
```

Media files (audio/video) are gitignored. Transcripts (.md) are tracked — they are the auditable record.

### Citation for media sources (APA 7)

```
Speaker, A. A. (Year, Month Day). Title of talk [Video]. Platform. URL

Speaker, A. A. (Host). (Year, Month Day). Title of episode (No. X) [Audio podcast episode]. In Podcast Name. Publisher. URL
```

## Orchestrator handoff protocol

### Search → Annotation handoff

1. Orchestrator dispatches search-agent for a layer
2. Search-agent creates stubs and returns list of file paths + access status summary
3. Orchestrator reviews: enough `access: full` sources to proceed? If mostly inaccessible, flag for human review before annotating
4. Orchestrator dispatches annotation-agent with list of stub file paths
5. Annotation-agent fills body sections, updates YAML, logs discoveries
6. Orchestrator runs `./sync.sh all` after annotation batch completes
7. Orchestrator reviews `execution_log.md` for issues

### Minimum quality threshold for Phase 1 gate

For each layer, the gate requires:
- At least **50% of the source budget** filled with `access: full` annotations
- Remaining budget may be `access: abstract-only`
- `access: inaccessible` stubs are logged but do not count toward the budget or the gate
- If a layer cannot reach 50% `access: full`, flag in `execution_log.md` and consult human before proceeding

## Context files for each agent type

### Search-agent reads:
1. `CLAUDE.md` (orientation)
2. `2_methods/2_search_strategy.md` (inclusion/exclusion, iterative protocol)
3. `2_methods/[layer-specific file]` (search terms, key authors, databases)
4. `3_results/sources/[layer]/README.md` (what's already been found)
5. This file (`2_methods/14_agent_instructions.md`) § Search-agent instructions

### Annotation-agent reads:
1. `CLAUDE.md` (orientation)
2. `3_results/sources/SOURCE_TEMPLATE.md` (template)
3. `2_methods/9_annotation_protocol.md` (protocol)
4. `2_methods/[layer-specific file]` (population/modality context for this layer)
5. This file (`2_methods/14_agent_instructions.md`) § Annotation-agent instructions, § Disambiguation

### Extraction-agent reads (Phase 2):
1. `CLAUDE.md` (orientation)
2. `2_methods/11_synthesis_method.md` (dimensions)
3. `2_methods/13_discussion_data_map.md` (what data goes where)
4. `3_results/primary/` or `secondary/` target file
5. `99_search/index.md` (scan for relevant source notes)
