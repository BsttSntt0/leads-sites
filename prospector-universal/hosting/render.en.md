# Deploy to Render

## Prerequisites
- [Render](https://render.com/) account (free)
- (Optional) Git installed

## Method 1 — Static Site via Git (recommended)

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

2. Access [dashboard.render.com](https://dashboard.render.com)
3. Click "New +" → "Static Site"
4. Connect your Git repository
5. Configure:
   - **Name**: my-clients
   - **Branch**: main
   - **Build Command**: empty (pure HTML)
   - **Publish Directory**: `.` (repository root)
6. Click "Create Static Site"

URL will be: `https://my-clients.onrender.com/clients/[slug]/`

## Method 2 — Manual Upload

1. Access [dashboard.render.com](https://dashboard.render.com)
2. New + → Static Site → "Upload folder"
3. Drag the client folder or the full repository

## Custom Domain

1. In the Static Site dashboard, go to "Settings" → "Custom Domain"
2. Add your domain
3. Configure the CNAME record in your DNS pointing to `onrender.com`

## Configuration in config.json

```json
{
  "hospedagem": {
    "provedor": "render",
    "pastaBase": "clients",
    "credenciais": {
      "apiKey": "",          # Render API key (optional)
      "serviceId": "",       # Static Site ID (optional)
      "dominio": ""          # Custom domain
    }
  }
}
```

## Advantages

- ✅ **Free**: SSL, global CDN, 100 GB bandwidth/month
- ✅ **Auto-deploy**: push to Git, Render auto-updates
- ✅ **Custom domain** with free SSL

## Verification

Access:
```
https://[service].onrender.com/[baseFolder]/[slug]/
```

Confirm the page loads correctly.
