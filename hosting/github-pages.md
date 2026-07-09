# Deploy no GitHub Pages

## Pré-requisitos
- Conta no [GitHub](https://github.com) (gratuita)
- Git instalado

## Método — Publicação via GitHub

### 1. Crie um repositório

```bash
# Crie um repositório no GitHub chamado, ex.: "meus-clientes"
# Ou use seu repositório de usuário: usuario.github.io
```

### 2. Estrutura no repositório

```
meu-repo/
├── clientes/
│   ├── ana-nutri/
│   │   └── index.html
│   └── dr-jose/
│       └── index.html
└── comparar.html
```

### 3. Commit e push

```bash
git init
git add .
git commit -m "Adiciona sites dos clientes"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/meus-clientes.git
git push -u origin main
```

### 4. Ative o GitHub Pages

1. Vá em Settings → Pages
2. Em "Source", selecione "Deploy from a branch"
3. Branch: `main`, pasta: `/ (root)`
4. Salve

### 5. URL pública

```
https://SEU_USUARIO.github.io/meus-clientes/clientes/[slug]/
```

Ou, se for `usuario.github.io`:
```
https://SEU_USUARIO.github.io/clientes/[slug]/
```

## Opção 2 — GitHub Actions (automatizado)

Crie `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Pages
on:
  push:
    branches: ["main"]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: .
```

## Configuração no config.json

```json
{
  "hospedagem": {
    "provedor": "github-pages",
    "pastaBase": "clientes",
    "credenciais": {
      "usuario": "seu-usuario-github",
      "repo": "meus-clientes",
      "dominio": "seu-usuario.github.io"
    }
  }
}
```

## Verificação

Acesse a URL pública e confirme que a página carrega corretamente.
