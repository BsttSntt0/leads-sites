# 🔍 Prospector Universal

**Sistema semi-automático de prospecção de clientes — compatível com QUALQUER IA (ChatGPT, Claude, Gemini, Copilot, etc.)**

Encontre negócios bem avaliados com sites ruins no Google Maps, redesenhe as páginas com estética premium, publique no provedor que você escolher e envie propostas comerciais irresistíveis.

---

## 🎯 O Ciclo Completo

```
1. CONFIG → 2. PROSPECT → 3. REDESIGN → 4. EDIT → 5. PUBLISH → 6. PROPOSAL
```

| Etapa | O que acontece |
|-------|----------------|
| **① Config** | Define sua assinatura, nichos-alvo, cidade padrão e credenciais de hospedagem |
| **② Prospect** | Busca no Google Maps negócios com nota ≥ 4.7 e site ruim, gera planilha de leads |
| **③ Redesign** | Cria versões premium dos sites, mantendo logo, fotos e conteúdo reais |
| **④ Editor** | Gera versão editável no navegador para ajustes finos |
| **⑤ Publish** | Faz upload para a hospedagem que você escolher (Netlify, HostGator, Vercel, FTP, etc.) |
| **⑥ Proposal** | Redige e envia e-mail comercial (sem preço) com link da página nova |

---

## 🧠 Como usar com QUALQUER IA

Este projeto foi estruturado para funcionar com **qualquer assistente de IA**, sem depender de plataforma específica:

### Abordagem 1 — Copiar e colar prompts

1. Abra seu assistente de IA preferido (ChatGPT, Claude, Gemini, etc.)
2. Para cada etapa, copie o conteúdo do prompt correspondente em `prompts/`
3. Siga as instruções que a IA gerar

### Abordagem 2 — Projeto completo (recomendado)

1. Faça download/clone deste repositório
2. Configure seus dados em `config.json` (use `config.json.example` como base)
3. Compartilhe a pasta com seu assistente de IA (se a plataforma permitir upload de arquivos)
4. Inicie com o prompt de setup: *"Execute a etapa de configuração do Prospector Universal"*

### Abordagem 3 — Assistente personalizado (avançado)

- **ChatGPT**: Crie um GPT personalizado com as instruções em `prompts/` como base
- **Claude Projects**: Crie um Project com este repositório como contexto
- **Gemini Gems**: Crie um Gem customizado com as instruções
- **Copilot**: Use o repositório como contexto de desenvolvimento

---

## 📁 Estrutura do Projeto

```
prospector-universal/
├── README.md                    ← Você está aqui
├── CONFIGURATION.md             ← Guia de configuração detalhado
├── WORKFLOW.md                  ← Visão geral do ciclo completo
├── config.json.example          ← Template de configuração
├── prompts/
│   ├── 1-setup.md               ← Prompt: configuração inicial
│   ├── 2-prospect.md            ← Prompt: prospecção no Google Maps
│   ├── 3-redesign.md            ← Prompt: redesign de sites
│   ├── 4-editor.md              ← Prompt: gerar editor visual
│   ├── 5-publish.md             ← Prompt: publicar na hospedagem
│   ├── 6-proposal.md            ← Prompt: enviar proposta por e-mail
│   └── skills/
│       ├── prospect-maps.md     ← Skill: prospecção no Google Maps
│       ├── redesign-premium.md  ← Skill: redesign premium
│       ├── deploy-modular.md    ← Skill: deploy multi-provedor
│       └── email-proposal.md    ← Skill: proposta por e-mail
├── templates/
│   ├── editor-visual.html       ← Script de edição visual (injetar nas páginas)
│   ├── comparador-template.html ← Template do comparador antes/depois
│   └── redesign/
│       └── page-structure.md    ← Estrutura de página recomendada
├── hosting/
│   ├── README.md                ← Como adicionar provedores
│   ├── netlify.md               ← Deploy na Netlify
│   ├── vercel.md                ← Deploy na Vercel
│   ├── hostgator.md             ← Deploy na HostGator
│   ├── traditional-ftp.md       ← Deploy FTP genérico
│   ├── github-pages.md          ← Deploy no GitHub Pages
│   └── custom.md                ← Adicionar seu próprio provedor
├── scripts/
│   ├── setup-config.sh          ← Script para criar config.json
│   └── deploy.sh                ← Script auxiliar de deploy
├── docs/
│   └── lead-ranking.md          ← Como ranquear leads
└── .gitignore
```

---

## 🚀 Quick Start

### 1. Configuração

```bash
cp config.json.example config.json
# Edite config.json com seus dados
```

Ou use o script interativo:
```bash
bash scripts/setup-config.sh
```

### 2. Escolha seu fluxo

Abra `prompts/1-setup.md` e cole no seu assistente de IA preferido. Siga as instruções.

### 3. Acompanhe seus leads

Os leads são salvos em `leads.md` (formato markdown) e você pode exportá-los para Google Sheets ou qualquer planilha.

---

## 🔌 Provedores de Hospedagem Suportados

| Provedor | Tipo | Gratuito? | Documentação |
|----------|------|-----------|--------------|
| **Netlify** | Serverless | ✅ (plano gratuito generoso) | `hosting/netlify.md` |
| **Vercel** | Serverless | ✅ (plano gratuito generoso) | `hosting/vercel.md` |
| **GitHub Pages** | Estático | ✅ (grátis) | `hosting/github-pages.md` |
| **HostGator** | Tradicional | ❌ (pago) | `hosting/hostgator.md` |
| **FTP Genérico** | Tradicional | ❌ (pago) | `hosting/traditional-ftp.md` |
| **Customizado** | Qualquer | Depende | `hosting/custom.md` |

Quer usar um provedor diferente? Siga o guia em `hosting/custom.md` para adicionar qualquer hospedagem.

---

## 📊 Onde os dados ficam

```
prospector-universal/
├── config.json         ← Configuração (assinatura, preferências, credenciais)
├── leads.md            ← Pipeline de leads (status: novo → redesenhado → publicado → proposta enviada)
├── sites/
│   └── [slug]/         ← Página redesenhada de cada cliente
│       ├── [slug].html           ← Página final
│       ├── [slug]-editor.html    ← Versão editável no navegador
│       └── preview.png           ← Screenshot da página
└── comparar.html       ← Comparador antes/depois (atualizado a cada redesign)
```

---

## 📋 Pré-requisitos

- Navegador Chrome/Chromium (para prospecção no Google Maps)
- Acesso a um assistente de IA (ChatGPT, Claude, Gemini, etc.)
- Conta no provedor de hospedagem escolhido
- (Opcional) Conta Gmail para envio de propostas via e-mail

---

## 📝 Licença

MIT — Use, modifique e distribua livremente.
