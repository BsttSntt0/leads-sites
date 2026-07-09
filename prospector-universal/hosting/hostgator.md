# Deploy na HostGator

## Pré-requisitos
- Plano de hospedagem HostGator (plano M ou superior para múltiplos sites)
- Acesso ao cPanel

## Método 1 — FTP Programático

Credenciais (do cPanel):
- **Usuário**: seu usuário do cPanel
- **Servidor**: ex.: `br123.hostgator.com.br`
- **Senha**: a mesma do cPanel

```bash
# Upload via FTP
curl -sS --ftp-create-dirs -T sites/ana-nutri/ana-nutri.html \
  "ftp://ftp.SEUDOMINIO.com.br/public_html/clientes/ana-nutri/index.html" \
  --user "USUARIO:SENHA"

# Alternativa: usar o servidor diretamente
curl -sS --ftp-create-dirs -T sites/ana-nutri/ana-nutri.html \
  "ftp://SERVIDOR/public_html/clientes/ana-nutri/index.html" \
  --user "USUARIO:SENHA"
```

## Método 2 — cPanel UAPI via HTTPS

```bash
# Upload via cPanel File Manager (UAPI)
curl -sS -u "USUARIO:SENHA" \
  "https://SERVIDOR:2083/execute/Fileman/upload_files" \
  -F "dir=/public_html/clientes/ana-nutri" -F "file-1=@sites/ana-nutri/ana-nutri.html"

# Criar pasta primeiro (se necessário)
curl -sS -u "USUARIO:SENHA" \
  "https://SERVIDOR:2083/execute/Fileman/mkdir?path=public_html/clientes&name=ana-nutri"
```

## Método 3 — Manual (cPanel no navegador)

1. Acesse `https://SERVIDOR:2083` (link do cPanel)
2. Faça login com suas credenciais
3. Abra o **Gerenciador de Arquivos**
4. Navegue para `public_html/clientes/`
5. Crie a pasta `[slug]` se não existir
6. Faça upload do `index.html`

## 🔒 Segurança

⚠️ A senha do cPanel fica em texto no `config.json` no seu computador.
- **Nunca** cole a senha no chat da IA
- **Nunca** exiba a senha em logs ou mensagens
- Ao usar comandos, leia a senha diretamente do arquivo:
  ```bash
  --user "$(python3 -c 'import json;c=json.load(open("config.json"));print(c["hospedagem"]["credenciais"]["usuario"]+":"+c["hospedagem"]["credenciais"]["senha"])')"
  ```

## Configuração no config.json

```json
{
  "hospedagem": {
    "provedor": "hostgator",
    "pastaBase": "clientes",
    "credenciais": {
      "usuario": "",
      "dominio": "meusite.com.br",
      "servidor": "br123.hostgator.com.br",
      "senha": ""
    }
  }
}
```

## Verificação

Acesse:
```
https://[dominio]/[pastaBase]/[slug]/
```

Confirme HTTP 200 e conteúdo correto (título do cliente presente).
