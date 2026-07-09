# Deploy to Cloudflare Pages

## Prerequisites
- [Cloudflare](https://dash.cloudflare.com/signup) account (free)
- (Optional) [Wrangler CLI](https://developers.cloudflare.com/workers/wrangler/): `npm install -g wrangler`

## Method 1 — Deploy via Wrangler CLI

```bash
# Login (first time)
wrangler login

# Direct deploy from a directory
wrangler pages deploy sites/ana-nutri --project-name=my-clients
```

URL will be: `https://my-clients.pages.dev/clients/[slug]/`

## Method 2 — Deploy via Dashboard (manual)

1. Access [dash.cloudflare.com](https://dash.cloudflare.com) → Pages
2. Click "Create a project" → "Direct Upload"
3. Drag the `sites/[slug]/` folder or upload the file
4. Set the project name
5. Cloudflare generates an automatic URL

## Method 3 — Deploy via Git (recommended for multiple clients)

1. Create a Git repository with this structure:
```
my-repo/
├── clients/
│   ├── ana-nutri/
│   │   └── index.html
│   └── dr-john/
│       └── index.html
└── comparar.html
```

2. Cloudflare Dashboard → Pages → Create a project → Connect to Git
3. Select the repository and configure:
   - **Build command**: empty (no build needed)
   - **Build output directory**: `.` (root)
4. URL: `https://[project].pages.dev/clients/[slug]/`

## Custom Domain

1. In the project dashboard, go to "Custom domains"
2. Add your domain
3. Configure DNS records (Cloudflare manages automatically)

## Configuration in config.json

```json
{
  "hospedagem": {
    "provedor": "cloudflare-pages",
    "pastaBase": "clients",
    "credenciais": {
      "token": "",           # API Token (optional)
      "projectName": "",     # Cloudflare project name
      "accountId": "",       # Account ID (optional)
      "dominio": ""          # Custom domain
    }
  }
}
```

## Advantages

- ✅ **Free**: unlimited traffic, no bandwidth limits
- ✅ **Global network**: CDN in 330+ cities
- ✅ **Automatic SSL**: free HTTPS
- ✅ **Performance**: instant loading

## Verification

Access:
```
https://[project].pages.dev/[baseFolder]/[slug]/
```

Confirm the page loads correctly with HTTP 200.
