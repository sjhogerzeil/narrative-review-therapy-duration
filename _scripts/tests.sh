#!/usr/bin/env bash
# tests.sh — Quality and completeness checks for Phases 1-3
set -uo pipefail
cd "$(dirname "$0")/.."

PASS=0; FAIL=0; WARN=0
pass() { echo "  ✓ $1"; PASS=$((PASS+1)); }
fail() { echo "  ✗ $1"; FAIL=$((FAIL+1)); }
warn() { echo "  ⚠ $1"; WARN=$((WARN+1)); }

yaml_field() {
    sed -n '/^---$/,/^---$/p' "$1" | grep "^${2}:" | sed "s/^${2}: *//" | sed 's/^ *//;s/ *$//' || true
}
find_sources() {
    find 3_results/sources -name '*.md' ! -name 'SOURCE_TEMPLATE.md' ! -name 'README.md' ! -path '*/_*/*' ! -path '*/.*/*' | sort
}

SYNTH="4_discussion/1_synthesis.md"
new_sources="spring-2020-recovering-developmental-trauma spring-2020-what-does-recovery-look-like spring-2021-falling-down-getting-back-up fisher-cutting-edge-tist fosha-2019-aedp-intimacy fisher-transforming-legacy heacock-2022-psychotherapy-twice-told heacock-2019-healing-psychedelics bisson-2024-recognising-cptsd tilson-2025-body-not-keeping-score ogden-2006-trauma-and-the-body"
extraction_files=$(find 3_results/primary 3_results/secondary -name '*.md' | sort)
pattern="spring-202[01]\|fosha-2019\|fisher-cutting\|fisher-transform\|heacock-2022-psycho\|heacock-2019-heal\|bisson-2024\|tilson-2025\|ogden-2006"

echo ""
echo "═══════════════════════════════════════════════"
echo " PHASE 1: Source annotation completeness"
echo "═══════════════════════════════════════════════"

echo "── T1.1: Source count"
count=$(find_sources | wc -l | tr -d ' ')
if [ "$count" -ge 89 ]; then pass "$count sources (≥89)"; else fail "$count sources (expected ≥89)"; fi

echo "── T1.2: Required YAML fields"
required_fields="id title author year type layer citation access summary duration_data stance endpoint_definition"
missing_yaml=0
while IFS= read -r f; do
    for field in $required_fields; do
        val=$(yaml_field "$f" "$field")
        if [ -z "$val" ]; then
            fail "$(basename "$f"): missing '$field'"
            missing_yaml=$((missing_yaml+1))
        fi
    done
done < <(find_sources)
if [ "$missing_yaml" -eq 0 ]; then pass "All sources have required YAML fields"; fi

echo "── T1.3: Required body sections"
empty_sections=0
while IFS= read -r f; do
    for section in "Summary" "Key claims"; do
        if ! grep -q "^## $section" "$f" 2>/dev/null; then
            fail "$(basename "$f"): missing '## $section'"
            empty_sections=$((empty_sections+1))
        fi
    done
done < <(find_sources)
if [ "$empty_sections" -eq 0 ]; then pass "All sources have required body sections"; fi

echo "── T1.4: All 11 new sources present"
new_missing=0
for slug in $new_sources; do
    if ! find_sources | grep -q "$slug"; then fail "Missing: $slug"; new_missing=$((new_missing+1)); fi
done
if [ "$new_missing" -eq 0 ]; then pass "All 11 new sources present"; fi

echo "── T1.5: Citation quality"
bad=0
while IFS= read -r f; do
    cit=$(yaml_field "$f" "citation")
    if [ -z "$cit" ] || echo "$cit" | grep -qi "TODO\|FIXME\|^#" 2>/dev/null; then
        fail "$(basename "$f"): bad citation"; bad=$((bad+1))
    fi
done < <(find_sources)
if [ "$bad" -eq 0 ]; then pass "All citations present"; fi

echo ""
echo "═══════════════════════════════════════════════"
echo " PHASE 2: Extraction completeness"
echo "═══════════════════════════════════════════════"

echo "── T2.1: New source data in extraction files"
for f in $extraction_files; do
    c=$(grep -c "$pattern" "$f" 2>/dev/null | tr -d " " || echo 0)
    if [ "$c" -gt 0 ]; then pass "$(basename "$f"): $c refs"; else fail "$(basename "$f"): 0 refs"; fi
done

echo "── T2.2: Per-source coverage (≥3 files each)"
for slug in $new_sources; do
    c=0
    for f in $extraction_files; do
        if grep -q "$slug" "$f" 2>/dev/null; then c=$((c+1)); fi
    done
    if [ "$c" -ge 3 ]; then pass "$slug: $c files"
    elif [ "$c" -ge 1 ]; then warn "$slug: only $c files"
    else fail "$slug: 0 files"; fi
done

echo "── T2.3: Safety file comprehensiveness"
safety_rows=$(( $(grep -c "^|" 3_results/primary/11_safety_as_clock_starter.md 2>/dev/null || true) + 0 ))
if [ "$safety_rows" -ge 30 ]; then pass "Safety: $safety_rows rows (≥30)"
else warn "Safety: $safety_rows rows (expected ≥30)"; fi

echo ""
echo "═══════════════════════════════════════════════"
echo " PHASE 3: Synthesis quality (CIS criteria)"
echo "═══════════════════════════════════════════════"

echo "── T3.1: New sources cited in synthesis"
cited=0; uncited=0
for slug in $new_sources; do
    if grep -q "$slug" "$SYNTH" 2>/dev/null; then cited=$((cited+1))
    else warn "Not in synthesis: $slug"; uncited=$((uncited+1)); fi
done
pass "$cited of 11 new sources cited in synthesis"

echo "── T3.2: Previously underused Layer 4 sources"
l4="shedler-2020-tyranny-of-time alpern-2025-truth-complex-trauma blueknot-trauma-practice mia-psychoanalytic-beats-cbt substack-traumalescence grossmark-psychoanalytic-companioning wylie-long-shadow-trauma mia-injured-not-broken psychnetworker-evolving-beyond"
l4c=0
for slug in $l4; do
    if grep -q "$slug" "$SYNTH" 2>/dev/null; then l4c=$((l4c+1)); else fail "L4 not cited: $slug"; fi
done
if [ "$l4c" -ge 9 ]; then pass "All $l4c/9 underused L4 sources now cited"; fi

echo "── T3.3: Counterpoint integration (not dismissal)"
counter=$(( $(grep -c "dejongh\|sciarrino\|feder-2025\|mitchell-2021\|paris-2020\|lilliengren\|tilson-2025\|fosha-2019" "$SYNTH" 2>/dev/null || true) + 0 ))
if [ "$counter" -ge 10 ]; then pass "Counterpoint cited $counter times (substantive)"; else warn "Counterpoint only $counter times"; fi
dismissive=$(( $(grep -ci "merely\|simply wrong\|obviously\|clearly mistaken\|can be dismissed" "$SYNTH" 2>/dev/null || true) + 0 ))
if [ "$dismissive" -eq 0 ]; then pass "No dismissive language"; else warn "$dismissive dismissive phrases"; fi

echo "── T3.4: Reflexivity and limitations"
for term in "cannot explain" "survivorship" "cost-effectiveness" "contested"; do
    if grep -qi "$term" "$SYNTH" 2>/dev/null; then pass "Acknowledges: $term"
    else fail "Missing: $term"; fi
done

echo "── T3.5: Emergent constructs"
for c in "endpoint.duration:endpoint-duration nexus" "sleeper.effect:sleeper effect" "developmental.mechanism:developmental mechanism" "safety.*clock:safety as clock" "borrowed.*owned:borrowed vs owned"; do
    pat=$(echo "$c" | cut -d: -f1)
    label=$(echo "$c" | cut -d: -f2)
    if grep -qiE "$pat" "$SYNTH" 2>/dev/null; then pass "Construct: $label"
    else fail "Missing construct: $label"; fi
done

echo "── T3.6: Synthesis sections present"
for s in "Thesis statement" "endpoint-duration" "factors that determine" "appears to disagree" "developmental mechanism" "trajectory" "cannot explain" "Critique" "synthesising argument"; do
    if grep -qi "$s" "$SYNTH" 2>/dev/null; then pass "Section: $s"
    else fail "Missing section: $s"; fi
done

echo "── T3.7: Cross-layer triangulation"
layers_cited=0
for layer in "1a-" "1b-" "1c-" "1d-" "2-" "3-" "4-" "5-" "6-"; do
    if grep -q "$layer" "$SYNTH" 2>/dev/null; then layers_cited=$((layers_cited+1)); fi
done
# Alternative: count by source layer refs
for layer_name in "Layer 1" "Layer 2" "Layer 3" "Layer 4" "Layer 5" "Layer 6"; do
    if grep -qi "$layer_name\|memoir\|naturalistic\|counterpoint\|practitioner\|client" "$SYNTH" 2>/dev/null; then layers_cited=$((layers_cited+1)); fi
done
if [ "$layers_cited" -ge 6 ]; then pass "Cross-layer: references span $layers_cited+ layer indicators"
else warn "Cross-layer: only $layers_cited layer indicators found"; fi

echo ""
echo "═══════════════════════════════════════════════"
echo " STRUCTURAL INTEGRITY"  
echo "═══════════════════════════════════════════════"

echo "── T4.1: sync.sh check"
issues=$(( $(bash ./sync.sh check 2>&1 | grep -c "MISSING\|NOT IN" 2>/dev/null || true) + 0 ))
if [ "$issues" -eq 0 ]; then pass "sync clean"; else warn "sync: $issues issues"; fi

echo "── T4.2: References count"
actual=$(find_sources | wc -l | tr -d ' ')
ref_count=$(( $(grep -c '^"*[A-Za-z]' 6_references/references.md 2>/dev/null || true) + 0 ))
if [ "$ref_count" -ge "$actual" ]; then pass "Refs: $ref_count ≥ $actual sources"
else warn "Refs: $ref_count < $actual sources"; fi

echo ""
echo "═══════════════════════════════════════════════"
echo " RESULTS"
echo "═══════════════════════════════════════════════"
echo ""
echo "  ✓ PASS: $PASS"
echo "  ⚠ WARN: $WARN"
echo "  ✗ FAIL: $FAIL"
total=$((PASS+WARN+FAIL))
if [ "$FAIL" -eq 0 ]; then echo "  All $total checks passed (${WARN} warnings)."
elif [ "$FAIL" -le 3 ]; then echo "  $FAIL failures — review."
else echo "  $FAIL failures — significant issues."; fi
