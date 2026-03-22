#!/usr/bin/env bash
# build_pdf.sh — Assemble manuscript chapters and build PDF via pandoc + lualatex + natbib
set -euo pipefail
cd "$(dirname "$0")/.."

OUT="narrative-review-therapy-duration.pdf"
BIB="6_references/references.bib"

# Chapter order
chapters=(
  1_introduction/0_abstract.md
  1_introduction/1_background.md
  1_introduction/2_population.md
  1_introduction/3_healing_definition.md
  1_introduction/4_research_questions.md
  1_introduction/5_stance.md
  2_methods/1_design.md
  2_methods/2_search_strategy.md
  2_methods/9_annotation_protocol.md
  2_methods/11_synthesis_method.md
  2_methods/13_ai_methodology.md
  4_discussion/1_synthesis.md
  4_discussion/2_survivorship_bias.md
  4_discussion/3_dose_vs_elapsed_time.md
  4_discussion/4_therapy_vs_life.md
  4_discussion/5_counterpoint_response.md
  4_discussion/6_access_and_justice.md
  4_discussion/7_limitations.md
  4_discussion/8_implications.md
  4_discussion/9_inaccessible_sources.md
)

echo "Building PDF from ${#chapters[@]} chapters..."
pandoc "${chapters[@]}" \
  --pdf-engine=lualatex \
  --bibliography="$BIB" \
  --citeproc \
  --csl=https://raw.githubusercontent.com/citation-style-language/styles/master/apa.csl \
  --metadata title="Eight Sessions or Eight Years?" \
  --metadata subtitle="A structured narrative review of therapy duration for complex developmental trauma" \
  --metadata author="Simon J. Hogerzeil" \
  --metadata date="2026" \
  --toc \
  --number-sections \
  -V geometry:margin=1in \
  -V fontsize=11pt \
  -V linestretch=1.3 \
  -V urlcolor=blue \
  -V linkcolor=black \
  -o "$OUT"

echo "→ $OUT ($(du -h "$OUT" | cut -f1))"
