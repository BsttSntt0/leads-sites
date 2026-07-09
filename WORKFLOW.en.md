# Prospector Universal — Workflow

## Overview

```
CONFIG → PROSPECT → REDESIGN → [EDIT] → PUBLISH → PROPOSAL
                          ↑         │
                          └─────────┘  (adjustment loop)
```

Each step generates artifacts that feed into the next. You can skip steps or repeat them.

---

## Step 1: Setup

**File**: `prompts/1-setup.md`

**What it does**: Configures your professional identity, target niches, and hosting provider.

**Input**: Filled `config.json`

**Output**: Validated `config.json` + ready environment

---

## Step 2: Prospecting

**File**: `prompts/2-prospect.md`

**What it does**: Searches Google Maps for businesses with rating ≥ 4.7 and ≥ 40 reviews that have bad websites.

**Input**: `config.json` + `leads.md` (if exists, to avoid duplicates)

**Output**:
- Updated `leads.md` with new leads
- (Optional) Google Sheets spreadsheet

**Qualification criteria**:
- ✅ Rating ≥ 4.7 on Google
- ✅ Minimum 40 reviews
- ✅ Own ACTIVE website (Instagram/Facebook/Linktree/Doctoralia don't count)
- ✅ BAD quality website (not responsive, outdated design, no CTA)
- ✅ Public email found

---

## Step 3: Redesign

**File**: `prompts/3-redesign.md`

**What it does**: Creates premium versions of qualified leads' websites.

**Input**: `leads.md` + URLs of original websites

**Output** (per client):
- `sites/[slug]/[slug].html` — Redesigned page
- `sites/[slug]/[slug]-editor.html` — Version with visual editor
- Updated `comparar.html` at root

**Golden rules**:
- Nothing invented — use the client's REAL logo, photos, and content
- Rewrite text with better copy, but don't change the facts
- Single self-contained file (inline CSS)
- Mobile-first (client opens on phone)

---

## Step 4: Editor (Optional)

**File**: `prompts/4-editor.md`

**What it does**: Generates the editable version of the page for manual adjustments in the browser.

**Input**: `sites/[slug]/[slug].html`

**Output**: `sites/[slug]/[slug]-editor.html`

**How to use the editor**:
1. Open `[slug]-editor.html` in your browser
2. Click any text to edit it
3. Click any image to replace it
4. Click "Export page" to download the final version

---

## Step 5: Publish

**File**: `prompts/5-publish.md`

**What it does**: Uploads redesigned pages to the chosen hosting provider.

**Input**: `sites/[slug]/[slug].html` + hosting credentials

**Output**: Public URL per client (`https://yourdomain.com/clients/[slug]/`)
- `leads.md` — Status updated to "published"

**Supported providers**: Netlify, Vercel, HostGator, GitHub Pages, Cloudflare Pages, Railway, Firebase Hosting, Render, Generic FTP, Custom

---

## Step 6: Proposal

**File**: `prompts/6-proposal.md`

**What it does**: Writes and sends a business email to the lead with a link to the new page.

**Input**: Lead data + published page URL

**Output**:
- Proposal email (draft or sent)
- `leads.md` — Status updated to "proposal sent" + date

**Email structure**:
1. Rapport: specific praise (rating, reviews, real credential)
2. Gentle observation about the current website
3. "I prepared a new version" + link
4. Light CTA: just ask them to open it and share their thoughts
5. **No pricing** — pricing in the first email becomes mental spam

---

## Lead Status Flow

| Status | Meaning | Next Step |
|--------|---------|-----------|
| `new` | Prospected, waiting for redesign | Step 3: Redesign |
| `redesigned` | Page created, not published | Step 5: Publish |
| `published` | Live, waiting for proposal | Step 6: Proposal |
| `proposal sent` | Email sent | Follow up on response |
| `closed` | Client hired | 🎉 |
| `archived` | Not interested | Skip in future rounds |
