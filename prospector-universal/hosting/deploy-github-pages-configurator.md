# Publicar o Configurador no GitHub Pages

Este guia cobre como publicar o `generate-config.html` (configurador interativo) no GitHub Pages para acesso via URL pública.

## Opção 1 — Repositório dedicado (recomendado)

Crie um repositório separado apenas para o configurador:

```bash
# 1. Crie uma pasta limpa
mkdir prospector-configurator
cd prospector-configurator

# 2. Copie apenas o arquivo HTML
cp /caminho/para/prospector-universal/scripts/generate-config.html index.html

# 3. Inicialize o Git
git init
git checkout -b main
git add index.html
git commit -m "Adiciona configurador interativo do Prospector Universal"

# 4. Crie o repositório no GitHub e faça push
git remote add origin https://github.com/SEU_USUARIO/prospector-configurator.git
git push -u origin main
```

**Ativar GitHub Pages:**
1. Vá em Settings → Pages
2. Source: "Deploy from a branch"
3. Branch: `main`, folder: `/ (root)`
4. Salve

**URL pública:** `https://SEU_USUARIO.github.io/prospector-configurator/`

## Opção 2 — Na raiz do seu perfil GitHub

Crie um repositório `SEU_USUARIO.github.io`:

```bash
# index.html na raiz do repositório
git clone https://github.com/SEU_USUARIO/SEU_USUARIO.github.io.git
cd SEU_USUARIO.github.io
cp /caminho/para/generate-config.html index.html
git add index.html
git commit -m "Adiciona configurador Prospector Universal"
git push
```

**URL:** `https://SEU_USUARIO.github.io/`

## Deploy rápido em outros provedores (Netlify / Vercel)

Como o configurador é um único HTML estático, o deploy é trivial em qualquer provedor:

- **Netlify**: arraste `index.html` para [app.netlify.com/drop](https://app.netlify.com/drop) — deploy instantâneo
- **Vercel**: arraste a pasta para [vercel.com/import](https://vercel.com/import) ou importe o repositório Git com configuração zero

## Opção 3 — Subpasta no projeto principal

Se quiser manter no repositório do Prospector Universal:

1. Copie `scripts/generate-config.html` para a raiz ou crie uma pasta `docs/`
2. Ative GitHub Pages no repositório apontando para a pasta correta
3. Acesse `https://SEU_USUARIO.github.io/prospector-universal/generate-config.html`

## Personalização

### Domínio personalizado
1. Adicione um arquivo `CNAME` na raiz com seu domínio:
```
configurador.seusite.com
```
2. Configure o registro CNAME no seu DNS apontando para `SEU_USUARIO.github.io`

### HTTPS
GitHub Pages fornece HTTPS automático com certificados Let's Encrypt.

## Verificação pós-publicação

- [ ] A página carrega sem erros no console
- [ ] O toggle PT/EN funciona
- [ ] A validação de campos funciona
- [ ] O download do config.json funciona
- [ ] Responsivo no celular
- [ ] HTTPS ativo (sem conteúdo misto)

## Segurança

- ✅ Sem chaves de API no código
- ✅ Sem scripts externos
- ✅ CSP configurado via meta tag
- ✅ Apenas HTML/CSS/JS puro — sem build, sem dependências
- ✅ O arquivo baixado (config.json) contém dados do usuário, não do servidor
