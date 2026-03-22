# AI agent orientation

Structured narrative review (CIS methodology) on the duration and trajectory of healing from complex developmental trauma. For a human-readable overview, start with `README.md`.

## Read order

1. This file — task routing and conventions
2. `7_process/progress.md` — where are we? what's next?
3. `_index/index.md` — scan YAML descriptions to find relevant files
4. Only then read specific files needed for your task

## Task routing

| Task | Read these files |
|------|-----------------|
| Search for sources | `2_methods/[layer file]` + layer `README.md` in `3_results/sources/` |
| Annotate a source | `3_results/sources/SOURCE_TEMPLATE.md` + `2_methods/9_annotation_protocol.md` |
| Extract data | `2_methods/11_synthesis_method.md` + relevant `3_results/primary/` or `secondary/` file |
| Check what's been done | `_index/index.md` + layer READMEs |
| Understand the question | `1_introduction/4_research_questions.md` |
| Understand the population | `1_introduction/2_population.md` |
| Add a new question/dimension | `2_methods/12_rerun_protocol.md` |
| Handle an inaccessible source | `2_methods/9_annotation_protocol.md` § Inaccessible sources + `7_process/todo.md` |
| Write discussion content | `4_discussion/[section].md` — check `depends_on` in YAML header |

## After completing any task

1. Append meta-commentary to `7_process/execution_log.md`
2. Run `./_scripts/sync.sh all` if you created or modified source notes

## Key conventions

- **Citations** use pandoc citekeys: `[@id]` (parenthetical), `@id` (textual), `[-@id]` (suppress author). See `2_methods/10_audit_trail.md`
- **Source files** follow `3_results/sources/SOURCE_TEMPLATE.md`. See `2_methods/9_annotation_protocol.md` for the full protocol
- **"No data" is a finding** — note absence explicitly
- **Append-only** — source notes are never rewritten, only appended
- **Language:** English academic prose — clear, precise, not informal. See `1_introduction/5_stance.md` for the honest-advocacy stance

## Key references

| What | Where |
|------|-------|
| Methodology | `2_methods/1_design.md` |
| Annotation protocol | `2_methods/9_annotation_protocol.md` |
| Synthesis method | `2_methods/11_synthesis_method.md` |
| AI methodology | `2_methods/13_ai_methodology.md` |
| Execution plan | `7_process/plan.md` |
| Progress | `7_process/progress.md` |
| Sync & tests | `./_scripts/sync.sh`, `./_scripts/tests.sh` |
| Reproduce / fork | `2_methods/15_reproducibility.md` |
