# Deploy na Vercel

## Pré-requisitos
- Conta na [Vercel](https://vercel.com/signup) (gratuita)
- (Opcional) CLI da Vercel: `npm install -g vercel`

## Método 1 — Deploy via CLI

```bash
# Login (primeira vez)
vercel login

# Deploy de um site de cliente
vercel deploy sites/ana-nutri --prod

# Ou deploy com pasta específica
cd sites/ana-nutri && vercel --prod
```

A URL será: `https://[project-name].vercel.app/`

## Método 2 — Deploy manual

1. Acesse [vercel.com](https://vercel.com)
2. Clique em "Add New → Project"
3. Importe o repositório ou faça upload manual
4. Configure o diretório raiz como `sites/[slug]/`

## Método 3 — Estrutura com múltiplos clientes

Para servir múltiplos clientes no mesmo projeto, crie um `vercel.json` na raiz do projeto:

```json
{
  "rewrites": [
    { "source": "/clientes/:slug", "destination": "/sites/:slug/:slug.html" },
    { "source": "/clientes/:slug/*", "destination": "/sites/:slug/:slug.html" }
  ]
}
```

## Configuração no config.json

```json
{
  "hospedagem": {
    "provedor": "vercel",
    "pastaBase": "clientes",
    "credenciais": {
      "token": "",       # Vercel token (opcional)
      "projectId": "",   # Project ID (opcional)
      "dominio": ""      # Seu domínio personalizado
    }
  }
}
```

## Verificação

Acesse:
```
https://[project].vercel.app/[pastaBase]/[slug]/
```

Confirme que a página carrega corretamente.
