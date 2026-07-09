# Prompt: Redesign de Sites

## Objetivo
Criar versões premium dos sites dos leads qualificados, mantendo identidade visual, logo, fotos e conteúdo reais.

## Instruções para a IA

### 1. Selecione os clientes

Leia `leads.md` e selecione os leads com status `novo`. Mínimo de **5 clientes por lote** (se houver menos, use todos e avise).

Confirme a lista com o usuário antes de começar.

### 2. Para cada cliente

Siga a skill `redesign-premium` em `prompts/skills/redesign-premium.md` — ela é obrigatória e contém todas as regras.

**Passo a passo:**

1. **Extraia o conteúdo do site original**
   - Peça ao usuário para abrir o site original em uma nova aba do navegador
   - Extraia textos, serviços, credenciais, endereço, contatos (peça ao usuário para copiar o conteúdo)
   - Para coletar as URLs REAIS do logo e fotos: peça ao usuário para abrir o Console JavaScript (F12 → Console) e rodar:
     ```js
     document.querySelectorAll('img').forEach(i => console.log(i.currentSrc))
     ```
   - Instrua o usuário a rolar a página inteira antes (para vencer lazy-load)
   - Peça um screenshot do site original para referência visual

2. **Crie o redesign**
   - Siga a estrutura de página em `templates/redesign/page-structure.md`
   - Mantenha logo, fotos e paleta de cores ORIGINAIS
   - Reescreva os textos com copy melhor (sem inventar fatos)
   - Crie uma página profissional, responsiva e de alta conversão
   - **Arquivo único**: CSS inline no `<head>`, HTML5 válido

3. **Salve os arquivos**
   - `sites/[slug]/[slug].html` — Página final (slug em kebab-case, ex.: `jessica-nutri`)
   - `sites/[slug]/[slug]-editor.html` — Página com editor visual injetado (use `templates/editor-visual.html`)

4. **Atualize o comparador**
   - Leia `comparar.html` existente (se houver)
   - Adicione o novo cliente ao array `CLIENTES` no template `templates/comparador-template.html`
   - Salve como `comparar.html` na raiz do projeto

5. **Atualize o lead**
   - Em `leads.md`, mude o status para `redesenhado`

### 3. Checklist de qualidade

Antes de apresentar ao usuário, confirme:
- [ ] Zero texto placeholder ou lorem ipsum
- [ ] Todos os CTAs apontam para contato REAL do cliente
- [ ] WhatsApp no formato correto: `wa.me/55DDDNUMERO`
- [ ] Responsivo em 375px e 1440px
- [ ] Logo e fotos ORIGINAIS presentes
- [ ] Título e meta description preenchidos
- [ ] `[slug]-editor.html` gerado para cada cliente
- [ ] `comparar.html` atualizado com todos os clientes

### 4. Apresente os resultados

Mostre ao usuário:
- Lista dos clientes redesenhados (1 linha cada, destacando o que melhorou)
- Caminho dos arquivos criados
- Sugira: abrir `comparar.html` para ver antes/depois
- Sugira: **Etapa 5: Publish** (prompt `5-publish.md`)

## Arquivos de referência

- `prompts/skills/redesign-premium.md` — Skill completa de redesign
- `templates/redesign/page-structure.md` — Estrutura de página recomendada
- `templates/editor-visual.html` — Script de edição visual para injetar
- `templates/comparador-template.html` — Template do comparador antes/depois
- `leads.md` — Lista de leads (atualizar status)
