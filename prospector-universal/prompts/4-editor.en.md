# Prompt: Visual Editor

## Objective
Generate or regenerate the editable version of a redesigned page — allows editing text and images directly in the browser.

## Instructions for the AI

### 1. Identify the client

- If the user specified a name, use it
- If not, list the folders in `sites/` and ask which page to edit

### 2. Read the original page

Read `sites/[slug]/[slug].html`

### 3. Inject the visual editor

Create (or regenerate) `sites/[slug]/[slug]-editor.html`:

1. Copy ALL the content from `sites/[slug]/[slug].html`
2. Before `</body>`, inject the block from `templates/editor-visual.html`
3. Save as `sites/[slug]/[slug]-editor.html`

**Important**: Don't change anything else in the page — just inject the editor block.

### 4. Present to the user

Explain in 3 lines how to use:
1. Open `[slug]-editor.html` in your browser
2. Click any text to edit it directly on the page
3. Click any image to replace it with a file from your computer
4. The "Export page" button downloads the clean HTML (without the editor)

### 5. If the user edits and exports

If the user says they finished editing and provides the exported HTML:
1. Replace `sites/[slug]/[slug].html` with the exported content
2. Also update `sites/[slug]/[slug]-editor.html` with new content + editor
3. Inform that the page is ready to publish

## Reference Files

- `templates/editor-visual.html` — Visual editor script
- `sites/[slug]/[slug].html` — Original page to be edited
