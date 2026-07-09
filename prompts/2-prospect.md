# Prompt: Prospecção no Google Maps

## Objetivo
Encontrar negócios bem avaliados (≥ 4.7) com sites ruins no Google Maps e gerar uma lista de leads qualificados.

## Contexto para a IA

O usuário quer que você ajude a prospectar clientes em potencial. Você precisa:
1. Navegar pelo Google Maps
2. Avaliar estabelecimentos
3. Coletar dados dos leads qualificados
4. Gerar a lista de leads

## Instruções

### 1. Leia a configuração

Leia `config.json` para obter:
- Nichos e cidade padrão
- Número de leads por busca
- Nota mínima e avaliações mínimas

Determine nicho e cidade: use o que o usuário solicitar, ou os padrões do config.

### 2. Leia leads existentes

Leia `leads.md` (se existir) para saber quais profissionais já foram avaliados. Estes devem ser EXCLUÍDOS da nova busca.

### 3. Execute a prospecção no Google Maps

Siga as instruções detalhadas da skill `prospect-maps` (veja o conteúdo completo abaixo, na seção "Skill: Prospecção no Google Maps").

### Resumo do fluxo a seguir:
1. Busque `[nicho] em [cidade]` no Google Maps
2. Avalie estabelecimentos em ordem
3. Aplique os 3 filtros eliminatórios (site próprio, site ruim, e-mail público)
4. Colete dados dos leads qualificados
5. Repita até bater a meta ou esgotar 25 estabelecimentos

### 4. Gere a saída

Crie/atualize `leads.md` com TODOS os avaliados (qualificados E descartados), neste formato:

```markdown
# Leads - Nutricionistas em São Paulo
## Busca em: 10/07/2026

### Qualificados

| # | Nome | Nota | Avaliações | E-mail | Telefone | Site | Motivo | Status |
|---|------|------|------------|--------|----------|------|--------|--------|
| 1 | Dra. Ana Nutri | 4.9 | 87 | ana@email.com | 11 99999-9999 | exemplo.com.br | Não responsivo + sem CTA | novo |

### Descartados

| # | Nome | Nota | Avaliações | Motivo do descarte |
|---|------|------|------------|---------------------|
| 1 | Clínica X | 4.8 | 120 | Site já é bom |
| 2 | Dr. João | 4.7 | 55 | Sem site próprio (só Instagram) |
```

### 5. (Opcional) Planilha

Se o usuário quiser, ajude a criar uma planilha no Google Sheets com os mesmos dados. Forneça o CSV e instruções de importação.

### 6. Próximos passos

Sugira ao usuário:
- Quantos leads foram encontrados
- Quais os melhores candidatos para redesign
- **Próxima etapa**: **🎨 Redesign** — usar o prompt `3-redesign.md` para criar as páginas premium

## Arquivos de referência

- `prompts/skills/prospect-maps.md` — Skill detalhada de prospecção
- `config.json` — Configuração com nichos e cidade
- `leads.md` — Lista de leads (criar ou atualizar)
