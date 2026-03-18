---
section: annotation_protocol
description: "Source annotation format: YAML scanning headers, body sections, secondary questions, cross-cutting observations, no-data-is-a-finding principle"
status: draft
---

# Annotation protocol

## Source file location and naming

Source annotations live in `3_results/sources/[layer-dir]/[author-year-slug].md`.

Layer 1 has four sublayer subdirectories — place sources in the appropriate one:

| Sublayer | Directory | YAML `layer` value |
|----------|-----------|-------------------|
| Trauma-clinical | `1-academic/trauma-clinical/` | `1a-trauma-clinical` |
| Psychoanalytic | `1-academic/psychoanalytic/` | `1b-psychoanalytic` |
| Humanistic-existential | `1-academic/humanistic-existential/` | `1c-humanistic-existential` |
| Neuroscience | `1-academic/neuroscience/` | `1d-neuroscience` |

Layers 2–6 have no sublayers — place sources directly in the layer directory.

Files are named `[author-year]-[short-slug].md`, e.g.:
- `herman-1992-complex-ptsd.md` → `1-academic/trauma-clinical/`
- `leichsenring-2008-ltpp-meta.md` → `2-naturalistic-studies/`
- `foo-2022-what-my-bones-know.md` → `6-memoirs/`
- `reddit-2024-how-long-cptsd.md` (for forum threads: platform-year-slug)

## Source note IDs

Each source note has a unique ID in its frontmatter, derived from the filename (e.g., `id: herman-1992-complex-ptsd`). This ID is used for all cross-references.

## Source file template

See `3_results/sources/SOURCE_TEMPLATE.md` for the full template.

### YAML frontmatter

The frontmatter serves two purposes:
1. **Bibliographic data** — id, title, author, year, type, layer, citation (APA 7), url/DOI, accessed date
2. **Relevance scanning** — fields that allow an AI to assess relevance without reading the full body:
   - `summary` — 1-2 sentence contribution summary
   - `population` — who was studied
   - `modality` — therapeutic approach
   - `duration_data` — yes | no | implicit
   - `duration_range` — e.g., "3-7 years", "50+ sessions"
   - `stance` — supports | complicates | challenges | neutral
   - `topics` — list of relevant subtopics
   - `secondary_qs` — which secondary questions this source addresses

### Body sections

1. **Summary** — what this source says about duration/trajectory
2. **Key claims** — with page/section/timestamp references
3. **Duration data** — explicit or implicit statements about how long treatment takes
4. **Trajectory description** — phases, turning points, nonlinearity
5. **Relevance to thesis** — supports, complicates, or challenges
6. **Quotes** — exact quotes with page references
7. **Secondary questions** — one subsection per question; "no data" is a valid answer
8. **Cross-cutting observations** — survivorship bias, dose vs. elapsed time, therapy vs. life

## Inaccessible sources

When a source is identified as relevant but cannot be accessed (paywall, out of print, language barrier):

1. **Do not skip silently.** Add a full entry to `todo.md` with citation, barrier type, why it matters, and expected impact on conclusions.
2. **Create a minimal source note** with YAML frontmatter only (`access: inaccessible`), based on abstract/metadata if available. Place it in the correct layer directory. This ensures it appears in the index and is not forgotten.
3. **If the source is later obtained** (manually provided, library access), update `access: provided-manually`, annotate the full body, move the `todo.md` entry to `## Resolved`, and run `./sync.sh`.

The YAML `access` field values:
- `full` — full text accessed and annotated
- `abstract-only` — only abstract/metadata available; note this in the summary
- `inaccessible` — identified as relevant but not accessed; entered in `todo.md`
- `provided-manually` — initially inaccessible, later obtained and annotated

## Data extraction principle

**"No data" is a finding.** When a source is silent on a secondary question or cross-cutting observation, note the absence explicitly. The pattern of what sources fail to address is itself evidence.

## Append-only semantics

Source notes are never rewritten — only appended. This applies when:

- **A re-run adds a new secondary question:** Append the new question section below existing secondary questions, marked `[added YYYY-MM-DD, iteration N]`.
- **A re-scan finds new data for an existing section:** Append below the existing content in that section, marked `[added iteration N]`.
- **YAML frontmatter is updated:** Add new topics or secondary_qs to the lists. Do not remove existing entries.

The final state of each source note contains all data ever extracted from that source. Git captures when each piece was added. A reader of the final file sees the complete picture without needing to consult git history.

### Extraction file convention

Tables in `3_results/primary/` and `3_results/secondary/` are append-only. New rows go at the bottom. Each row carries its source ID, making the table rebuildable from source notes at any time. The `./sync.sh` script can verify consistency.
