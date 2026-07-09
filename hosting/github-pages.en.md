# Deploy to GitHub Pages

## Prerequisites
- [GitHub](https://github.com) account (free)
- Git installed

## Method — Publish via GitHub

### 1. Create a repository

```bash
# Create a repository on GitHub, e.g.: "my-clients"
# Or use your user repo: username.github.io
```

### 2. Repository structure

```
my-repo/
├── clients/
│   ├── ana-nutri/
│   │   └── index.html
│   └── dr-john/
│       └── index.html
└── comparar.html
```

### 3. Commit and push

```bash
git init
git add .
git commit -m "Add client websites"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/my-clients.git
git push -u origin main
```

### 4. Enable GitHub Pages

1. Go to Settings → Pages
2. Under "Source", select "Deploy from a branch"
3. Branch: `main`, folder: `/ (root)`
4. Save

### 5. Public URL

```
https://YOUR_USERNAME.github.io/my-clients/clients/[slug]/
```

Or, if using `username.github.io`:
```
https://YOUR_USERNAME.github.io/clients/[slug]/
```

## Option 2 — GitHub Actions (automated)

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Pages
on:
  push:
    branches: ["main"]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: .
```

## Configuration in config.json

```json
{
  "hospedagem": {
    "provedor": "github-pages",
    "pastaBase": "clients",
    "credenciais": {
      "usuario": "your-github-username",
      "repo": "my-clients",
      "dominio": "your-username.github.io"
    }
  }
}
```

## Verification

Access the public URL and confirm the page loads correctly.
