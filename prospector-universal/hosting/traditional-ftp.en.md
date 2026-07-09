# Deploy via Generic FTP

## Prerequisites
- Hosting with FTP access
- FTP credentials (server, user, password, port)

## Method — Upload via curl

```bash
# Upload file with folder creation
curl -sS --ftp-create-dirs -T sites/ana-nutri/ana-nutri.html \
  "ftp://ftp.YOURDOMAIN.com/public_html/clients/ana-nutri/index.html" \
  --user "USER:PASSWORD"
```

## Parameters

- `ftp://ftp.YOURDOMAIN.com` — FTP server
- `/public_html/clients/[slug]/index.html` — server path
- `--ftp-create-dirs` — auto-create folders
- `--user "USER:PASSWORD"` — credentials

## 🔒 Security

Never display the password in chat. Read it directly from the file:
```bash
--user "$(python3 -c 'import json;c=json.load(open("config.json"));u=c["hospedagem"]["credenciais"]["usuario"];s=c["hospedagem"]["credenciais"]["senha"];print(u+":"+s)')"
```

## Configuration in config.json

```json
{
  "hospedagem": {
    "provedor": "ftp",
    "pastaBase": "clients",
    "credenciais": {
      "servidor": "ftp.yoursite.com",
      "usuario": "",
      "senha": "",
      "porta": 21,
      "pastaRaiz": "public_html"
    }
  }
}
```

## Verification

Access `https://[domain]/[baseFolder]/[slug]/` and confirm the page loads.
