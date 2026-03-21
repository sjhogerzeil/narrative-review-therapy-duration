#!/usr/bin/env bash
# sync.sh — Keep references, search index, and layer READMEs in sync with source notes.
# Run after annotating new sources or adding new questions/dimensions.
#
# Usage: ./sync.sh [command]
#   references  — Rebuild 7_references/references.md from source note YAML
#   index       — Rebuild 99_search/index.md from all project files
#   readmes     — Update annotated-sources tables in layer READMEs
#   all         — Run all of the above (default)
#   check       — Report sources missing from references or index (dry run)

set -euo pipefail
cd "$(dirname "$0")"

SOURCES_DIR="3_results/sources"
REFS_FILE="7_references/references.md"
INDEX_FILE="99_search/index.md"

# ─── helpers ───────────────────────────────────────────────────────────────

extract_yaml_field() {
    # Extract a YAML frontmatter field from a .md file
    local file="$1" field="$2"
    sed -n '/^---$/,/^---$/p' "$file" | grep "^${field}:" | sed "s/^${field}: *//" | sed 's/^ *//;s/ *$//' || true
}

find_source_notes() {
    find "$SOURCES_DIR" -name '*.md' ! -name 'SOURCE_TEMPLATE.md' ! -name 'README.md' ! -path '*/_*/*' | sort
}

# ─── references ────────────────────────────────────────────────────────────

sync_references() {
    echo "Syncing references..."
    local tmpfile
    tmpfile=$(mktemp)

    cat > "$tmpfile" <<'HEADER'
---
section: references
description: Complete bibliography in APA 7 format — all cited sources across all layers, alphabetically ordered
status: auto-generated
last_synced: SYNC_DATE
---

# References

HEADER
    sed -i '' "s/SYNC_DATE/$(date +%Y-%m-%d)/" "$tmpfile"

    # Collect citations from all source notes, sort alphabetically
    local count=0
    local citations_tmp
    citations_tmp=$(mktemp)
    while IFS= read -r file; do
        local citation
        citation=$(extract_yaml_field "$file" "citation")
        if [[ -n "$citation" && "$citation" != "#"* ]]; then
            echo "$citation" >> "$citations_tmp"
            count=$((count + 1))
        fi
    done < <(find_source_notes)
    sort -f "$citations_tmp" | while IFS= read -r line; do
        echo "$line" >> "$tmpfile"
        echo "" >> "$tmpfile"
    done
    rm -f "$citations_tmp"

    mv "$tmpfile" "$REFS_FILE"
    echo "  → $count references written to $REFS_FILE"
}

# ─── search index ─────────────────────────────────────────────────────────

sync_index() {
    echo "Syncing search index..."
    local tmpfile
    tmpfile=$(mktemp)

    cat > "$tmpfile" <<HEADER
# Project index — therapy duration review

*Last updated: $(date +%Y-%m-%d)*

HEADER

    # Index non-source project files by section
    for section_dir in 1_introduction 2_methods 4_discussion 7_references; do
        if [[ -d "$section_dir" ]]; then
            echo "## ${section_dir}" >> "$tmpfile"
            echo "" >> "$tmpfile"
            echo "| File | Description | Status |" >> "$tmpfile"
            echo "|------|-------------|--------|" >> "$tmpfile"
            for f in "$section_dir"/*.md; do
                [[ -f "$f" ]] || continue
                local fname desc status
                fname=$(basename "$f")
                desc=$(extract_yaml_field "$f" "description")
                status=$(extract_yaml_field "$f" "status")
                [[ -z "$desc" ]] && desc="(no description)"
                [[ -z "$status" ]] && status="?"
                echo "| $fname | $desc | $status |" >> "$tmpfile"
            done
            echo "" >> "$tmpfile"
        fi
    done

    # Index results extraction files
    for sub in primary secondary; do
        if [[ -d "3_results/$sub" ]]; then
            echo "## 3_results/$sub" >> "$tmpfile"
            echo "" >> "$tmpfile"
            echo "| File | Description | Status |" >> "$tmpfile"
            echo "|------|-------------|--------|" >> "$tmpfile"
            for f in "3_results/$sub"/*.md; do
                [[ -f "$f" ]] || continue
                local fname desc status
                fname=$(basename "$f")
                desc=$(extract_yaml_field "$f" "description")
                status=$(extract_yaml_field "$f" "status")
                [[ -z "$desc" ]] && desc="(no description)"
                [[ -z "$status" ]] && status="?"
                echo "| $fname | $desc | $status |" >> "$tmpfile"
            done
            echo "" >> "$tmpfile"
        fi
    done

    # Index source notes by layer
    echo "## 3_results/sources (annotated sources)" >> "$tmpfile"
    echo "" >> "$tmpfile"
    echo "| ID | Layer | Author | Year | Summary | Duration? | Endpoint | Dropout? | Access? | Stance | Access |" >> "$tmpfile"
    echo "|----|-------|--------|------|---------|-----------|----------|----------|---------|--------|--------|" >> "$tmpfile"
    while IFS= read -r file; do
        local id layer author year summary dur endpoint dropout access_ctx stance access
        id=$(extract_yaml_field "$file" "id")
        layer=$(extract_yaml_field "$file" "layer")
        author=$(extract_yaml_field "$file" "author")
        year=$(extract_yaml_field "$file" "year")
        summary=$(extract_yaml_field "$file" "summary")
        dur=$(extract_yaml_field "$file" "duration_data")
        endpoint=$(extract_yaml_field "$file" "endpoint_definition")
        dropout=$(extract_yaml_field "$file" "has_dropout_data")
        access_ctx=$(extract_yaml_field "$file" "has_access_context")
        stance=$(extract_yaml_field "$file" "stance")
        access=$(extract_yaml_field "$file" "access")
        [[ -z "$id" ]] && continue
        echo "| $id | $layer | $author | $year | $summary | $dur | $endpoint | $dropout | $access_ctx | $stance | $access |" >> "$tmpfile"
    done < <(find_source_notes)
    echo "" >> "$tmpfile"

    mv "$tmpfile" "$INDEX_FILE"
    echo "  → Index written to $INDEX_FILE"
}

# ─── layer READMEs ─────────────────────────────────────────────────────────

sync_readmes() {
    echo "Syncing layer READMEs..."
    for layer_dir in "$SOURCES_DIR"/*/; do
        [[ -d "$layer_dir" ]] || continue
        local readme="${layer_dir}README.md"
        [[ -f "$readme" ]] || continue

        # Build new annotated sources table
        local table=""
        table+="| ID | Author | Year | Title | Key finding on duration |\n"
        table+="|----|--------|------|-------|------------------------|\n"
        local count=0
        for f in "$layer_dir"*.md; do
            [[ -f "$f" ]] || continue
            local fname
            fname=$(basename "$f")
            [[ "$fname" == "README.md" ]] && continue
            local id author year title summary
            id=$(extract_yaml_field "$f" "id")
            author=$(extract_yaml_field "$f" "author")
            year=$(extract_yaml_field "$f" "year")
            title=$(extract_yaml_field "$f" "title")
            summary=$(extract_yaml_field "$f" "summary")
            [[ -z "$id" ]] && continue
            table+="| $id | $author | $year | $title | $summary |\n"
            count=$((count + 1))
        done

        # Also check subdirectories (Layer 1 has them), skip _fulltext/_media
        for subdir in "$layer_dir"*/; do
            [[ -d "$subdir" ]] || continue
            [[ "$(basename "$subdir")" == _* ]] && continue
            for f in "$subdir"*.md; do
                [[ -f "$f" ]] || continue
                local id author year title summary
                id=$(extract_yaml_field "$f" "id")
                author=$(extract_yaml_field "$f" "author")
                year=$(extract_yaml_field "$f" "year")
                title=$(extract_yaml_field "$f" "title")
                summary=$(extract_yaml_field "$f" "summary")
                [[ -z "$id" ]] && continue
                table+="| $id | $author | $year | $title | $summary |\n"
                count=$((count + 1))
            done
        done

        # Write table into README, replacing the existing annotated sources table
        if [[ $count -gt 0 ]]; then
            local tmpreadme
            tmpreadme=$(mktemp)
            # Output everything up to and including "## Annotated sources" header
            sed -n '1,/^## Annotated sources/p' "$readme" > "$tmpreadme"
            echo "" >> "$tmpreadme"
            printf '%b' "$table" >> "$tmpreadme"
            echo "" >> "$tmpreadme"
            # Output everything after the first empty-line-delimited table block following "## Annotated sources"
            awk '
                BEGIN { in_header=0; past_table=0; skip=1 }
                /^## Annotated sources/ { in_header=1; next }
                in_header && !past_table && /^\|/ { next }
                in_header && !past_table && !/^\|/ && !/^$/ { past_table=1; print; next }
                in_header && !past_table && /^$/ { next }
                in_header && past_table { print; next }
                !in_header && skip { next }
            ' "$readme" >> "$tmpreadme"
            mv "$tmpreadme" "$readme"
        fi
        echo "  → ${layer_dir}: $count sources"
    done
}

# ─── check ─────────────────────────────────────────────────────────────────

check_sync() {
    echo "Checking sync status..."
    local missing=0
    while IFS= read -r file; do
        local id citation
        id=$(extract_yaml_field "$file" "id")
        citation=$(extract_yaml_field "$file" "citation")
        [[ -z "$id" ]] && continue

        # Check references
        if [[ -z "$citation" || "$citation" == "#"* ]]; then
            echo "  MISSING citation: $file"
            missing=$((missing + 1))
        fi

        # Check index
        if ! grep -q "$id" "$INDEX_FILE" 2>/dev/null; then
            echo "  NOT IN INDEX: $id ($file)"
            missing=$((missing + 1))
        fi
    done < <(find_source_notes)

    if [[ $missing -eq 0 ]]; then
        echo "  ✓ All sources synced"
    else
        echo "  $missing issues found — run './sync.sh all' to fix"
    fi
}

# ─── main ──────────────────────────────────────────────────────────────────

cmd="${1:-all}"
case "$cmd" in
    references) sync_references ;;
    index)      sync_index ;;
    readmes)    sync_readmes ;;
    check)      check_sync ;;
    all)
        sync_references
        sync_index
        sync_readmes
        echo "Done."
        ;;
    *)
        echo "Usage: ./sync.sh [references|index|readmes|check|all]"
        exit 1
        ;;
esac
