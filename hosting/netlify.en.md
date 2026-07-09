# Deploy to Netlify

## Prerequisites
- [Netlify](https://app.netlify.com/signup) account (free)
- (Optional) Netlify CLI: `npm install -g netlify-cli`

## Method 1 — Deploy via CLI (recommended)

```bash
# Login (first time)
netlify login

# Deploy a client site
netlify deploy --dir=sites/ana-nutri --prod

# Or manually drag and drop the folder
```

URL will be: `https://[app-name].netlify.app/clients/[slug]/`

**To use your own domain:**
1. Go to Site settings → Domain management
2. Add your custom domain
3. Configure DNS records

## Method 2 — Manual deploy (no CLI)

1. Access [app.netlify.com](https://app.netlify.com)
2. Drag the `sites/[slug]/` folder to the deploy area
3. Netlify generates an automatic URL
4. To create folder structure, use Netlify Drop or set up a Git repository

## Method 3 — Deploy via API

```bash
curl -H "Authorization: Bearer YOUR_TOKEN" \
  -F "file=@sites/ana-nutri/ana-nutri.html" \
  https://api.netlify.com/api/v1/sites/YOUR_SITE_ID/deploys
```

## Configuration in config.json

```json
{
  "hospedagem": {
    "provedor": "netlify",
    "pastaBase": "clients",
    "credenciais": {
      "token": "",       # Personal access token (optional)
      "siteId": "",      # Site ID (optional)
      "dominio": ""      # Your custom domain
    }
  }
}
```

## Verification

After deploy, access:
```
https://[app-name].netlify.app/clients/[slug]/
```

Confirm:
- HTTP 200
- Page loads correctly
- Links and images work
