#!/usr/bin/env python3
"""Generate references.bib from source note YAML frontmatter.

Reads all source annotations in 3_results/sources/, extracts YAML fields,
and produces BibTeX entries. Uses the `type` field to choose the BibTeX
entry type and the `citation` field as the authoritative APA string
(stored in a `note` field for human reference).

Usage: python3 _scripts/generate_bib.py > 6_references/references.bib
"""

import os
import re
import sys
import glob

def extract_yaml(filepath):
    """Extract YAML frontmatter from a markdown file."""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    m = re.match(r'^---\n(.*?)\n---', content, re.DOTALL)
    if not m:
        return {}
    yaml_text = m.group(1)
    fields = {}
    for line in yaml_text.split('\n'):
        # Simple key: value parsing (handles quoted values)
        km = re.match(r'^(\w[\w_]*)\s*:\s*(.+)$', line)
        if km:
            key = km.group(1).strip()
            val = km.group(2).strip()
            # Remove surrounding quotes
            if (val.startswith('"') and val.endswith('"')) or \
               (val.startswith("'") and val.endswith("'")):
                val = val[1:-1]
            fields[key] = val
    return fields


def type_to_bibtex(source_type):
    """Map source type to BibTeX entry type."""
    mapping = {
        'article': 'article',
        'book': 'book',
        'chapter': 'incollection',
        'blog': 'misc',
        'forum-thread': 'misc',
        'memoir': 'book',
        'video': 'misc',
        'podcast': 'misc',
        'lecture': 'misc',
    }
    return mapping.get(source_type, 'misc')


def escape_bibtex(s):
    """Escape special characters for BibTeX."""
    # Replace & with \& but not if already escaped
    s = re.sub(r'(?<!\\)&', r'\\&', s)
    return s


def extract_journal_from_citation(citation):
    """Try to extract journal name from APA citation (text between *...*). """
    m = re.search(r'\*([^*]+)\*', citation)
    if m:
        return m.group(1)
    return ''


def extract_volume_pages(citation):
    """Try to extract volume, number, pages from APA citation."""
    volume = ''
    number = ''
    pages = ''
    # Pattern: *Journal*, *vol*(num), pages.
    m = re.search(r'\*(\d+)\*\((\d+)\),?\s*([\d–-]+)', citation)
    if m:
        volume = m.group(1)
        number = m.group(2)
        pages = m.group(3)
    else:
        # Try without number: *vol*, pages
        m = re.search(r'\*(\d+)\*,?\s*([\d–-]+)', citation)
        if m:
            volume = m.group(1)
            pages = m.group(2)
    return volume, number, pages


def extract_doi_from_url(url):
    """Extract DOI from a URL field."""
    if not url or url == 'no URL available':
        return ''
    m = re.search(r'(10\.\d{4,}/[^\s]+)', url)
    if m:
        return m.group(1)
    return ''


def generate_entry(fields):
    """Generate a single BibTeX entry from YAML fields."""
    source_id = fields.get('id', '')
    if not source_id:
        return ''

    entry_type = type_to_bibtex(fields.get('type', 'misc'))
    author = escape_bibtex(fields.get('author', ''))
    title = escape_bibtex(fields.get('title', ''))
    year = fields.get('year', '')
    citation = fields.get('citation', '')
    url = fields.get('url', '')
    doi = extract_doi_from_url(url)

    lines = [f'@{entry_type}{{{source_id},']
    lines.append(f'  author = {{{author}}},')
    lines.append(f'  title = {{{{{title}}}}},')
    lines.append(f'  year = {{{year}}},')

    if entry_type == 'article':
        journal = extract_journal_from_citation(citation)
        if journal:
            lines.append(f'  journal = {{{escape_bibtex(journal)}}},')
        volume, number, pages = extract_volume_pages(citation)
        if volume:
            lines.append(f'  volume = {{{volume}}},')
        if number:
            lines.append(f'  number = {{{number}}},')
        if pages:
            lines.append(f'  pages = {{{pages}}},')

    if entry_type == 'book':
        # Try to extract publisher from citation
        # APA: Author (Year). *Title*. Publisher.
        pm = re.search(r'\*[^*]+\*\.\s*([^.]+)\.$', citation)
        if pm:
            lines.append(f'  publisher = {{{escape_bibtex(pm.group(1).strip())}}},')

    if doi:
        lines.append(f'  doi = {{{doi}}},')
    elif url and url != 'no URL available':
        lines.append(f'  url = {{{url}}},')

    # Store full APA citation as note for reference
    if citation:
        safe_citation = escape_bibtex(citation.replace('{', '\\{').replace('}', '\\}'))
        lines.append(f'  note = {{APA: {safe_citation}}},')

    lines.append('}')
    return '\n'.join(lines)


def main():
    basedir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    sources_dir = os.path.join(basedir, '3_results', 'sources')

    # Find all source notes
    patterns = [
        os.path.join(sources_dir, '*', '*.md'),
        os.path.join(sources_dir, '*', '*', '*.md'),
    ]
    files = []
    for pat in patterns:
        files.extend(glob.glob(pat))

    # Filter out templates, READMEs, and underscore dirs
    files = [f for f in files
             if not os.path.basename(f) in ('SOURCE_TEMPLATE.md', 'README.md')
             and '/_' not in f.replace(sources_dir, '')
             and '/.' not in f.replace(sources_dir, '')]
    files.sort()

    entries = []
    for filepath in files:
        fields = extract_yaml(filepath)
        entry = generate_entry(fields)
        if entry:
            entries.append(entry)

    # Output
    print(f'%% references.bib — auto-generated from source note YAML')
    print(f'%% {len(entries)} entries from 3_results/sources/')
    print(f'%% Regenerate with: python3 _scripts/generate_bib.py > 6_references/references.bib')
    print()
    print('\n\n'.join(entries))


if __name__ == '__main__':
    main()
