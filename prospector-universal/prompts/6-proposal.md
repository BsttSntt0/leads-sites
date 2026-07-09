# Prompt: Proposta por E-mail

## Objetivo
Redigir e enviar proposta comercial para leads com página publicada — e-mail de apresentação da nova versão do site, com rapport e sem preço.

## Instruções para a IA

### 1. Leia a configuração

Leia `config.json` para obter a assinatura do usuário.

### 2. Selecione os destinatários

Leia `leads.md` e selecione leads com status `publicado` que ainda não receberam proposta.

- Apenas leads com e-mail confirmado
- Para leads sem e-mail, sugira contato via WhatsApp

### 3. Siga a skill de e-mail

Siga as instruções em `prompts/skills/email-proposal.md` — ela contém todas as regras de copywriting.

### 4. Para cada cliente

Escreva um e-mail personalizado seguindo esta estrutura:

**Assunto**: Específico e sem cara de marketing
- Ex.: "Uma nova versão do site da Dra. Ana — 4,9★ no Google merece mais"

**Parágrafo 1 — Rapport**: Elogio específico
- "Encontrei seu consultório no Google Maps e vi que você tem 4,9★ com 87 avaliações. É um trabalho que claramente entrega resultados."

**Parágrafo 2 — Observação**: Defeito específico do site atual
- "Percebi que o site atual não reflete o nível do seu trabalho — não é responsivo no celular e o telefone fica escondido no rodapé."

**Parágrafo 3 — A entrega**: Link da página nova
- "Tomei a liberdade de preparar uma nova versão do seu site, já no ar: [link]"
- (Opcional) Link do site antigo para comparação

**Parágrafo 4 — CTA**: Leve, sem pressão
- "Se puder abrir no celular e me dizer o que achou, fico muito grato."

**Assinatura**: Nome, apresentação, WhatsApp

### 5. Envio

- **Modo rascunho** (padrão): forneça o e-mail completo para o usuário copiar e colar no Gmail. Oriente a anexar um screenshot da página (`sites/[slug]/preview.png`) antes de enviar.
- **Modo direto**: se a IA tiver capacidade de envio, envie diretamente (com autorização do usuário).

### Lead sem e-mail?

Se o lead não tiver e-mail confirmado, adapte a mensagem para WhatsApp:
- Use o mesmo texto, mas mais curto (80-100 palavras)
- Envie o link da página nova
- Registre em `leads.md` como "proposta via WhatsApp"

### 6. Atualize os registros

Em `leads.md`, atualize:
- Status para `proposta enviada`
- Data do envio

### 7. Resumo final

Mostre ao usuário:
- Quantas propostas foram criadas/enviadas
- Para quais clientes
- Lembrete: acompanhar respostas em 3-4 dias úteis
- Sugira follow-up educado se não houver resposta

## Arquivos de referência

- `prompts/skills/email-proposal.md` — Skill completa de proposta por e-mail
- `config.json` — Assinatura do usuário
- `leads.md` — Dados dos leads
- `sites/[slug]/[slug].html` — Página publicada (para screenshot)
