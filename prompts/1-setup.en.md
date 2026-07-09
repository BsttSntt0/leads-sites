# Prompt: Initial Setup

## Objective
Set up the Prospector Universal environment — signature, preferences, and hosting connection.

## Instructions for the AI

### 1. Check existing configuration

Read `config.json` in the project root. If it doesn't exist, ask the user to copy `config.json.example` to `config.json` and fill in their data.

### 2. Check data folder

Confirm there's a `sites/` folder in the project. Create it if it doesn't exist.

### 3. Read lead file

Check if `leads.md` exists. If it does, show a summary of current leads.

### 4. Show summary

Display a clear summary of what's configured (without showing passwords or sensitive credentials):

```
📋 Configuration Summary
━━━━━━━━━━━━━━━━━━━━━
Name: John Doe — Digital Presence Specialist
Niches: nutritionists, psychologists
City: São Paulo
Leads per search: 10
Hosting: Netlify
━━━━━━━━━━━━━━━━━━━━━
```

### 5. Ask what the user wants to adjust

Offer these options:
- Change name / presentation
- Add/remove niches
- Change default city
- Change hosting provider
- Configure new hosting provider
- Everything looks good — I want to start prospecting

### 6. Test hosting (if applicable)

If the hosting provider is configured with credentials, suggest a test:
- Publish a simple `test.html` page
- Confirm the public URL works

### 7. Next steps

Explain the complete cycle:
1. **🔍 Prospect** — Search for leads on Google Maps (use prompt `2-prospect.en.md`)
2. **🎨 Redesign** — Redesign lead websites (use prompt `3-redesign.en.md`)
3. **✏️ Editor** — (Optional) Manually adjust pages (use prompt `4-editor.en.md`)
4. **🚀 Publish** — Deploy to hosting (use prompt `5-publish.en.md`)
5. **📧 Proposal** — Send proposal email (use prompt `6-proposal.en.md`)

## Security Notes

- NEVER ask for the hosting password in chat. Instruct the user to fill it directly in `config.json`
- NEVER display passwords or tokens in messages or logs
- If preferred, recommend using environment variables

## Reference Files

- `config.json` — Main configuration
- `CONFIGURATION.en.md` — Detailed configuration guide
- `hosting/` — Guides for each hosting provider
