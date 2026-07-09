# Deploy no Cloudflare Pages

## Pré-requisitos
- Conta na [Cloudflare](https://dash.cloudflare.com/signup) (gratuita)
- (Opcional) [Wrangler CLI](https://developers.cloudflare.com/workers/wrangler/): `npm install -g wrangler`

## Método 1 — Deploy via Wrangler CLI

```bash
# Login (primeira vez)
wrangler login

# Deploy direto de um diretório
wrangler pages deploy sites/ana-nutri --project-name=meus-clientes
```

A URL será: `https://meus-clientes.pages.dev/clientes/[slug]/`

## Método 2 — Deploy via Dashboard (manual)

1. Acesse [dash.cloudflare.com](https://dash.cloudflare.com) → Pages
2. Clique em "Create a project" → "Direct Upload"
3. Arraste a pasta `sites/[slug]/` ou faça upload do arquivo
4. Defina o nome do projeto
5. A Cloudflare gera uma URL automática

## Método 3 — Deploy via Git (recomendado para múltiplos clientes)

1. Crie um repositório Git com a estrutura:
```
meu-repo/
├── clientes/
│   ├── ana-nutri/
│   │   └── index.html
│   └── dr-jose/
│       └── index.html
└── comparar.html
```

2. No Cloudflare Dashboard → Pages → Create a project → Connect to Git
3. Selecione o repositório e configure:
   - **Build command**: vazio (não precisa de build)
   - **Build output directory**: `.` (raiz)
4. URL: `https://[projeto].pages.dev/clientes/[slug]/`

## Domínio Personalizado

1. No dashboard do projeto, vá em "Custom domains"
2. Adicione seu domínio
3. Configure os registros DNS (a Cloudflare gerencia automaticamente)

## Configuração no config.json

```json
{
  "hospedagem": {
    "provedor": "cloudflare-pages",
    "pastaBase": "clientes",
    "credenciais": {
      "token": "",           # API Token (opcional)
      "projectName": "",     # Nome do projeto no Cloudflare
      "accountId": "",       # Account ID (opcional)
      "dominio": ""          # Domínio personalizado
    }
  }
}
```

## Vantagens

- ✅ **Grátis**: tráfego ilimitado, sem limite de banda
- ✅ **Rede global**: CDN em 330+ cidades
- ✅ **SSL automático**: HTTPS grátis
- ✅ **Performance**: carregamento instantâneo

## Verificação

Acesse:
```
https://[project].pages.dev/[pastaBase]/[slug]/
```

Confirme que a página carrega corretamente com HTTP 200.
