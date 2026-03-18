---
section: rerun_protocol
description: "Protocol for re-running search/analysis when new subquestions or dimensions emerge — append-only semantics, git captures chronology, final state supports replication"
status: draft
---

# Re-run protocol

## Core principle: append, never replace

A re-run does not replace earlier results. It patches or appends them. Every file in the project is additive:

- **Source notes** — new sections are appended below existing content, marked with iteration number
- **Extraction files** (`3_results/`) — new rows are appended to tables, new entries to lists
- **Methods files** — new search terms, authors, or questions are appended with `[added YYYY-MM-DD, iteration N]`
- **Discussion files** — new observations are appended under clearly marked headings

**Git captures the chronology.** The commit history and iteration tags record how the plan evolved. The final state of every file is what a reader needs to replicate the analysis — they do not need to replay intermediate steps.

## When to trigger a re-run

- A new secondary question emerges (e.g., "role of spirituality in long-term healing")
- A new cross-cutting observation becomes important (e.g., "cultural context as moderator")
- A new layer or sublayer is needed (e.g., "indigenous/non-Western healing traditions")
- The population definition shifts based on findings
- The working definition of healing needs revision

## Append conventions

### In source notes

When a re-run adds a new secondary question, append it below existing secondary questions:

```markdown
## Secondary questions

### Continuous or interrupted?
[data from iteration 0]

### One modality or many?
[data from iteration 0]

...

### Role of spirituality? [added 2026-04-02, iteration 2]
[data extracted during iteration 2 re-scan]
```

When a re-run adds data to an existing section, append below existing content:

```markdown
### Continuous or interrupted?
[original data from iteration 0]

[added iteration 2] Additional finding on forced interruptions: ...
```

### In extraction files (`3_results/primary/`, `3_results/secondary/`)

Tables are append-only. New rows are added at the bottom. Each row carries its source ID, so the table is always rebuildable from source notes.

```markdown
| Source ID | Layer | Duration reported | ... |
|-----------|-------|-------------------|-----|
| herman-1992 | 1a | "years" | ... |          ← iteration 0
| brand-2009 | 2 | "5-10 years" | ... |        ← iteration 0
| fosha-2000 | 3 | "months" | ... |            ← iteration 1
```

If a new extraction file is created for a new question (e.g., `3_results/secondary/7_spirituality.md`), it starts empty and is populated from targeted re-scan of existing sources + forward annotation of new sources.

### In methods files

Additions are inline, marked:

```markdown
Search terms:
- complex PTSD long-term treatment duration
- developmental trauma therapy duration years
- trauma therapy spiritual practice long-term [added 2026-04-02, iteration 2]
```

### In discussion files

New subsections are appended, not interspersed:

```markdown
## [existing content from earlier iterations]

## Role of spiritual practice [added iteration 2]
[new discussion content]
```

## How to execute a re-run

### Step 1: Document the change

Create a file in `6_appendix/iterations/`:

```markdown
# 6_appendix/iterations/YYYY-MM-DD-[short-description].md

## Iteration number
[N]

## Change
[What new question/dimension was added]

## Reason
[What finding or insight triggered this]

## Affected layers
[Which layers need re-scanning]

## Re-scan scope
[forward-only | targeted | full]

## Sources to re-scan
[List of source IDs, or "all sources with topics matching X"]
```

### Step 2: Update methods files (append)

- Append the new question to `1_introduction/4_research_questions.md`
- Create a new extraction file in `3_results/secondary/` (or `3_results/primary/`)
- Append the new dimension to `2_methods/11_synthesis_method.md`
- Append new search terms to the relevant layer methods files

### Step 3: Decide scope of re-annotation

1. **Forward-only** — Apply the new question only to sources annotated from now on. Note this in `4_discussion/7_limitations.md`.

2. **Targeted re-scan** — Re-read only sources whose YAML `topics` field suggests relevance. Append new sections to those source notes.

3. **Full re-scan** — Append new sections to all annotated source notes.

Default is **targeted re-scan**:
```bash
grep -rl "spirituality\|spiritual\|faith\|religious" 3_results/sources/**/*.md
```

### Step 4: Append to existing source notes

Do not rewrite source notes. Append the new secondary question section at the end of the `## Secondary questions` block. If re-scan reveals new data for existing sections, append below existing content with `[added iteration N]` marker.

### Step 5: Populate the new extraction file

Pull data from re-scanned source notes into the new `3_results/secondary/` or `3_results/primary/` file.

### Step 6: Sync and commit

```bash
./sync.sh all
git add -A
git commit -m "Iteration N: added [description]"
git tag iteration-N-[short-description]
```

## Iteration log

| # | Date | Change | Scope | Tag |
|---|------|--------|-------|-----|
| 0 | 2026-03-18 | Initial plan | Full | iteration-0-initial |
