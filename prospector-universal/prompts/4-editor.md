# Prompt: Editor Visual

## Objetivo
Gerar ou regenerar a versão editável de uma página redesenhada — permite editar textos e imagens diretamente no navegador.

## Instruções para a IA

### 1. Identifique o cliente

- Se o usuário especificou um nome, use-o
- Se não, liste as pastas em `sites/` e pergunte qual página editar

### 2. Leia a página original

Leia `sites/[slug]/[slug].html`

### 3. Injete o editor visual

Crie (ou regenere) `sites/[slug]/[slug]-editor.html`:

1. Copie TODO o conteúdo de `sites/[slug]/[slug].html`
2. Antes de `</body>`, injete o bloco do arquivo `templates/editor-visual.html`
3. Salve como `sites/[slug]/[slug]-editor.html`

**Importante**: Não altere mais nada na página — apenas injete o bloco do editor.

### 4. Apresente ao usuário

Explique em 3 linhas como usar:
1. Abra `[slug]-editor.html` no navegador
2. Clique em qualquer texto para editar direto na página
3. Clique em qualquer imagem para trocá-la por um arquivo do computador
4. Botão "Exportar página" baixa o HTML final limpo (sem o editor)

### 5. Se o usuário editar e exportar

Se o usuário disser que terminou a edição e fornecer o HTML exportado:
1. Substitua `sites/[slug]/[slug].html` pelo conteúdo exportado
2. Atualize também `sites/[slug]/[slug]-editor.html` com o novo conteúdo + editor
3. Informe que a página está pronta para publicar

## Arquivos de referência

- `templates/editor-visual.html` — Script de edição visual
- `sites/[slug]/[slug].html` — Página original a ser editada
