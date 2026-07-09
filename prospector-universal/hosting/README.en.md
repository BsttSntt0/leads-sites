# 🏗️ Hosting Providers

Choose the provider that best fits your needs and follow the corresponding guide.

## How to Choose

| Provider | Ideal for | Free? | Difficulty |
|----------|-----------|-------|------------|
| **Netlify** | Static sites, quick deploys | ✅ | Easy |
| **Vercel** | Static sites, performance | ✅ | Easy |
| **Cloudflare Pages** | CDN, global performance | ✅ | Easy |
| **Railway** | Simple deploys, no config | ✅ | Easy |
| **Firebase Hosting** | Google ecosystem | ✅ | Easy |
| **Render** | Static sites + backends | ✅ | Easy |
| **GitHub Pages** | Free, Git integration | ✅ | Easy |
| **HostGator** | Traditional hosting, cPanel | ❌ | Medium |
| **FTP Generic** | Any FTP hosting | ❌ | Medium |
| **Custom** | Specific scenarios | Depends | Advanced |

## Configuration in config.json

```json
{
  "hospedagem": {
    "provedor": "netlify",
    "pastaBase": "clients",
    "credenciais": {}
  }
}
```

## Publication Structure

One folder per client:
```
clients/
├── ana-nutri/
│   └── index.html
├── dr-john/
│   └── index.html
└── test/
    └── index.html
```

Public URL: `https://yourdomain.com/clients/[slug]/`

## How to Add a Provider

1. Create a file `hosting/[provider].md` with:
   - Required credentials
   - Deploy method (CLI, API, manual)
   - URL verification
2. Add the provider to `config.json.example`
3. Update this README
