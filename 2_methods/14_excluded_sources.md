---
section: excluded_sources
description: "Sources identified during search but not included in the review — with reason for exclusion. Supports CIS transparency requirement and allows reader to evaluate source selection."
status: not started
---

# Excluded sources

Every source identified as potentially relevant during search must be accounted for — either as an included source (annotated in `3_results/sources/`) or as an excluded source (listed here with the reason for exclusion).

This file supports the CIS requirement that source selection is transparent and defensible. A reader should be able to review this list and judge whether the exclusion decisions were reasonable.

## Exclusion reasons (standard codes)

| Code | Meaning |
|------|---------|
| **POP** | Population mismatch — single-incident PTSD, children, subclinical, adjustment disorders |
| **SCOPE** | Outside scope — does not address duration, trajectory, or temporal experience |
| **DUP** | Duplicate — same study reported elsewhere; more complete version included |
| **PROTOCOL** | Protocol or design paper without outcome data |
| **BUDGET** | Relevant but excluded due to source budget constraint — budget reached |
| **LANGUAGE** | Not available in English |
| **USER** | User reviewed and decided not to include |

## Format

```markdown
### [Author (Year)] — [Short title]

- **Citation:** [APA 7 if available, or title + journal]
- **Found via:** [search term / snowball from source-id / database]
- **Layer:** [which layer it would belong to]
- **Reason for exclusion:** [code + brief explanation]
- **Date:** [YYYY-MM-DD]
- **Decided by:** [agent recommendation | user decision | both]
```

## Excluded sources by layer

### Layer 1: Academic

### Viljoen (2024) — POP (eating disorders)

- **Citation:** Viljoen 2024
- **Found via:** PubMed / complex PTSD long-term treatment duration outcomes
- **Layer:** 1-academic
- **Reason for exclusion:** POP — eating disorders, population mismatch
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Burger (2022) — SCOPE (PTSD in psychosis, protocol)

- **Citation:** Burger 2022
- **Found via:** PubMed / complex PTSD long-term treatment duration outcomes
- **Layer:** 1-academic
- **Reason for exclusion:** SCOPE — PTSD in psychosis, protocol paper without outcome data
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Bateman (2016) — SCOPE (ICU conference proceedings)

- **Citation:** Bateman 2016
- **Found via:** PubMed / complex PTSD long-term treatment duration outcomes
- **Layer:** 1-academic
- **Reason for exclusion:** SCOPE — ICU conference proceedings, outside scope
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Patel (2014) — POP (torture survivors)

- **Citation:** Patel 2014
- **Found via:** PubMed / complex PTSD long-term treatment duration outcomes
- **Layer:** 1-academic
- **Reason for exclusion:** POP — torture survivors, population mismatch
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Kobeissy (2013) — POP (blast-related brain injury)

- **Citation:** Kobeissy 2013
- **Found via:** PubMed / complex PTSD long-term treatment duration outcomes
- **Layer:** 1-academic
- **Reason for exclusion:** POP — blast-related brain injury, population mismatch
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Bowirrat (2010) — SCOPE (neurogenetics)

- **Citation:** Bowirrat 2010
- **Found via:** PubMed / complex PTSD long-term treatment duration outcomes
- **Layer:** 1-academic
- **Reason for exclusion:** SCOPE — neurogenetics, outside scope
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Mauritz (2014) — SCOPE (single case study)

- **Citation:** Mauritz 2014
- **Found via:** PubMed / phase-based trauma treatment stabilization processing integration
- **Layer:** 1-academic
- **Reason for exclusion:** SCOPE — single case study
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Wamser-Nanney (2016) — POP (children, not adults)

- **Citation:** Wamser-Nanney 2016
- **Found via:** PubMed / premature termination dropout complex trauma psychotherapy
- **Layer:** 1-academic
- **Reason for exclusion:** POP — children, not adults
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Bartsch (2025) — SCOPE (short-term BPD group, not about duration)

- **Citation:** Bartsch 2025
- **Found via:** Scholar Gateway / BPD treatment duration personality change
- **Layer:** 1-academic
- **Reason for exclusion:** SCOPE — short-term BPD group, not about duration
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Juul (2022) — SCOPE (short-term MBT case illustration)

- **Citation:** Juul 2022
- **Found via:** Scholar Gateway / BPD treatment duration personality change
- **Layer:** 1-academic
- **Reason for exclusion:** SCOPE — short-term MBT case illustration, not about duration
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Muskens (2024) — SCOPE (intelligence as predictor, not duration)

- **Citation:** Muskens 2024
- **Found via:** Scholar Gateway / BPD treatment duration personality change
- **Layer:** 1-academic
- **Reason for exclusion:** SCOPE — intelligence as predictor, not duration
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Kramer (2021) — SCOPE (interpersonal pattern change, not duration)

- **Citation:** Kramer 2021
- **Found via:** Scholar Gateway / BPD treatment duration personality change
- **Layer:** 1-academic
- **Reason for exclusion:** SCOPE — interpersonal pattern change, not duration
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Laporte (2018) — BUDGET (stepped care BPD)

- **Citation:** Laporte 2018
- **Found via:** Scholar Gateway / BPD treatment duration personality change
- **Layer:** 1-academic
- **Reason for exclusion:** BUDGET — stepped care BPD, relevant but budget constraint; noted as complicating: no difference between 6-12 and 18-24 month completers
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Maddox & McInerney (2025) — BUDGET (existential trauma framework)

- **Citation:** Maddox & McInerney (2025)
- **Found via:** Manual search / humanistic-existential trauma
- **Layer:** 1c-humanistic-existential
- **Reason for exclusion:** BUDGET — existential trauma framework, relevant but not obtained; budget reached for 1c
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Stolorow et al. (1987) — BUDGET (intersubjective approach)

- **Citation:** Stolorow, Brandchaft, & Atwood (1987)
- **Found via:** Manual search / psychoanalytic intersubjectivity
- **Layer:** 1b-psychoanalytic
- **Reason for exclusion:** BUDGET — intersubjective approach, less directly about duration; budget reached for 1b
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Layer 2: Naturalistic studies

### Willemsen et al. (2024) — TADS case study of treatment failure

- **Citation:** Willemsen et al. (2024) — TADS case study
- **Found via:** PubMed / snowball from fonagy-2015-tads
- **Layer:** 2-naturalistic
- **Reason for exclusion:** SCOPE — single case, not duration data
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Rost et al. (2019) — TADS personality moderator

- **Citation:** Rost et al. (2019) — TADS personality moderator analysis
- **Found via:** PubMed / snowball from fonagy-2015-tads
- **Layer:** 2-naturalistic
- **Reason for exclusion:** SCOPE — modality detail, not duration
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Benecke et al. (2009) — Commentary on L&R meta-analysis

- **Citation:** Benecke et al. (2009) — Commentary on Leichsenring & Rabung meta-analysis
- **Found via:** PubMed / snowball from leichsenring-2011-ltpp-meta
- **Layer:** 2-naturalistic
- **Reason for exclusion:** DUP — derivative of included L&R 2011
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Rief & Hofmann (2009) — Critique of L&R

- **Citation:** Rief & Hofmann (2009) — Critique of Leichsenring & Rabung
- **Found via:** PubMed / snowball from leichsenring-2011-ltpp-meta
- **Layer:** 2-naturalistic
- **Reason for exclusion:** DUP — derivative
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Stenius et al. (2022) — Helsinki Rorschach predictor

- **Citation:** Stenius et al. (2022) — Helsinki Psychotherapy Study Rorschach predictor
- **Found via:** PubMed / snowball from lindfors-2019-helsinki-10yr
- **Layer:** 2-naturalistic
- **Reason for exclusion:** SCOPE — too specific
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Alanne et al. (2021) — Helsinki work ability predictor

- **Citation:** Alanne et al. (2021) — Helsinki Psychotherapy Study work ability predictor
- **Found via:** PubMed / snowball from lindfors-2019-helsinki-10yr
- **Layer:** 2-naturalistic
- **Reason for exclusion:** SCOPE — too specific
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Brand & Stadnik (2013) — TOP DD dissociation predictors

- **Citation:** Brand & Stadnik (2013) — TOP DD dissociation predictors
- **Found via:** PubMed / snowball from brand-2019-topdd
- **Layer:** 2-naturalistic
- **Reason for exclusion:** SCOPE — secondary analysis, not about duration
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Brand & Loewenstein (2014) — TOP DD iatrogenic question

- **Citation:** Brand & Loewenstein (2014) — TOP DD iatrogenic question
- **Found via:** PubMed / snowball from brand-2019-topdd
- **Layer:** 2-naturalistic
- **Reason for exclusion:** SCOPE — not about duration
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Kopta (2003) — Commentary on Howard dose-effect

- **Citation:** Kopta (2003) — Commentary on Howard dose-effect model
- **Found via:** PubMed / snowball from howard-1986-dose-effect
- **Layer:** 2-naturalistic
- **Reason for exclusion:** DUP — derivative of included Howard 1986
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Knekt et al. (2024) — Helsinki social support 5-year follow-up

- **Citation:** Knekt et al. (2024) — Helsinki Psychotherapy Study social support 5-year follow-up
- **Found via:** PubMed / Knekt Helsinki Psychotherapy Study
- **Layer:** 2-naturalistic
- **Reason for exclusion:** SCOPE — social support only. **NOTE:** complicates thesis — little difference between short/long therapy on social support. Flag for discussion.
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### McKay (2011) — Commentary on Shedler

- **Citation:** McKay (2011) — Commentary on Shedler 2010
- **Found via:** PubMed / snowball from shedler-2010-efficacy
- **Layer:** 2-naturalistic
- **Reason for exclusion:** DUP — derivative of included Shedler 2010
- **Date:** 2026-03-18
- **Decided by:** agent recommendation

### Layer 3: Counterpoint

*No entries yet.*

### Layer 4: Practitioner

*No entries yet.*

### Layer 5: Client narratives

*No entries yet.*

### Layer 6: Memoirs

*No entries yet.*
