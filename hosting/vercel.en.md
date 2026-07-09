# Deploy to Vercel

## Prerequisites
- [Vercel](https://vercel.com/signup) account (free)
- (Optional) Vercel CLI: `npm install -g vercel`

## Method 1 — Deploy via CLI

```bash
# Login (first time)
vercel login

# Deploy a client site
vercel deploy sites/ana-nutri --prod

# Or deploy with specific folder
cd sites/ana-nutri && vercel --prod
```

URL will be: `https://[project-name].vercel.app/`

## Method 2 — Manual deploy

1. Access [vercel.com](https://vercel.com)
2. Click "Add New → Project"
3. Import the repository or manual upload
4. Set root directory as `sites/[slug]/`

## Method 3 — Multi-client structure

To serve multiple clients in the same project, create a `vercel.json` at project root:

```json
{
  "rewrites": [
    { "source": "/clients/:slug", "destination": "/sites/:slug/:slug.html" },
    { "source": "/clients/:slug/*", "destination": "/sites/:slug/:slug.html" }
  ]
}
```

## Configuration in config.json

```json
{
  "hospedagem": {
    "provedor": "vercel",
    "pastaBase": "clients",
    "credenciais": {
      "token": "",       # Vercel token (optional)
      "projectId": "",   # Project ID (optional)
      "dominio": ""      # Your custom domain
    }
  }
}
```

## Verification

Access:
```
https://[project].vercel.app/[baseFolder]/[slug]/
```

Confirm the page loads correctly.
