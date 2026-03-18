# Inaccessible sources

Sources identified as relevant during the search but not accessed — behind paywalls, unavailable, out of print, or otherwise inaccessible at time of search. **These are not optional nice-to-haves. Each entry represents a gap in the evidence base that may affect the conclusions.**

## How to use this file

1. **During search:** When a source is identified as relevant but cannot be accessed, add it below with full bibliographic detail and a note on *why it matters* — what it likely contains, what gap it would fill, and what the review loses by not including it.
2. **When manually providing sources:** When the source becomes available (e.g., through library access, ILL, or direct provision), move its entry to the `## Resolved` section below, annotate the source normally, and run `./sync.sh`.
3. **In the discussion:** The `4_discussion/9_inaccessible_sources.md` file aggregates the impact of all unresolved entries. Do not downplay the impact. If a key source was inaccessible, say so plainly.

## Format

```markdown
### [author-year-slug]

- **Citation:** [Full APA 7]
- **URL/DOI:** [if known]
- **Barrier:** [paywall | out of print | institutional access only | language | other]
- **Layer:** [which layer this belongs to]
- **Why it matters:** [What this source likely contains. What gap does its absence create? Be specific.]
- **Impact on conclusions:** [How might missing this source affect the review's findings?]
- **Date identified:** [YYYY-MM-DD]
- **Status:** unresolved
```

## Unresolved

**WARNING: 7 of 11 included Layer 2 sources (64%) are inaccessible. This exceeds the 50% threshold and must be acknowledged in the discussion.**

### leichsenring-2013-emerging-evidence

- **Citation:** Leichsenring, F., Abbass, A., Luyten, P., Hilsenroth, M., & Rabung, S. (2013). The emerging evidence for long-term psychodynamic therapy. *Psychodynamic Psychiatry*, *41*(3), 361–384. https://doi.org/10.1521/pdps.2013.41.3.361
- **URL/DOI:** https://doi.org/10.1521/pdps.2013.41.3.361
- **Barrier:** paywall (Psychodynamic Psychiatry)
- **Layer:** 2-naturalistic
- **Why it matters:** Contains dose-effect data arguing short-term therapy is insufficient for complex/personality disorders. Would provide specific session-count thresholds and effect size comparisons that directly address the core research question.
- **Impact on conclusions:** Without this source, the dose-effect argument for complex disorders relies more heavily on L&R 2011 meta-analysis. The narrative review perspective is lost.
- **Date identified:** 2026-03-18
- **Status:** unresolved

### lindfors-2019-helsinki-10yr

- **Citation:** Lindfors, O., Knekt, P., Lehtonen, J., Virtala, E., Maljanen, T., & Härkänen, T. (2019). Effectiveness of psychoanalysis and long-term psychodynamic psychotherapy on personality and social functioning 10 years after start of treatment. *Psychiatry Research*, *272*, 774–783. https://doi.org/10.1016/j.psychres.2018.12.082
- **URL/DOI:** https://doi.org/10.1016/j.psychres.2018.12.082
- **Barrier:** paywall (Psychiatry Research)
- **Layer:** 2-naturalistic
- **Why it matters:** 10-year follow-up is the longest in the Helsinki study. The finding that PA vs LPP differences wash out at 10 years complicates the "more is better" thesis. Critical for nuanced discussion.
- **Impact on conclusions:** Without this source, the review may overstate the case for high-frequency/long-duration treatment. This is a key complicating finding.
- **Date identified:** 2026-03-18
- **Status:** unresolved

### howard-1986-dose-effect

- **Citation:** Howard, K. I., Kopta, S. M., Krause, M. S., & Orlinsky, D. E. (1986). The dose-effect relationship in psychotherapy. *American Psychologist*, *41*(2), 159–164.
- **URL/DOI:** no URL available
- **Barrier:** paywall (American Psychologist, 1986 — pre-digital)
- **Layer:** 2-naturalistic
- **Why it matters:** Foundational paper establishing the dose-effect model that all subsequent duration research builds on. Without it, the historical framing of the dose-effect question relies on secondary sources.
- **Impact on conclusions:** The review can cite the dose-effect model via secondary sources but cannot verify the original claims or note methodological limitations firsthand.
- **Date identified:** 2026-03-18
- **Status:** unresolved

### knekt-2021-dropout

- **Citation:** Knekt, P., Grandell, L., Sares-Jäske, L., & Lindfors, O. (2021). Poor suitability for psychotherapy – a risk factor for treatment non-attendance? *Journal of Affective Disorders*, *295*, 1432–1439. https://doi.org/10.1016/j.jad.2021.09.020
- **URL/DOI:** https://doi.org/10.1016/j.jad.2021.09.020
- **Barrier:** paywall (Journal of Affective Disorders)
- **Layer:** 2-naturalistic
- **Why it matters:** Directly addresses survivorship bias — a cross-cutting concern for all duration studies. The RR=2.76 finding for poor suitability predicting dropout in long-term therapy is critical evidence.
- **Impact on conclusions:** Without this source, the survivorship bias discussion relies on inference rather than empirical data. This is a significant gap.
- **Date identified:** 2026-03-18
- **Status:** unresolved

### koeser-2023-tads-cost

- **Citation:** Koeser, L., Rost, F., Gabrio, A., Booker, T., Taylor, D., Fonagy, P., Goldberg, D., Knapp, M., & McCrone, P. (2023). Cost-effectiveness of long-term psychoanalytic psychotherapy for treatment-resistant depression: RCT evidence from the Tavistock Adult Depression Study (TADS). *Journal of Affective Disorders*, *335*, 313–321. https://doi.org/10.1016/j.jad.2023.04.109
- **URL/DOI:** https://doi.org/10.1016/j.jad.2023.04.109
- **Barrier:** paywall (Journal of Affective Disorders)
- **Layer:** 2-naturalistic
- **Why it matters:** Only source addressing cost-effectiveness of long-term therapy. The finding that LTPP is clinically effective but not cost-effective by standard thresholds is essential for the access/equity discussion.
- **Impact on conclusions:** Without this source, the review cannot address the economic argument against long-term therapy with empirical data.
- **Date identified:** 2026-03-18
- **Status:** unresolved

### shedler-2010-efficacy

- **Citation:** Shedler, J. (2010). The efficacy of psychodynamic psychotherapy. *American Psychologist*, *65*(2), 98–109. https://doi.org/10.1037/a0018378
- **URL/DOI:** https://doi.org/10.1037/a0018378
- **Barrier:** paywall (American Psychologist)
- **Layer:** 2-naturalistic
- **Why it matters:** Foundational review establishing that psychodynamic therapy patients continue to improve after treatment ends — a key finding for the delayed-effect argument. Widely cited and influential.
- **Impact on conclusions:** The continued-improvement finding can be cited via secondary sources, but the original effect size data and methodological discussion would strengthen the argument.
- **Date identified:** 2026-03-18
- **Status:** unresolved

### zimmermann-2014-munich-dose

- **Citation:** Zimmermann, J., Löffler-Stastka, H., Huber, D., Klug, G., Alhabbo, S., Bock, A., & Benecke, C. (2014). Is it all about the higher dose? Why psychoanalytic therapy is an effective treatment for major depression. *Clinical Psychology & Psychotherapy*, *22*(6), 469–487. https://doi.org/10.1002/cpp.1917
- **URL/DOI:** https://doi.org/10.1002/cpp.1917
- **Barrier:** paywall (Clinical Psychology & Psychotherapy)
- **Layer:** 2-naturalistic
- **Why it matters:** Directly addresses whether dose alone explains long-term therapy effects, or whether technique also matters. The finding that post-treatment differences are mediated by session count but follow-up differences by technique is a key nuance.
- **Impact on conclusions:** Without this source, the review cannot distinguish between dose and technique as mediators of long-term outcome — a central conceptual distinction.
- **Date identified:** 2026-03-18
- **Status:** unresolved

## Resolved

*Sources that were initially inaccessible but later obtained and annotated.*

---

# Media to download and transcribe

Videos, podcasts, and lectures identified during search. Download media, transcribe (Soniox pipeline or Whisper), place transcript in `_media/` dir. See `2_methods/14_agent_instructions.md` § Media sources.

*No entries yet.*

---

# Other tasks

## Brainstorm: tables and figures

After results extraction is underway, brainstorm possible tables and figures for `5_tables_and_figures/`. Starting candidates from `2_methods/11_synthesis_method.md`:

- Cross-layer evidence matrix (which layers contribute to which dimensions)
- Duration estimate table (durations by source, layer, population, endpoint definition)
- Convergence/divergence map (where layers agree/disagree)
- Trajectory typology (visual patterns if they emerge)

Additional ideas to consider during execution:
- *Add here as they arise*
