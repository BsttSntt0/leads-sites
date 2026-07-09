# Deploy na Netlify

## Pré-requisitos
- Conta na [Netlify](https://app.netlify.com/signup) (gratuita)
- (Opcional) CLI da Netlify: `npm install -g netlify-cli`

## Método 1 — Deploy via CLI (recomendado)

```bash
# Login (primeira vez)
netlify login

# Publicar um site de cliente
netlify deploy --dir=sites/ana-nutri --prod

# Ou publicar manualmente arrastando a pasta
```

A URL será: `https://[app-name].netlify.app/clientes/[slug]/`

**Para usar seu próprio domínio:**
1. Vá em Site settings → Domain management
2. Adicione seu domínio personalizado
3. Configure os registros DNS

## Método 2 — Deploy manual (sem CLI)

1. Acesse [app.netlify.com](https://app.netlify.com)
2. Arraste a pasta `sites/[slug]/` para a área de deploy
3. A Netlify gera uma URL automática
4. Para criar a estrutura de pastas, use o Netlify Drop ou configure um repositório Git

## Método 3 — Deploy via API

```bash
curl -H "Authorization: Bearer SEU_TOKEN" \
  -F "file=@sites/ana-nutri/ana-nutri.html" \
  https://api.netlify.com/api/v1/sites/SEU_SITE_ID/deploys
```

## Configuração no config.json

```json
{
  "hospedagem": {
    "provedor": "netlify",
    "pastaBase": "clientes",
    "credenciais": {
      "token": "",       # Personal access token (opcional)
      "siteId": "",      # Site ID (opcional)
      "dominio": ""      # Seu domínio personalizado
    }
  }
}
```

## Verificação

Após o deploy, acesse:
```
https://[app-name].netlify.app/clientes/[slug]/
```

Confirme:
- HTTP 200
- Página carrega corretamente
- Links e imagens funcionam
