#!/usr/bin/env bash
# set_github_metadata.sh — Set GitHub repo description and topics after first push.
# Run once: bash _scripts/set_github_metadata.sh
set -euo pipefail

REPO="sjhogerzeil/narrative-review-therapy-duration"

gh repo edit "$REPO" \
  --description "Structured narrative review: therapy duration for complex developmental trauma depends on endpoint definition — symptom reduction in weeks, structural change in years (89 sources, 6 layers, CIS methodology)" \
  --add-topic complex-trauma \
  --add-topic therapy-duration \
  --add-topic cptsd \
  --add-topic narrative-review \
  --add-topic critical-interpretive-synthesis \
  --add-topic open-science \
  --add-topic ai-assisted-research \
  --add-topic psychotherapy-outcome \
  --add-topic personality-disorders

echo "Done — description and topics set for $REPO"
