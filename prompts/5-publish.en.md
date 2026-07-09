# Prompt: Deploy to Hosting

## Objective
Deploy redesigned pages to the user's chosen hosting provider and return the public URLs.

## Instructions for the AI

### 1. Read the configuration

Read `config.json` to identify the hosting provider and credentials.

**⚠️ Security**: If there's a password in config, read it directly from the file within commands — never display it in chat.

### 2. Determine what to publish

- If the user specified a client or "all", use that
- If not, list the leads with status `redesigned` in `leads.md` and ask

### 3. Consult the provider guide

Open the corresponding guide in `hosting/[provider].md` and follow the instructions.

### 4. Publish the pages

For each page:
1. Upload `sites/[slug]/[slug].html` to the appropriate destination
2. The public URL will be: `https://[domain]/[baseFolder]/[slug]/`
3. Verify the page loads correctly (HTTP 200)

### 5. Update records

- In `leads.md`, change status to `published` and add the public URL
- Save the URL in the appropriate column

### 6. Present results

List each client's public URLs.
Suggest the next step: send proposal (prompt `6-proposal.en.md`).

## Manual Publishing

If the AI cannot upload directly (due to security restrictions), provide the user with clear instructions:

```
📋 Manual Publishing Instructions

Client: Dr. Ana Nutri
File: sites/ana-nutri/ana-nutri.html
Destination: /clients/ana-nutri/index.html
URL: https://mysite.com/clients/ana-nutri/

How to publish:
1. Access your [Netlify/HostGator/Vercel/...] dashboard
2. Upload the file to the correct folder
3. Confirm the URL works
```

## Reference Files

- `config.json` — Configuration with hosting data
- `hosting/[provider].md` — Specific guide for the chosen provider
- `leads.md` — Lead list (update status)
- `sites/[slug]/[slug].html` — Page to publish
