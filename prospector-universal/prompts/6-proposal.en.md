# Prompt: Email Proposal

## Objective
Write and send a business email to leads with published pages — a presentation email for the new version of the site, with rapport and no pricing.

## Instructions for the AI

### 1. Read the configuration

Read `config.json` to get the user's signature.

### 2. Select recipients

Read `leads.md` and select leads with status `published` that haven't received a proposal yet.

- Only leads with confirmed email
- For leads without email, suggest WhatsApp contact

### 3. Follow the email skill

Follow the instructions in `prompts/skills/email-proposal.md` — it contains all the copywriting rules.

### 4. For each client

Write a personalized email following this structure:

**Subject**: Specific, non-marketing
- E.g.: "A new version of Dr. Ana's website — 4.9★ on Google deserves more"

**Paragraph 1 — Rapport**: Specific praise
- "I found your practice on Google Maps and saw you have 4.9★ with 87 reviews. That's work that clearly delivers results."

**Paragraph 2 — Observation**: Specific flaw in current website
- "I noticed your current website doesn't reflect the level of your work — it's not mobile-responsive and the phone number is hidden in the footer."

**Paragraph 3 — The delivery**: Link to new page
- "I took the liberty of preparing a new version of your site, already live: [link]"
- (Optional) Link to old site for comparison

**Paragraph 4 — CTA**: Light, no pressure
- "If you could open it on your phone and let me know what you think, I'd really appreciate it."

**Signature**: Name, presentation, WhatsApp

### 5. Sending

- **Draft mode** (default): provide the complete email for the user to copy and paste into Gmail. Advise them to attach a screenshot of the page (`sites/[slug]/preview.png`) before sending.
- **Direct mode**: if the AI has sending capability, send directly (with user authorization).

### Lead without email?

If the lead doesn't have a confirmed email, adapt the message for WhatsApp:
- Use the same content, but shorter (80-100 words)
- Send the new page link
- Register in `leads.md` as "proposal via WhatsApp"

### 6. Update records

In `leads.md`, update:
- Status to `proposal sent`
- Date of sending

### 7. Final summary

Show the user:
- How many proposals were created/sent
- To which clients
- Reminder: follow up responses in 3-4 business days
- Suggest a polite follow-up if no response

## Reference Files

- `prompts/skills/email-proposal.md` — Complete email proposal skill
- `config.json` — User's signature
- `leads.md` — Lead data
- `sites/[slug]/[slug].html` — Published page (for screenshot)
