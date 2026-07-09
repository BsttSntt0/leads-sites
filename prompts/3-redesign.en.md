# Prompt: Website Redesign

## Objective
Create premium versions of qualified leads' websites, maintaining real visual identity, logo, photos, and content.

## Instructions for the AI

### 1. Select clients

Read `leads.md` and select leads with status `new`. Minimum of **5 clients per batch** (if there are fewer, use all and let the user know).

Confirm the list with the user before starting.

### 2. For each client

Follow the `redesign-premium` skill — it is mandatory and contains all the rules.

**Step by step:**

1. **Extract content from the original website**
   - Ask the user to open the original website in a new browser tab
   - Extract texts, services, credentials, address, contacts (ask the user to copy the content)
   - To collect the REAL URLs of logo and photos: ask the user to open the JavaScript Console (F12 → Console) and run:
     ```js
     document.querySelectorAll('img').forEach(i => console.log(i.currentSrc))
     ```
   - Instruct the user to scroll the entire page first (to bypass lazy-load)
   - Ask for a screenshot of the original site for visual reference

2. **Create the redesign**
   - Follow the page structure in `templates/redesign/page-structure.md`
   - Maintain ORIGINAL logo, photos, and color palette
   - Rewrite texts with better copy (without inventing facts)
   - Create a professional, responsive, high-conversion page
   - **Single file**: inline CSS in `<head>`, valid HTML5

3. **Save the files**
   - `sites/[slug]/[slug].html` — Final page (slug in kebab-case, e.g.: `jessica-nutri`)
   - `sites/[slug]/[slug]-editor.html` — Page with injected visual editor (use `templates/editor-visual.html`)

4. **Update the comparer**
   - Read existing `comparar.html` (if any)
   - Add the new client to the `CLIENTES` array in the template `templates/comparador-template.html`
   - Save as `comparar.html` at project root

5. **Update the lead**
   - In `leads.md`, change status to `redesigned`

### 3. Quality checklist

Before presenting to the user, confirm:
- [ ] Zero placeholder text or lorem ipsum
- [ ] All CTAs point to the client's REAL contact
- [ ] WhatsApp in correct format: `wa.me/55DDDNUMBER`
- [ ] Responsive at 375px and 1440px
- [ ] ORIGINAL logo and photos present
- [ ] Title and meta description filled
- [ ] `[slug]-editor.html` generated for each client
- [ ] `comparar.html` updated with all clients

### 4. Present results

Show the user:
- List of redesigned clients (1 line each, highlighting what improved)
- Paths of created files
- Suggest: open `comparar.html` to see before/after
- Suggest: **Step 5: Publish** (prompt `5-publish.en.md`)

## Reference Files

- `prompts/skills/redesign-premium.md` — Complete redesign skill
- `templates/redesign/page-structure.md` — Recommended page structure
- `templates/editor-visual.html` — Visual editor script for injection
- `templates/comparador-template.html` — Before/after comparer template
- `leads.md` — Lead list (update status)
