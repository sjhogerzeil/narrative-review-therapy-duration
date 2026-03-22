# Reproducible Research: GitHub Repository Checklist

**A practitioner's checklist for full computational reproducibility**

Synthesized from: Wilson et al. (2017) "Good Enough Practices in Scientific Computing"; The Turing Way; Marwick et al. (2018) "Packaging Data Analytical Work Reproducibly"; Nüst et al. (2020) "Ten Simple Rules for Writing Dockerfiles"; the FAIR4RS principles; CodeRefinery; rOpenSci; the World Bank Reproducible Research Repository guidelines; and community practice across GitHub.

---

## How to use this document

Each section contains a **checklist** of concrete items followed by **testing questions** — questions a reviewer, collaborator, or your future self should be able to answer "yes" to. A negative answer on any testing question identifies a gap in reproducibility.

The checklist is ordered from *foundational* (everyone should do this) to *advanced* (gold standard). Items marked with `[FOUNDATION]` are the minimum viable set. Items marked `[STANDARD]` represent current community norms. Items marked `[GOLD]` represent best-in-class practice.

---

## 1. Repository Structure & Organisation

### Checklist

- [ ] `[FOUNDATION]` Project lives in a dedicated Git repository (not scattered across drives or emails)
- [ ] `[FOUNDATION]` Clear top-level directory structure separating data, code, results, and documentation
- [ ] `[FOUNDATION]` `README.md` exists at root with: project description, how to reproduce results, dependencies, contact info
- [ ] `[STANDARD]` Follows a recognised project layout convention (research compendium, Cookiecutter, or domain equivalent)
- [ ] `[STANDARD]` No spaces or special characters in file/directory names
- [ ] `[STANDARD]` `docs/` directory contains extended documentation, methods notes, or a data dictionary
- [ ] `[GOLD]` Structure matches a template (e.g., Turing Way reproducible-project-template, rrtools, Cookiecutter Data Science)

**Reference structure:**
```
project/
├── README.md
├── LICENSE
├── CITATION.cff
├── CHANGELOG.md
├── data/
│   ├── raw/           # Immutable original data
│   └── processed/     # Cleaned/transformed data
├── src/ (or code/, analysis/, scripts/)
│   ├── 01_clean.py
│   ├── 02_analyse.py
│   └── 03_visualise.py
├── results/
│   ├── figures/
│   └── tables/
├── docs/
│   └── data_dictionary.md
├── tests/
├── environment.yml (or requirements.txt, renv.lock)
├── Makefile (or Snakefile, dvc.yaml, Justfile)
└── Dockerfile (or .devcontainer/)
```

### Testing Questions

1. Can a stranger find the README and, from it alone, understand what the project does?
2. Can you identify which files are raw data, which are code, and which are outputs, just from the directory tree?
3. If you deleted every file in `results/`, could you regenerate them all from `data/` + `src/`?
4. Are file names self-documenting (i.e., `01_clean_survey_data.R` rather than `script2_final_v3.R`)?

---

## 2. Documentation

### Checklist

- [ ] `[FOUNDATION]` README contains: what the project is, how to set up the environment, how to run the analysis
- [ ] `[FOUNDATION]` Each script begins with a brief comment explaining its purpose
- [ ] `[STANDARD]` README includes a "Quick Start / Reproduce" section with exact commands to run
- [ ] `[STANDARD]` Data dictionary or codebook documents every variable, its type, units, and allowed values
- [ ] `[STANDARD]` Any manual steps (downloads from external APIs, GUI actions) are documented in prose if they cannot be scripted
- [ ] `[STANDARD]` Key methodological decisions are documented (why a particular threshold, why a particular model)
- [ ] `[GOLD]` A `CHANGELOG.md` tracks what changed between versions of the analysis
- [ ] `[GOLD]` Documentation is literate (Quarto, R Markdown, Jupyter notebooks) — narrative interleaved with code that actually executes

### Testing Questions

1. Could a competent researcher in your field reproduce your results using *only* the README and the repository contents, without emailing you?
2. Is every column in every data file explained somewhere?
3. Are there any "magic numbers" in your code that are not explained in a comment or parameter file?
4. If you came back to this project in two years, would you understand *why* you made each analytical choice?

---

## 3. Version Control

### Checklist

- [ ] `[FOUNDATION]` Project is under Git version control
- [ ] `[FOUNDATION]` `.gitignore` excludes generated files, large data, credentials, and OS artefacts
- [ ] `[STANDARD]` Commits are atomic and have meaningful messages (not "fixed stuff" or "update")
- [ ] `[STANDARD]` Tagged releases correspond to key milestones (submission, revision, acceptance, publication)
- [ ] `[STANDARD]` No large binary files tracked directly in Git (use Git LFS, DVC, or external storage)
- [ ] `[STANDARD]` Sensitive data (API keys, participant identifiers) are never committed — not even in history
- [ ] `[GOLD]` Branching strategy is used for experimental analyses (so main/master always runs cleanly)
- [ ] `[GOLD]` The commit that produced published results is tagged and referenced in the paper

### Testing Questions

1. Can you check out a specific tagged commit and reproduce the exact results from a given version of the paper?
2. Is the Git history free of accidentally committed secrets or large data files?
3. Does every tagged release produce the outputs it claims to produce?
4. If you `git clone` this repo on a fresh machine, does `.gitignore` prevent pollution of the working tree?

---

## 4. Data Management

### Checklist

- [ ] `[FOUNDATION]` Raw data is preserved unmodified and clearly separated from processed data
- [ ] `[FOUNDATION]` Data sources are documented: URL, access date, version, DOI, or download instructions
- [ ] `[FOUNDATION]` All transformations from raw to processed are scripted — no manual Excel edits
- [ ] `[STANDARD]` Data is in open, non-proprietary formats (CSV, TSV, Parquet, JSON — not .xlsx or .sav)
- [ ] `[STANDARD]` Data files include or are accompanied by metadata (column descriptions, units, missing value codes)
- [ ] `[STANDARD]` If data is too large for Git: DVC, Git LFS, or an external repository (Zenodo, Figshare, Dryad) is used, with clear retrieval instructions
- [ ] `[STANDARD]` If data cannot be shared (privacy, licensing), synthetic or sample data is provided so the pipeline can be tested
- [ ] `[GOLD]` Data files have checksums (SHA-256) recorded in the repo so integrity can be verified
- [ ] `[GOLD]` Data is versioned (DVC, LakeFS, or separate Zenodo deposits per version)
- [ ] `[GOLD]` Dataset has its own DOI and citation (separate from the paper/code)

### Testing Questions

1. If the original data source went offline tomorrow, could you still reproduce your results from what is in (or linked from) the repository?
2. Is there any step between raw data and results that exists only in someone's head or in an unversioned spreadsheet?
3. Can you verify that the data files haven't been silently altered since you last ran the analysis?
4. If your data can't be shared, is there a synthetic substitute that exercises every code path?

---

## 5. Dependency & Environment Management

### Checklist

- [ ] `[FOUNDATION]` All software dependencies (language, packages, system libraries) are listed explicitly
- [ ] `[FOUNDATION]` Package versions are pinned (not just `pandas` but `pandas==2.1.4`)
- [ ] `[STANDARD]` A lock file captures the exact resolved dependency graph: `requirements.txt` with pinned versions, `renv.lock`, `poetry.lock`, `conda-lock.yml`, `package-lock.json`
- [ ] `[STANDARD]` The language runtime version is specified (e.g., `python_requires >= 3.11`, `.python-version`, `.Rprofile` with version)
- [ ] `[STANDARD]` Instructions for creating the environment from scratch are in the README: `conda env create -f environment.yml` or equivalent
- [ ] `[GOLD]` A container (Docker, Singularity/Apptainer) captures the full stack including OS, system libraries, and runtime
- [ ] `[GOLD]` The container image is published to a registry (Docker Hub, GitHub Packages, GHCR) or archived (Zenodo)
- [ ] `[GOLD]` Dockerfile pins the base image by digest, not just tag (e.g., `python:3.11@sha256:abc...` not just `python:3.11`)

### Testing Questions

1. If you `pip install -r requirements.txt` (or equivalent) on a clean machine, does it succeed and produce the same outputs?
2. Two years from now, will `pip install pandas` still give you the *same* version? (If the answer is "no" and you haven't pinned, you have a problem.)
3. Does your environment specification include *system-level* dependencies (e.g., GDAL, libcurl, Java)?
4. Can someone on a different OS (Linux vs Mac vs Windows) set up your environment without modification?
5. If you use a Dockerfile, does building it today produce a functionally identical image to when you first wrote it?

---

## 6. Workflow Automation & Execution

### Checklist

- [ ] `[FOUNDATION]` There is a single entry point to run the full analysis (`make all`, `snakemake`, `dvc repro`, `bash run_all.sh`, a master script)
- [ ] `[FOUNDATION]` Running that entry point regenerates all results from raw data
- [ ] `[STANDARD]` Build tool captures dependencies between steps so only invalidated stages re-run (Make, Snakemake, DVC, Nextflow, targets)
- [ ] `[STANDARD]` Random seeds are set explicitly in code and recorded in a parameters file
- [ ] `[STANDARD]` Parameters and hyperparameters live in a config file (`params.yaml`, `config.toml`) — not hard-coded in scripts
- [ ] `[STANDARD]` Non-deterministic operations are documented (GPU non-determinism, parallel execution order)
- [ ] `[GOLD]` The pipeline is idempotent — running it twice produces identical results
- [ ] `[GOLD]` Intermediate results can be cached and validated (hashed with DVC, Snakemake checkpoints)
- [ ] `[GOLD]` All figures and tables in the manuscript are generated by the pipeline (no post-hoc manual edits in Illustrator/PowerPoint)

### Testing Questions

1. What is the single command that reproduces every result? (If the answer is "it's complicated," you have a problem.)
2. Can you delete all output files and regenerate them in one step?
3. If you change one parameter in the config file and re-run, does the pipeline rebuild only what is affected?
4. Are random seeds fixed? If you run the pipeline twice, do you get bit-identical results?
5. Are any figures manually edited after generation? (If so, those edits are not reproducible.)

---

## 7. Testing & Validation

### Checklist

- [ ] `[FOUNDATION]` You have manually verified that the pipeline runs end-to-end on at least one machine besides your own
- [ ] `[STANDARD]` Sanity checks exist in the code: assertions on data shapes, value ranges, expected row counts
- [ ] `[STANDARD]` Custom functions have unit tests (pytest, testthat)
- [ ] `[STANDARD]` Integration test: the full pipeline runs successfully on a small subset of data (or synthetic data)
- [ ] `[GOLD]` Expected outputs (known result on test data, or numerical tolerances) are checked automatically
- [ ] `[GOLD]` Regression tests verify that results don't silently change when code is modified
- [ ] `[GOLD]` Code has been reviewed by at least one person other than the author

### Testing Questions

1. Has anyone besides you successfully run this pipeline from scratch?
2. If someone introduces a bug that changes a key output by 0.1%, will your tests catch it?
3. Are there assertions that would fail if the input data were corrupted or malformed?
4. Has the code been reviewed? (Code review is to analysis what peer review is to prose.)

---

## 8. Continuous Integration

### Checklist

- [ ] `[STANDARD]` GitHub Actions (or equivalent) runs the pipeline or test suite on every push or PR
- [ ] `[STANDARD]` CI builds the environment from the specification file (not from a pre-configured runner)
- [ ] `[STANDARD]` CI status badge is displayed in the README
- [ ] `[GOLD]` CI builds the Docker container and runs the analysis inside it
- [ ] `[GOLD]` CI compares outputs against expected results and flags deviations
- [ ] `[GOLD]` CI runs on a schedule (weekly/monthly) to detect dependency rot ("it worked when we published" but breaks six months later)

### Testing Questions

1. Does a green CI badge currently mean "the full pipeline runs and produces correct results"? Or does it just mean "the linter passed"?
2. If a dependency releases a breaking update, will CI catch it before you discover it manually?
3. Is the CI configuration itself version-controlled and documented?

---

## 9. Licensing & Legal

### Checklist

- [ ] `[FOUNDATION]` A `LICENSE` file exists at the root of the repository
- [ ] `[FOUNDATION]` Code and data have appropriate, explicit licenses (they can be different)
- [ ] `[STANDARD]` Code uses an OSI-approved license (MIT, Apache 2.0, GPL-3.0, BSD)
- [ ] `[STANDARD]` Data uses a license appropriate for data (CC-BY 4.0, CC0, ODbL)
- [ ] `[STANDARD]` Third-party data and code licenses are documented and compatible with your license
- [ ] `[GOLD]` If data has access restrictions (privacy, ethics), the restrictions and access procedures are documented

### Testing Questions

1. Is it legally clear what someone can and cannot do with your code?
2. Is it legally clear what someone can and cannot do with your data?
3. If you use third-party data, does your license comply with theirs?
4. If someone forks your repository and modifies it, do they know their obligations?

---

## 10. Citation & Archival

### Checklist

- [ ] `[FOUNDATION]` The repository has a `CITATION.cff` file (GitHub renders a "Cite this repository" button from it)
- [ ] `[STANDARD]` A release of the repository is archived on Zenodo (or Figshare, Dryad) with a DOI
- [ ] `[STANDARD]` The Zenodo DOI is included in the paper and in the README
- [ ] `[STANDARD]` Zenodo is connected to GitHub so new tagged releases automatically get archived
- [ ] `[STANDARD]` The paper/manuscript cites the software, data, and repository as separate entities where appropriate
- [ ] `[GOLD]` Container images are also archived (Zenodo, GHCR with immutable tags)
- [ ] `[GOLD]` `codemeta.json` provides machine-readable metadata beyond what CITATION.cff covers
- [ ] `[GOLD]` ORCID iDs are included for all authors in CITATION.cff

### Testing Questions

1. Can someone cite your code and data separately from your paper?
2. If GitHub goes down permanently, is your work preserved somewhere with a persistent identifier?
3. Does the DOI in your paper point to the *exact* version of the code that produced those results (not just "the repo")?

---

## 11. FAIR Compliance (Findable, Accessible, Interoperable, Reusable)

### Checklist

- [ ] `[STANDARD]` **Findable:** Repository has rich metadata (description, topics/tags, keywords) and a persistent identifier (DOI)
- [ ] `[STANDARD]` **Accessible:** Data and code are retrievable via standard protocols (HTTPS, API). If restricted, access procedures are documented
- [ ] `[STANDARD]` **Interoperable:** Data is in open formats; standard vocabularies and schemas are used where applicable
- [ ] `[STANDARD]` **Reusable:** Clear licenses, provenance documentation, and community standards are followed

### Testing Questions

1. Can a search engine (Google Dataset Search, DataCite, OpenAIRE) discover your dataset?
2. Is your data in a format that doesn't require proprietary software to read?
3. Would a researcher from a neighbouring discipline understand your variable names and units without domain expertise?
4. Five years from now, will all the links in your README still work?

---

## Meta-Checklist: The Acid Tests

These are the five questions that cut through everything above. If you can answer "yes" to all five, your repository is reproducible in practice.

| # | Acid Test | What it validates |
|---|-----------|-------------------|
| 1 | **Clone-and-run:** Can a stranger `git clone` your repo, follow the README, and reproduce your published figures within an hour? | Documentation, environment, automation |
| 2 | **Time-travel:** If you check out the tagged release from 18 months ago, does it still run? | Dependency pinning, archival, containers |
| 3 | **Data integrity:** Can you verify that every data file is bit-identical to the version used in the published analysis? | Checksums, data versioning |
| 4 | **Parameter sweep:** Can you change a single parameter in a config file and re-run the pipeline, getting updated results? | Separation of config from code, automation |
| 5 | **Bus factor:** If you were unavailable, could a colleague take over this project using only the repository? | Documentation, licensing, clarity |

---

## Graduated Implementation Path

Not everything needs to happen at once. Here is a practical sequence:

**Week 1 — Bare minimum:** Repository with README, LICENSE, `.gitignore`, raw data separated from code, a single script or master file that runs the analysis.

**Week 2 — Environment:** Pin dependencies in a lock file. Add a "How to reproduce" section to the README with exact commands.

**Month 1 — Automation:** Add a Makefile or equivalent that captures the pipeline. Set random seeds. Externalise parameters to a config file.

**Month 2 — Testing & CI:** Add assertions and basic tests. Set up GitHub Actions to run the pipeline on push.

**Before submission — Archival:** Tag the release, connect to Zenodo, add CITATION.cff, verify the Acid Tests above.

**Gold standard (ongoing):** Containerise, version data with DVC, add scheduled CI, publish container images.

---

## Key References

- Wilson, G. et al. (2017). Good enough practices in scientific computing. *PLOS Computational Biology*, 13(6), e1005510.
- Marwick, B., Boettiger, C., & Mullen, L. (2018). Packaging Data Analytical Work Reproducibly Using R (and Friends). *The American Statistician*, 72(1), 80–88.
- Nüst, D. et al. (2020). Ten simple rules for writing Dockerfiles for reproducible data science. *PLOS Computational Biology*, 16(11), e1008316.
- The Turing Way Community. (2024). *The Turing Way: A handbook for reproducible, ethical and collaborative research.* https://book.the-turing-way.org
- Wilkinson, M. D. et al. (2016). The FAIR Guiding Principles for scientific data management and stewardship. *Scientific Data*, 3, 160018.
- Semmelrock, S. et al. (2025). Reproducibility in machine-learning-based research: Overview, barriers, and drivers. *AI Magazine*.
