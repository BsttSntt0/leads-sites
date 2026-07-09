# Deploy to Railway

## Prerequisites
- [Railway](https://railway.app/) account (free — $5 initial credit, no credit card)
- (Optional) [Railway CLI](https://docs.railway.app/develop/cli): `npm install -g @railway/cli`

## Method 1 — Deploy via Dashboard (recommended)

1. Access [railway.app](https://railway.app)
2. Click "New Project" → "Deploy from repo" or "Blank project"
3. If "Blank project", use the upload deploy option

## Method 2 — Deploy via CLI

```bash
# Login
railway login

# Create a new project
railway init

# Deploy static files
railway up --dir=sites/ana-nutri
```

## Method 3 — Via Nixpacks (for multiple clients)

Create a `nixpacks.toml` at root:

```toml
[phases.setup]
nixPkgs = ["python3"]

[phases.build]
cmds = ["echo 'Static site - no build required'"]

[start]
cmd = "cd sites && python3 -m http.server 8080"
```

And deploy the full repository to Railway.

## Configuration in config.json

```json
{
  "hospedagem": {
    "provedor": "railway",
    "pastaBase": "clients",
    "credenciais": {
      "token": "",           # Railway token (optional)
      "projectId": ""        # Project ID (optional)
    }
  }
}
```

## Advantages

- ✅ **Simplicity**: one-click deploy
- ✅ **Free credit**: $5/month (enough for static sites)
- ✅ **Automatic SSL**
- ✅ **Custom domains**

## Verification

After deploy, Railway provides a URL: `https://[project].up.railway.app/`.

Access and confirm the page loads correctly.
