---
description: Publicação automatizada de páginas em múltiplos provedores (Netlify, Vercel, HostGator, FTP, GitHub Pages, Cloudflare, Firebase, Railway, Render) com verificação de URL. Use quando o usuário quiser publicar ou fazer deploy de uma página.
---

# Skill: Deploy Modular

## Descrição
Use esta skill ao publicar páginas na hospedagem escolhida — upload, criação de pastas por cliente e verificação da URL pública.

## Fluxo Universal

1. **Identifique o provedor** em `config.json` → `hospedagem.provedor`
2. **Consulte o guia específico** em `hosting/[provedor].md`
3. **Prepare os arquivos**: `sites/[slug]/[slug].html`
4. **Publique**: siga o método recomendado para o provedor
5. **Verifique**: confirme HTTP 200 + conteúdo correto na URL pública
6. **Registre**: atualize `leads.md` com status `publicado` + URL

## Estrutura de Destino

Cada cliente em sua própria pasta:
```
/[pastaBase]/[slug]/index.html
```

## Métodos de Publicação

### Via CLI
```bash
netlify deploy --dir=sites/ana-nutri --prod
```

### Via Upload Manual
Forneça instruções claras: painel → diretório → upload → verificar URL.

### Via API
Use curl ou SDK do provedor.

## Verificação

Após publicar:
1. Acesse `https://[dominio]/[pastaBase]/[slug]/`
2. Confirme HTTP 200
3. Verifique se o título do cliente aparece
