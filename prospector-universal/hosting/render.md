# Deploy no Render

## Pré-requisitos
- Conta no [Render](https://render.com/) (gratuita)
- (Opcional) Git instalado

## Método 1 — Static Site via Git (recomendado)

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

2. Acesse [dashboard.render.com](https://dashboard.render.com)
3. Clique em "New +" → "Static Site"
4. Conecte seu repositório Git
5. Configure:
   - **Name**: meus-clientes
   - **Branch**: main
   - **Build Command**: vazio (HTML puro)
   - **Publish Directory**: `.` (raiz do repositório)
6. Clique em "Create Static Site"

A URL será: `https://meus-clientes.onrender.com/clientes/[slug]/`

## Método 2 — Upload Manual

1. Acesse [dashboard.render.com](https://dashboard.render.com)
2. New + → Static Site → "Upload folder"
3. Arraste a pasta do cliente ou o repositório completo

## Domínio Personalizado

1. No dashboard do Static Site, vá em "Settings" → "Custom Domain"
2. Adicione seu domínio
3. Configure o registro CNAME no seu DNS apontando para `onrender.com`

## Configuração no config.json

```json
{
  "hospedagem": {
    "provedor": "render",
    "pastaBase": "clientes",
    "credenciais": {
      "apiKey": "",          # Render API key (opcional)
      "serviceId": "",       # Static Site ID (opcional)
      "dominio": ""          # Domínio personalizado
    }
  }
}
```

## Vantagens

- ✅ **Grátis**: SSL, CDN global, 100 GB de largura de banda/mês
- ✅ **Auto-deploy**: ao fazer push no Git, o Render atualiza automaticamente
- ✅ **Domínio personalizado** com SSL grátis

## Verificação

Acesse:
```
https://[service].onrender.com/[pastaBase]/[slug]/
```

Confirme que a página carrega corretamente.
