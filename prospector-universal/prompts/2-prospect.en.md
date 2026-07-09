# Prompt: Google Maps Prospecting

## Objective
Find highly-rated businesses (≥ 4.7) with bad websites on Google Maps and generate a qualified lead list.

## Context for the AI

The user wants you to help prospect potential clients. You need to:
1. Guide them through Google Maps navigation
2. Help evaluate establishments
3. Collect data from qualified leads
4. Generate the lead list

## Instructions

### 1. Read the configuration

Read `config.json` to get:
- Niches and default city
- Number of leads per search
- Minimum rating and minimum reviews

Determine niche and city: use what the user requests, or the defaults from config.

### 2. Read existing leads

Read `leads.md` (if exists) to know which professionals have already been evaluated. These must be EXCLUDED from the new search.

### 3. Execute Google Maps prospecting

Follow the detailed instructions from the `prospect-maps` skill (see the full content below in the "Skill: Google Maps Prospecting" section).

### Summary of the workflow:

1. Search `[niche] in [city]` on Google Maps
2. Evaluate establishments in order
3. Apply the 3 elimination filters (own website, bad website, public email)
4. Collect data from qualified leads
5. Repeat until reaching the target or exhausting 25 establishments

### 4. Generate output

Create/update `leads.md` with ALL evaluated leads (qualified AND discarded), in this format:

```markdown
# Leads - Nutritionists in São Paulo
## Search date: 07/10/2026

### Qualified

| # | Name | Rating | Reviews | Email | Phone | Website | Reason | Status |
|---|------|--------|---------|-------|-------|---------|--------|--------|
| 1 | Dr. Ana Nutri | 4.9 | 87 | ana@email.com | 11 99999-9999 | example.com.br | Not responsive + no CTA | new |

### Discarded

| # | Name | Rating | Reviews | Discard reason |
|---|------|--------|---------|----------------|
| 1 | Clinic X | 4.8 | 120 | Website is already good |
| 2 | Dr. John | 4.7 | 55 | No own website (Instagram only) |
```

### 5. (Optional) Spreadsheet

If the user wants, help create a Google Sheets spreadsheet with the same data. Provide the CSV and import instructions.

### 6. Next steps

Suggest to the user:
- How many leads were found
- Which are the best candidates for redesign
- **Next step**: **🎨 Redesign** — use prompt `3-redesign.en.md` to create premium pages

## Reference Files

- `prompts/skills/prospect-maps.md` — Detailed prospecting skill
- `config.json` — Configuration with niches and city
- `leads.md` — Lead list (create or update)
