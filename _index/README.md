# Semantic search index

Continuously updated index for efficient topic-based search across the entire project.

## How it works

The `index.md` file contains a compact entry per project file with:
- File path
- Section/layer
- Key topics and concepts
- One-line summary

This allows an AI agent to scan `index.md` first and then read only the relevant files, saving tokens.

## Update protocol

After annotating a new source or writing a new section, add/update its entry in `index.md`.
