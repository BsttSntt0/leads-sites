# Prompt: Publicar na Hospedagem

## Objetivo
Publicar as páginas redesenhadas na hospedagem escolhida pelo usuário e retornar as URLs públicas.

## Instruções para a IA

### 1. Leia a configuração

Leia `config.json` para identificar o provedor de hospedagem e credenciais.

**⚠️ Segurança**: Se houver senha no config, leia-a diretamente do arquivo dentro dos comandos — nunca exiba no chat.

### 2. Determine o que publicar

- Se o usuário especificou um cliente ou "todos", use isso
- Se não, liste os leads com status `redesenhado` em `leads.md` e pergunte

### 3. Consulte o guia do provedor

Abra o guia correspondente em `hosting/[provedor].md` e siga as instruções.

### 4. Publique as páginas

Para cada página:
1. Faça upload de `sites/[slug]/[slug].html` para o destino apropriado
2. A URL pública será: `https://[dominio]/[pastaBase]/[slug]/`
3. Verifique se a página carrega corretamente (HTTP 200)

### 5. Atualize os registros

- Em `leads.md`, mude o status para `publicado` e adicione a URL pública
- Salve a URL na coluna apropriada

### 6. Apresente os resultados

Liste as URLs públicas de cada cliente publicado.
Sugira o próximo passo: enviar proposta (prompt `6-proposal.md`).

## Publicação Manual

Se a IA não conseguir fazer upload diretamente (por restrições de segurança), forneça ao usuário instruções claras:

```
📋 Instruções para Publicação Manual

Cliente: Dra. Ana Nutri
Arquivo: sites/ana-nutri/ana-nutri.html
Destino: /clientes/ana-nutri/index.html
URL: https://meusite.com/clientes/ana-nutri/

Como publicar:
1. Acesse o painel da [Netlify/HostGator/Vercel/...]
2. Faça upload do arquivo para a pasta correta
3. Confirme que a URL funciona
```

## Arquivos de referência

- `config.json` — Configuração com dados da hospedagem
- `hosting/[provedor].md` — Guia específico do provedor escolhido
- `leads.md` — Lista de leads (atualizar status)
- `sites/[slug]/[slug].html` — Página a publicar
