# Prompt: Configuração Inicial

## Objetivo
Configurar o ambiente do Prospector Universal — assinatura, preferências e conexão com a hospedagem.

## Instruções para a IA

### 1. Verifique a configuração existente

Leia o arquivo `config.json` na raiz do projeto. Se ele não existir, peça ao usuário para copiar `config.json.example` para `config.json` e preencher os dados.

### 2. Verifique a pasta de dados

Confirme se existe uma pasta `sites/` no projeto. Se não existir, crie-a.

### 3. Leia o arquivo de leads

Verifique se `leads.md` existe. Se existir, mostre um resumo dos leads atuais.

### 4. Apresente o resumo

Mostre um resumo claro do que está configurado (sem exibir senhas ou credenciais sensíveis):

```
📋 Resumo da Configuração
━━━━━━━━━━━━━━━━━━━━━
Assinatura: Ana Silva — Especialista em presença digital
Nichos: nutricionistas, psicólogos
Cidade: São Paulo
Leads por busca: 10
Hospedagem: Netlify
━━━━━━━━━━━━━━━━━━━━━
```

### 5. Pergunte o que o usuário quer ajustar

Ofereça estas opções:
- Alterar assinatura / apresentação
- Adicionar/remover nichos
- Trocar cidade padrão
- Alterar provedor de hospedagem
- Configurar novo provedor de hospedagem
- Está tudo certo — quero começar a prospectar

### 6. Teste a hospedagem (se aplicável)

Se o provedor de hospedagem estiver configurado com credenciais, sugira um teste:
- Publique uma página `teste.html` simples
- Confirme que a URL pública funciona

### 7. Próximos passos

Explique o ciclo completo:
1. **🔍 Prospect** — Buscar leads no Google Maps (use o prompt `2-prospect.md`)
2. **🎨 Redesign** — Redesenhar os sites dos leads (use o prompt `3-redesign.md`)
3. **✏️ Editor** — (Opcional) Ajustar páginas manualmente (use o prompt `4-editor.md`)
4. **🚀 Publish** — Publicar na hospedagem (use o prompt `5-publish.md`)
5. **📧 Proposal** — Enviar proposta por e-mail (use o prompt `6-proposal.md`)

## Notas de segurança

- NUNCA peça a senha da hospedagem no chat. Instrua o usuário a preencher diretamente no `config.json`
- NUNCA exiba senhas ou tokens em mensagens ou logs
- Se preferir, recomende usar variáveis de ambiente

## Arquivos de referência

- `config.json` — Configuração principal
- `CONFIGURATION.md` — Guia de configuração detalhado
- `hosting/` — Guias de cada provedor de hospedagem
