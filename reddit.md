# Reddit data access — instructions

## Why we need this

Reddit's r/CPTSD (~500K members), r/CPTSDNextSteps, r/TalkTherapy are the largest English-language communities where people with complex trauma discuss therapy duration in detail. Anthropic's crawler is blocked from Reddit at the platform level. We need an alternative route.

## Option 1: PRAW script (programmatic)

### Setup

1. Go to https://www.reddit.com/prefs/apps/
2. Click "create another app..." at the bottom
3. Fill in:
   - Name: `therapy-duration-review`
   - Type: **script**
   - Description: `Research on therapy duration for structured narrative review`
   - Redirect URI: `http://localhost:8080`
4. Click "create app"
5. Note:
   - **Client ID** = string shown under the app name (looks like `a1b2c3d4e5f6g7`)
   - **Client secret** = the "secret" field

### Run

```bash
cd /Users/simonhogerzeil/Library/CloudStorage/Dropbox-SAU/Simon\ Hogerzeil/my-home/my-writing/blog-therapy-duration

export REDDIT_CLIENT_ID="your_client_id_here"
export REDDIT_CLIENT_SECRET="your_client_secret_here"

.venv/bin/python scripts/reddit_search.py
```

### What it does

- Searches 4 subreddits × 13 queries = 52 searches
- Filters: min 15 comments, min score 10
- Dumps each qualifying thread as markdown (YAML header + post + top 20 comments)
- Output: `3_results/sources/5-client-narratives/_reddit_raw/`
- Review the raw files, pick the best 10, move to `5-client-narratives/` for annotation

### Troubleshooting

- If Reddit returns 403/429: wait 60 seconds, try again. Rate limit is ~60 requests/minute.
- If "unauthorized": double-check client ID and secret. Make sure app type is "script" not "web app."
- If Reddit API refuses entirely: try Option 2 or 3 below.

## Option 2: Reddit Answers (manual, quick)

1. Go to https://www.reddit.com/answers
2. Ask these questions one at a time:
   - "How long does therapy for CPTSD typically take?"
   - "What is it like to switch therapists during trauma therapy?"
   - "Did EMDR work for your complex trauma? How long did it take?"
   - "What does 'healed' mean for someone with CPTSD?"
   - "How do people afford long-term trauma therapy?"
3. Copy each response (it synthesizes from real posts with source links)
4. Paste into a text file in `3_results/sources/5-client-narratives/_reddit_raw/`
5. Claude can annotate from there

## Option 3: Manual browsing (most reliable)

1. Open Reddit in a browser (logged in)
2. Search r/CPTSD for these queries (sort by Top, All Time):
   - `how long have you been in therapy`
   - `years of therapy complex trauma`
   - `multiple therapists healing journey`
   - `EMDR didn't work complex trauma`
   - `what does healed mean`
   - `can't afford therapy`
   - `changed therapists`
   - `continued improving after therapy ended`
   - `identity changed through therapy`
3. For each good thread (20+ comments, retrospective, substantive):
   - Copy the URL + title + original post + top 10-15 comments
   - Paste into a .md file in `3_results/sources/5-client-narratives/_reddit_raw/`
4. Claude can annotate from those files

## What we're looking for

Threads where people look back on 5+ years of therapy and reflect on:
- How long it took (duration data)
- Whether they switched therapists or modalities (escalation gap)
- Whether EMDR/brief therapy was sufficient or not (endpoint divergence)
- What "healed" means to them (endpoint definition)
- Whether they continued improving after therapy ended (sleeper effect)
- Whether cost/access was a barrier (access silence)
- Whether their identity changed, not just symptoms (identity dimension)

## Status

- [ ] Reddit app registered
- [ ] PRAW script tested
- [ ] Raw threads downloaded
- [ ] Best 10 selected for annotation
- [ ] Annotated and integrated into Layer 5
