# Skill: Modular Deploy

## Description
Use this skill when publishing pages to the chosen hosting — upload, folder creation per client, and public URL verification.

## Universal Flow

1. **Identify the provider** in `config.json` → `hospedagem.provedor`
2. **Consult the specific guide** in `hosting/[provider].md`
3. **Prepare the files**: `sites/[slug]/[slug].html`
4. **Publish**: follow the recommended method for the provider
5. **Verify**: confirm HTTP 200 + correct content at the public URL
6. **Record**: update `leads.md` with status `published` + URL

## Destination Structure

Each client in their own folder:
```
/[baseFolder]/[slug]/index.html
```

Example:
```
/clients/ana-nutri/index.html
https://mysite.com/clients/ana-nutri/
```

## Publishing Methods

### Via CLI (recommended for providers with CLI)
```bash
# Netlify example
netlify deploy --dir=sites/ana-nutri --prod
```

### Via Manual Upload
If the AI cannot execute commands, provide clear instructions:
1. Access the provider's dashboard
2. Navigate to the correct directory
3. Upload the file
4. Verify the URL

### Via API
If the provider has an API, use curl or SDK:
```bash
curl -X POST -H "Authorization: Bearer $TOKEN" \
  -F "file=@sites/ana-nutri/ana-nutri.html" \
  https://api.provider.com/deploy
```

## Verification

After publishing:
1. Access `https://[domain]/[baseFolder]/[slug]/`
2. Confirm HTTP 200
3. Verify the client's title appears
4. If 404, check: path, permissions (644 for files, 755 for folders)

## Organization

- 1 folder per client, slug in kebab-case without accents
- Never overwrite another client's folder
- Test page: `/[baseFolder]/test/index.html`
