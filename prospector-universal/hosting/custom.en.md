# Custom Hosting

## Add ANY hosting provider

This guide shows how to set up a hosting provider not listed in the existing guides.

## Step by Step

### 1. Identify the available deploy method

| Method | Examples |
|--------|----------|
| **CLI** | Netlify CLI, Vercel CLI, Firebase CLI |
| **FTP/SFTP** | Traditional hosting |
| **REST API** | Cloudflare Pages, DigitalOcean App Platform |
| **Git Push** | GitHub Pages, GitLab Pages |
| **Webhook** | CI/CD integration |
| **Manual Upload** | Provider's control panel |

### 2. Document in config.json

```json
{
  "hospedagem": {
    "provedor": "custom",
    "pastaBase": "clients",
    "credenciais": {
      "metodo": "ftp",
      "servidor": "ftp.yoursite.com",
      "usuario": "",
      "senha": "",
      "porta": 21,
      "pastaRaiz": "public_html",
      "urlBase": "https://yoursite.com"
    }
  }
}
```

### 3. Write your own guide

Create a file `hosting/[your-provider].md` following this template:

```markdown
# Deploy to [Provider Name]

## Prerequisites
- [List of requirements]

## Required credentials
- [List of credentials]

## Deploy method
[Describe the commands or steps]

## Configuration in config.json
[JSON template]

## Verification
[How to verify the deploy worked]
```

## Example Customizable Providers

| Provider | Method | Documentation |
|----------|--------|---------------|
| Cloudflare Pages | CLI/API | api.cloudflare.com |
| Firebase Hosting | CLI/firebase-tools | firebase.google.com |
| Amazon S3 + CloudFront | AWS CLI | aws.amazon.com/s3 |
| DigitalOcean App Platform | API/CLI | digitalocean.com |
| Railway | CLI/Git | railway.app |
| Render | Git/Manual | render.com |
| Heroku | Git/CLI | heroku.com |
| Your own server | FTP/SCP | — |

## Tip

If your provider supports drag-and-drop upload in their dashboard, the simplest method is:

1. Access the control panel
2. Navigate to the desired folder
3. Upload the `index.html`
4. Confirm the URL

This works with virtually any hosting provider.
