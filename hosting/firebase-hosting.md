# Deploy no Firebase Hosting

## Pré-requisitos
- Conta no [Firebase](https://console.firebase.google.com/) (gratuita)
- CLI do Firebase: `npm install -g firebase-tools`

## Método 1 — Deploy via CLI

```bash
# 1. Login
firebase login

# 2. Inicializar o Firebase Hosting no projeto
firebase init hosting

# Durante a configuração:
# ? What do you want to use as your public directory? → sites
# ? Configure as a single-page app? → No
# ? Set up automatic builds and deploys with GitHub? → No

# 3. Estrutura esperada:
# firebase.json deve conter:
# {
#   "hosting": {
#     "public": "sites",
#     "ignore": ["firebase.json", "**/.*"],
#     "rewrites": []
#   }
# }

# 4. Deploy
firebase deploy --only hosting
```

A URL será: `https://[projeto].web.app/clientes/[slug]/`

## Método 2 — Deploy de um cliente específico

```bash
# Crie um firebase.json apontando para a pasta do cliente
cat > firebase.json << EOF
{
  "hosting": {
    "public": "sites/ana-nutri",
    "ignore": ["firebase.json"]
  }
}
EOF

firebase deploy --only hosting
```

## Método 3 — Múltiplos sites no mesmo projeto (Firebase Multi-Site)

O Firebase permite múltiplos sites no mesmo projeto:

1. No Console Firebase → Hosting → Adicionar outro site
2. Configure `firebase.json`:

```json
{
  "hosting": [
    {
      "target": "ana-nutri",
      "public": "sites/ana-nutri",
      "ignore": ["firebase.json"]
    },
    {
      "target": "dr-jose",
      "public": "sites/dr-jose",
      "ignore": ["firebase.json"]
    }
  ]
}
```

3. Atualize os targets:
```bash
firebase target:apply hosting ana-nutri clientes-ana-nutri
firebase target:apply hosting dr-jose clientes-dr-jose
```

4. URLs: `https://clientes-ana-nutri.web.app/` e `https://clientes-dr-jose.web.app/`

## Configuração no config.json

```json
{
  "hospedagem": {
    "provedor": "firebase-hosting",
    "pastaBase": "clientes",
    "credenciais": {
      "projectId": "",       # ID do projeto no Firebase
      "token": ""            # Firebase token (opcional)
    }
  }
}
```

## Verificação

Acesse:
```
https://[project].web.app/[pastaBase]/[slug]/
```

Confirme que a página carrega corretamente.

## Observações

- O Firebase Hosting tem 10 GB de armazenamento e 360 MB de transferência/mês no plano gratuito
- SSL grátis e automático
- Suporte a domínio personalizado
