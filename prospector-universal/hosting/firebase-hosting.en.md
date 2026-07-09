# Deploy to Firebase Hosting

## Prerequisites
- [Firebase](https://console.firebase.google.com/) account (free)
- Firebase CLI: `npm install -g firebase-tools`

## Method 1 — Deploy via CLI

```bash
# 1. Login
firebase login

# 2. Initialize Firebase Hosting in the project
firebase init hosting

# During setup:
# ? What do you want to use as your public directory? → sites
# ? Configure as a single-page app? → No
# ? Set up automatic builds and deploys with GitHub? → No

# 3. Expected structure:
# firebase.json should contain:
# {
#   "hosting": {
#     "public": "sites",
#     "ignore": ["firebase.json", "**/.*"],
#     "rewrites": []
#   }
# }

# 4. Deploy
firebase deploy --only hosting
```

URL will be: `https://[project].web.app/clients/[slug]/`

## Method 2 — Deploy a single client

```bash
# Create a firebase.json pointing to the client folder
cat > firebase.json << EOF
{
  "hosting": {
    "public": "sites/ana-nutri",
    "ignore": ["firebase.json"]
  }
}
EOF

firebase deploy --only hosting
```

## Method 3 — Multiple sites in the same project (Firebase Multi-Site)

Firebase allows multiple sites in the same project:

1. Firebase Console → Hosting → Add another site
2. Configure `firebase.json`:

```json
{
  "hosting": [
    {
      "target": "ana-nutri",
      "public": "sites/ana-nutri",
      "ignore": ["firebase.json"]
    },
    {
      "target": "dr-john",
      "public": "sites/dr-john",
      "ignore": ["firebase.json"]
    }
  ]
}
```

3. Update targets:
```bash
firebase target:apply hosting ana-nutri clients-ana-nutri
firebase target:apply hosting dr-john clients-dr-john
```

4. URLs: `https://clients-ana-nutri.web.app/` and `https://clients-dr-john.web.app/`

## Configuration in config.json

```json
{
  "hospedagem": {
    "provedor": "firebase-hosting",
    "pastaBase": "clients",
    "credenciais": {
      "projectId": "",       # Firebase project ID
      "token": ""            # Firebase token (optional)
    }
  }
}
```

## Verification

Access:
```
https://[project].web.app/[baseFolder]/[slug]/
```

Confirm the page loads correctly.

## Notes

- Firebase Hosting offers 10 GB storage and 360 MB transfer/month on the free plan
- Free automatic SSL
- Custom domain support
