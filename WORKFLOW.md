# Ciclo de Trabalho do Prospector Universal

## Visão Geral

```
CONFIG → PROSPECT → REDESIGN → [EDIT] → PUBLISH → PROPOSAL
                          ↑         │
                          └─────────┘  (loop de ajustes)
```

Cada etapa gera artefatos que alimentam a próxima. Você pode pular etapas ou repeti-las.

---

## Etapa 1: Setup

**Arquivo**: `prompts/1-setup.md`

**O que faz**: Configura sua identidade profissional, nichos-alvo e provedor de hospedagem.

**Entrada**: `config.json` preenchido

**Saída**: `config.json` validado + ambiente pronto

---

## Etapa 2: Prospecção

**Arquivo**: `prompts/2-prospect.md`

**O que faz**: Busca no Google Maps negócios com nota ≥ 4.7 e ≥ 40 avaliações que tenham sites ruins.

**Entrada**: `config.json` + `leads.md` (se existir, para não duplicar)

**Saída**:
- `leads.md` atualizado com novos leads
- (Opcional) Planilha no Google Sheets

**Critérios de qualificação**:
- ✅ Nota ≥ 4.7 no Google
- ✅ Mínimo 40 avaliações
- ✅ Site próprio ATIVO (não vale Instagram, Facebook, Linktree, Doctoralia)
- ✅ Site de qualidade RUIM (não responsivo, design datado, sem CTA)
- ✅ E-mail público encontrado

---

## Etapa 3: Redesign

**Arquivo**: `prompts/3-redesign.md`

**O que faz**: Cria versões premium dos sites dos leads qualificados.

**Entrada**: `leads.md` + URLs dos sites originais

**Saída** (para cada cliente):
- `sites/[slug]/[slug].html` — Página redesenhada
- `sites/[slug]/[slug]-editor.html` — Versão com editor visual
- Atualização do `comparar.html` na raiz

**Regras de ouro**:
- Nada inventado — use logo, fotos e conteúdo REAIS do cliente
- Reescreva o texto com copy melhor, mas sem mudar os fatos
- Arquivo único e autocontido (CSS inline)
- Mobile-first (cliente abre no celular)

---

## Etapa 4: Editor (Opcional)

**Arquivo**: `prompts/4-editor.md`

**O que faz**: Gera a versão editável da página para ajustes manuais no navegador.

**Entrada**: `sites/[slug]/[slug].html`

**Saída**: `sites/[slug]/[slug]-editor.html`

**Como usar o editor**:
1. Abra `[slug]-editor.html` no navegador
2. Clique em qualquer texto para editá-lo
3. Clique em qualquer imagem para trocá-la
4. Clique "Exportar página" para baixar a versão final

---

## Etapa 5: Publicação

**Arquivo**: `prompts/5-publish.md`

**O que faz**: Envia as páginas redesenhadas para a hospedagem escolhida.

**Entrada**: `sites/[slug]/[slug].html` + credenciais da hospedagem

**Saída**: URL pública de cada cliente (`https://seudominio/clientes/[slug]/`)
- `leads.md` — Status atualizado para "publicado"

**Provedores suportados**: Netlify, Vercel, HostGator, GitHub Pages, FTP genérico, Custom

---

## Etapa 6: Proposta

**Arquivo**: `prompts/6-proposal.md`

**O que faz**: Redige e envia e-mail comercial para o lead com link da página nova.

**Entrada**: Dados do lead + URL da página publicada

**Saída**:
- E-mail de proposta (rascunho ou enviado)
- `leads.md` — Status atualizado para "proposta enviada" + data

**Estrutura do e-mail**:
1. Rapport: elogio específico (nota, avaliações, credencial real)
2. Observação delicada sobre o site atual
3. "Preparei uma nova versão" + link
4. CTA leve: peça apenas que abra e dê feedback
5. **Sem preço** — preço no primeiro e-mail vira spam mental

---

## Fluxo por Status do Lead

| Status | Significado | Próximo passo |
|--------|-------------|---------------|
| `novo` | Prospectado, aguardando redesign | Etapa 3: Redesign |
| `redesenhado` | Página criada, não publicada | Etapa 5: Publicar |
| `publicado` | No ar, aguardando proposta | Etapa 6: Proposta |
| `proposta enviada` | E-mail enviado | Acompanhar resposta |
| `fechado` | Cliente contratou | 🎉 |
| `arquivado` | Não teve interesse | Pular em novas rodadas |
