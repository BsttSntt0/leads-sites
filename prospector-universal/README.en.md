# 🔍 Prospector Universal

**Semi-automated client prospecting system — compatible with ANY AI (ChatGPT, Claude, Gemini, Copilot, etc.)**

Find highly-rated businesses with bad websites on Google Maps, redesign their pages with premium aesthetics, publish on the hosting provider of your choice, and send irresistible business proposals.

---

## 🎯 The Complete Cycle

```
1. CONFIG → 2. PROSPECT → 3. REDESIGN → 4. EDIT → 5. PUBLISH → 6. PROPOSAL
```

| Step | What happens |
|------|-------------|
| **① Config** | Set your signature, target niches, default city, and hosting credentials |
| **② Prospect** | Search Google Maps for businesses with rating ≥ 4.7 and bad websites, generate lead list |
| **③ Redesign** | Create premium versions of sites, keeping real logos, photos, and content |
| **④ Editor** | Generate browser-editable version for fine-tuning |
| **⑤ Publish** | Upload to the hosting provider of your choice (Netlify, HostGator, Vercel, FTP, etc.) |
| **⑥ Proposal** | Write and send a business email (no pricing) with the link to the new page |

---

## 🧠 How to Use with ANY AI

This project is structured to work with **any AI assistant**, without depending on a specific platform:

### Approach 1 — Copy & Paste Prompts

1. Open your preferred AI assistant (ChatGPT, Claude, Gemini, etc.)
2. For each step, copy the corresponding prompt from `prompts/`
3. Follow the instructions the AI generates

### Approach 2 — Full Project (recommended)

1. Download/clone this repository
2. Fill in your data in `config.json` (use `config.json.example` as template)
3. Share the folder with your AI assistant (if the platform allows file uploads)
4. Start with the setup prompt: *"Run the Prospector Universal setup step"*

### Approach 3 — Custom Assistant (advanced)

- **ChatGPT**: Create a custom GPT using `prompts/prompt-system.md` as the base instructions
- **Claude Projects**: Create a Project with this repository as context
- **Gemini Gems**: Create a custom Gem with the instructions
- **Copilot**: Use this repository as development context

---

## 📁 Project Structure

```
prospector-universal/
├── README.md                    ← You are here
├── CONFIGURATION.md             ← Detailed setup guide
├── WORKFLOW.md                  ← Complete workflow overview
├── config.json.example          ← Configuration template
├── prompts/
│   ├── 1-setup.md               ← Prompt: initial setup
│   ├── 2-prospect.md            ← Prompt: Google Maps prospecting
│   ├── 3-redesign.md            ← Prompt: website redesign
│   ├── 4-editor.md              ← Prompt: visual editor generation
│   ├── 5-publish.md             ← Prompt: hosting deployment
│   ├── 6-proposal.md            ← Prompt: email proposal
│   └── skills/
│       ├── prospect-maps.md     ← Skill: Google Maps prospecting
│       ├── redesign-premium.md  ← Skill: premium redesign
│       ├── deploy-modular.md    ← Skill: multi-provider deploy
│       └── email-proposal.md    ← Skill: email proposal
├── templates/
│   ├── editor-visual.html       ← Visual editor script (inject into pages)
│   ├── comparador-template.html ← Before/after comparison template
│   └── redesign/
│       └── page-structure.md    ← Recommended page structure
├── hosting/
│   ├── README.md                ← How to add providers
│   ├── netlify.md               ← Netlify deploy
│   ├── vercel.md                ← Vercel deploy
│   ├── hostgator.md             ← HostGator deploy
│   ├── traditional-ftp.md       ← Generic FTP deploy
│   ├── github-pages.md          ← GitHub Pages deploy
│   ├── railway.md               ← Railway deploy
│   ├── cloudflare-pages.md      ← Cloudflare Pages deploy
│   ├── firebase-hosting.md      ← Firebase Hosting deploy
│   ├── render.md                ← Render deploy
│   └── custom.md                ← Add your own provider
├── scripts/
│   ├── setup-config.sh          ← Interactive config creator
│   └── deploy.sh                ← Deploy helper script
├── docs/
│   └── lead-ranking.md          ← Lead scoring system
└── .gitignore
```

---

## 🚀 Quick Start

### 1. Configuration

```bash
cp config.json.example config.json
# Edit config.json with your data
```

Or use the interactive script:
```bash
bash scripts/setup-config.sh
```

### 2. Choose your workflow

Open `prompts/1-setup.md` and paste into your preferred AI assistant. Follow the instructions.

### 3. Track your leads

Leads are saved in `leads.md` (markdown format). You can export them to Google Sheets or any spreadsheet.

---

## 🔌 Supported Hosting Providers

| Provider | Type | Free Tier? | Documentation |
|----------|------|-----------|--------------|
| **Netlify** | Serverless | ✅ (generous free plan) | `hosting/netlify.md` |
| **Vercel** | Serverless | ✅ (generous free plan) | `hosting/vercel.md` |
| **Cloudflare Pages** | CDN + Serverless | ✅ (unlimited traffic) | `hosting/cloudflare-pages.md` |
| **Railway** | Platform | ✅ ($5 credit, no CC) | `hosting/railway.md` |
| **Firebase Hosting** | Serverless | ✅ (10 GB storage) | `hosting/firebase-hosting.md` |
| **Render** | Static Sites | ✅ (100 GB bandwidth) | `hosting/render.md` |
| **GitHub Pages** | Static | ✅ (free) | `hosting/github-pages.md` |
| **HostGator** | Traditional | ❌ (paid) | `hosting/hostgator.md` |
| **FTP Generic** | Traditional | ❌ (paid) | `hosting/traditional-ftp.md` |
| **Custom** | Any | Depends | `hosting/custom.md` |

Want a different provider? Follow the guide in `hosting/custom.md` to add any hosting service.

---

## 📊 Where Data Lives

```
prospector-universal/
├── config.json         ← Configuration (signature, preferences, credentials)
├── leads.md            ← Lead pipeline (status: new → redesigned → published → proposal sent)
├── sites/
│   └── [slug]/         ← Each client's redesigned page
│       ├── [slug].html           ← Final page
│       ├── [slug]-editor.html    ← Browser-editable version
│       └── preview.png           ← Page screenshot
└── comparar.html       ← Before/after comparer (updated with each redesign)
```

---

## 📋 Prerequisites

- Chrome/Chromium browser (for Google Maps prospecting)
- Access to an AI assistant (ChatGPT, Claude, Gemini, etc.)
- Account on your chosen hosting provider
- (Optional) Gmail account for sending proposals via email

---

## 📝 License

MIT — Use, modify, and distribute freely.
