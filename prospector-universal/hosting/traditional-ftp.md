# Deploy via FTP Genérico

## Pré-requisitos
- Hospedagem com acesso FTP
- Credenciais FTP (servidor, usuário, senha, porta)

## Método — Upload via curl

```bash
# Upload do arquivo com criação de pastas
curl -sS --ftp-create-dirs -T sites/ana-nutri/ana-nutri.html \
  "ftp://ftp.SEUDOMINIO.com/public_html/clientes/ana-nutri/index.html" \
  --user "USUARIO:SENHA"
```

## Parâmetros

- `ftp://ftp.SEUDOMINIO.com` — servidor FTP
- `/public_html/clientes/[slug]/index.html` — caminho no servidor
- `--ftp-create-dirs` — cria pastas automaticamente
- `--user "USUARIO:SENHA"` — credenciais

## 🔒 Segurança

Nunca exiba a senha no chat. Leia-a diretamente do arquivo:
```bash
--user "$(python3 -c 'import json;c=json.load(open("config.json"));u=c["hospedagem"]["credenciais"]["usuario"];s=c["hospedagem"]["credenciais"]["senha"];print(u+":"+s)')"
```

## Configuração no config.json

```json
{
  "hospedagem": {
    "provedor": "ftp",
    "pastaBase": "clientes",
    "credenciais": {
      "servidor": "ftp.seusite.com",
      "usuario": "",
      "senha": "",
      "porta": 21,
      "pastaRaiz": "public_html"
    }
  }
}
```

## Verificação

Acesse `https://[dominio]/[pastaBase]/[slug]/` e confirme que a página carrega.
