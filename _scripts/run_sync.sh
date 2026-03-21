#!/bin/bash
# Wrapper to run sync.sh from project root
cd "$(dirname "$0")/.." && bash _scripts/sync.sh "$@"
