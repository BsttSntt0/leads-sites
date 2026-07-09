# 🏗️ Provedores de Hospedagem

Escolha o provedor que melhor atende sua necessidade e siga o guia correspondente.

## Como escolher

| Provedor | Ideal para | Grátis? | Dificuldade |
|----------|------------|---------|-------------|
| **Netlify** | Sites estáticos, deploys rápidos | ✅ | Fácil |
| **Vercel** | Sites estáticos, performance | ✅ | Fácil |
| **Cloudflare Pages** | CDN global, performance | ✅ | Fácil |
| **Railway** | Deploys simples, sem config | ✅ | Fácil |
| **Firebase Hosting** | Ecossistema Google | ✅ | Fácil |
| **Render** | Sites estáticos + backends | ✅ | Fácil |
| **GitHub Pages** | Grátis, integração com Git | ✅ | Fácil |
| **HostGator** | Hospedagem tradicional, cPanel | ❌ | Médio |
| **FTP Genérico** | Qualquer hospedagem com FTP | ❌ | Médio |
| **Custom** | Cenários específicos | Depende | Avançado |

## Configuração no config.json

```json
{
  "hospedagem": {
    "provedor": "netlify",
    "pastaBase": "clientes",
    "credenciais": {}
  }
}
```

## Estrutura de publicação

Para cada cliente, uma pasta separada:
```
clientes/
├── ana-nutri/
│   └── index.html
├── dr-jose/
│   └── index.html
└── teste/
    └── index.html
```

URL pública: `https://seudominio/clientes/[slug]/`

## Como adicionar um provedor

1. Crie um arquivo `hosting/[provedor].md` com:
   - Credenciais necessárias
   - Método de deploy (CLI, API, manual)
   - Verificação da URL
2. Adicione o provedor em `config.json.example`
3. Atualize este README
