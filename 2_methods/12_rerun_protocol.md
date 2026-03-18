---
section: rerun_protocol
description: "Protocol for re-running search/analysis when new subquestions or dimensions emerge mid-review — versioned iterations, incremental re-annotation"
status: draft
---

# Re-run protocol

## When to trigger a re-run

A re-run is needed when:
- A new secondary question emerges that was not anticipated (e.g., "role of spirituality in long-term healing")
- A new cross-cutting observation becomes important (e.g., "cultural context as moderator")
- A new layer or sublayer is needed (e.g., "indigenous/non-Western healing traditions")
- The population definition shifts based on findings
- The working definition of healing needs revision

## How to execute a re-run

### Step 1: Document the change

Create a file in `6_appendix/iterations/` documenting:
- What changed and why
- Date of the change
- Which layers/sources are affected

```markdown
# 6_appendix/iterations/YYYY-MM-DD-[short-description].md

## Change
[What new question/dimension was added]

## Reason
[What finding or insight triggered this]

## Affected layers
[Which layers need re-scanning]

## Affected sources (already annotated)
[Which existing source notes need a new section added]
```

### Step 2: Update the methods files

- Add the new question/dimension to `1_introduction/4_research_questions.md`
- Add a new extraction file in `3_results/secondary/` (or `3_results/primary/`)
- Add the new dimension to `2_methods/11_synthesis_method.md`
- Update `99_search/index.md`

### Step 3: Decide scope of re-annotation

Three options, in order of increasing cost:

1. **Forward-only** — Apply the new question only to sources annotated from now on. Accept that earlier sources won't have this data. Note this limitation in `4_discussion/7_limitations.md`.

2. **Targeted re-scan** — Re-read only sources whose YAML `topics` field suggests they're likely to address the new question. Add the new section to those source notes only.

3. **Full re-scan** — Re-read all annotated sources and add the new section to each. Most thorough, most expensive.

The default is **targeted re-scan**. Use the YAML scanning headers to identify which sources to revisit:
```bash
# Example: find sources likely relevant to a new "spirituality" question
grep -l "spirituality\|spiritual\|faith\|religious\|contemplative" 3_results/sources/**/*.md
```

### Step 4: Run the sync script

After re-annotation, run `sync.sh` to update references and the search index.

### Step 5: Commit with tag

```bash
git add -A
git commit -m "Re-run: added [new question/dimension]"
git tag iteration-N-[short-description]
```

## Iteration log

| # | Date | Change | Scope | Tag |
|---|------|--------|-------|-----|
| 0 | 2026-03-18 | Initial plan | Full | iteration-0-initial |
