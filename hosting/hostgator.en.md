# Deploy to HostGator

## Prerequisites
- HostGator hosting plan (Plan M or higher for multiple sites)
- cPanel access

## Method 1 — Programmatic FTP

Credentials (from cPanel):
- **User**: your cPanel username
- **Server**: e.g., `br123.hostgator.com.br`
- **Password**: same as cPanel

```bash
# Upload via FTP
curl -sS --ftp-create-dirs -T sites/ana-nutri/ana-nutri.html \
  "ftp://ftp.YOURDOMAIN.com/public_html/clients/ana-nutri/index.html" \
  --user "USER:PASSWORD"

# Alternative: use the server directly
curl -sS --ftp-create-dirs -T sites/ana-nutri/ana-nutri.html \
  "ftp://SERVER/public_html/clients/ana-nutri/index.html" \
  --user "USER:PASSWORD"
```

## Method 2 — cPanel UAPI via HTTPS

```bash
# Upload via cPanel File Manager (UAPI)
curl -sS -u "USER:PASSWORD" \
  "https://SERVER:2083/execute/Fileman/upload_files" \
  -F "dir=/public_html/clients/ana-nutri" -F "file-1=@sites/ana-nutri/ana-nutri.html"

# Create folder first (if needed)
curl -sS -u "USER:PASSWORD" \
  "https://SERVER:2083/execute/Fileman/mkdir?path=public_html/clients&name=ana-nutri"
```

## Method 3 — Manual (cPanel in browser)

1. Access `https://SERVER:2083` (cPanel link)
2. Log in with your credentials
3. Open the **File Manager**
4. Navigate to `public_html/clients/`
5. Create folder `[slug]` if it doesn't exist
6. Upload the `index.html`

## 🔒 Security

⚠️ Your cPanel password is stored in plain text in `config.json` on your computer.
- **Never** paste the password in the AI chat
- **Never** display the password in logs or messages
- When using commands, read the password directly from the file:
  ```bash
  --user "$(python3 -c 'import json;c=json.load(open("config.json"));print(c["hospedagem"]["credenciais"]["usuario"]+":"+c["hospedagem"]["credenciais"]["senha"])')"
  ```

## Configuration in config.json

```json
{
  "hospedagem": {
    "provedor": "hostgator",
    "pastaBase": "clients",
    "credenciais": {
      "usuario": "",
      "dominio": "mysite.com",
      "servidor": "br123.hostgator.com.br",
      "senha": ""
    }
  }
}
```

## Verification

Access:
```
https://[domain]/[baseFolder]/[slug]/
```

Confirm HTTP 200 and correct content (client's title present).
