# Deploy no Railway

## Pré-requisitos
- Conta no [Railway](https://railway.app/) (gratuito — $5 de crédito inicial, sem cartão)
- (Opcional) [Railway CLI](https://docs.railway.app/develop/cli): `npm install -g @railway/cli`

## Método 1 — Deploy via Dashboard (recomendado)

1. Acesse [railway.app](https://railway.app)
2. Clique em "New Project" → "Deploy from repo" ou "Blank project"
3. Se for "Blank project", use o deploy via upload

## Método 2 — Deploy via CLI

```bash
# Login
railway login

# Criar um novo projeto
railway init

# Deploy de arquivos estáticos
railway up --dir=sites/ana-nutri
```

## Método 3 — Via Nixpacks (para múltiplos clientes)

Crie um `nixpacks.toml` na raiz:

```toml
[phases.setup]
nixPkgs = ["python3"]

[phases.build]
cmds = ["echo 'Static site - no build required'"]

[start]
cmd = "cd sites && python3 -m http.server 8080"
```

E faça deploy do repositório completo no Railway.

## Configuração no config.json

```json
{
  "hospedagem": {
    "provedor": "railway",
    "pastaBase": "clientes",
    "credenciais": {
      "token": "",           # Railway token (opcional)
      "projectId": ""        # Project ID (opcional)
    }
  }
}
```

## Vantagens

- ✅ **Simplicidade**: deploy com um clique
- ✅ **Crédito grátis**: $5/mês (suficiente para sites estáticos)
- ✅ **SSL automático**
- ✅ **Domínios customizados**

## Verificação

Após o deploy, a Railway fornece uma URL `https://[projeto].up.railway.app/`.

Acesse e confirme que a página carrega corretamente.
