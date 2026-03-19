# ChatGPT query to find Reddit threads

Copy-paste this prompt into ChatGPT (which has licensed access to Reddit data). Ask it to search and return thread URLs with summaries.

---

## Prompt

```
I'm conducting a structured narrative review on how long therapy for complex developmental trauma (CPTSD) actually takes. I need to find Reddit threads where people share their lived experience of long-term therapy.

Please search Reddit — specifically r/CPTSD, r/CPTSDNextSteps, r/CPTSD_NSCommunity, and r/TalkTherapy — for threads matching the criteria below. For each thread you find, give me:

1. The exact Reddit URL
2. Thread title
3. Number of comments (approximate)
4. A 2-3 sentence summary of what the thread contains
5. Which of my research questions it addresses (see list below)

SELECTION CRITERIA:
- 20+ comments
- Retrospective tone — people looking BACK on years of therapy, not posting mid-crisis
- Specific duration data mentioned (years, session counts, timelines)
- Complex trauma / CPTSD / developmental trauma (not single-incident PTSD)
- Substantive narrative posts (paragraphs, not one-liners)

MY RESEARCH QUESTIONS:

PRIMARY: How long does healing from complex developmental trauma take?

SECONDARY:
1. Continuous or interrupted therapy? (breaks, pauses, episodic engagement)
2. One modality or many? (did they switch from CBT to EMDR to psychodynamic etc?)
3. One therapist or several? (what happened when they changed?)
4. Session frequency? (weekly, twice weekly, monthly)
5. Phase-based or organic trajectory?
6. Therapy alone or therapy-plus? (medication, bodywork, groups, community)

SPECIFIC CONSTRUCTS I'M TRACKING:
- "Sleeper effect": did they continue improving AFTER therapy ended?
- "Endpoint divergence": what does "healed" mean to them? Symptom-free or identity change?
- "Escalation gap": what happened when they had to change therapists?
- "RCT-reality gap": did brief protocols (EMDR 8-16 sessions, CBT 12 weeks) work for their CPTSD, or did they need years?
- "Access barriers": could they afford/access long-term therapy?
- "Identity dimension": did therapy change WHO THEY ARE, not just how they feel?

IDEAL THREADS LOOK LIKE:
- "I've been in therapy for 8 years for CPTSD. Here's what I've learned."
- "Looking back on my healing journey — 5 therapists, 3 modalities, 10 years"
- "EMDR was great for my single-event trauma but didn't touch my developmental stuff"
- "I can't afford therapy anymore. What worked for me outside of sessions."
- "I don't recognize myself anymore — therapy changed everything about who I am"

Please find 15-20 threads and present them as a table with columns:
URL | Title | Subreddit | Comments | Summary | Research questions addressed
```

---

## Follow-up prompts

After ChatGPT returns the initial list, use these follow-ups:

### For the best threads:
```
For threads [1, 3, 7, 12] from your list — can you show me the original post text and the top 10 most-upvoted comments from each? I need the actual content, not just summaries.
```

### For specific constructs:
```
Can you find more threads specifically about:
- People who tried EMDR for CPTSD and found it insufficient (needed longer/deeper work)
- People who describe continuing to heal AFTER therapy ended
- People who had to change therapists during trauma therapy and what that experience was like
```

### For duration data:
```
From the threads you found, can you extract all specific duration mentions? I need a list like:
- [username]: [X] years in therapy, [modalities tried], [current status]
Present as a table.
```

---

## What to do with the results

1. Copy ChatGPT's thread list into: `3_results/sources/5-client-narratives/_reddit_raw/chatgpt_thread_list.md`
2. For threads with full content provided, save each as: `_reddit_raw/reddit-[subreddit]-[slug].md`
3. Tell Claude which threads to annotate
