# Skill: Redesign Premium

## Descrição
Use esta skill ao redesenhar o site de um cliente prospectado — criar uma versão premium e de alta conversão da página existente, mantendo conteúdo, logo e paleta do cliente.

## Regras Invioláveis

### 1. Nada inventado — mas o texto deve ser APRIMORADO
- Todo serviço, credencial, número, endereço e contato vem do site original
- SEM dados fictícios, depoimentos criados ou serviços que o cliente não oferece
- Porém o TEXTO não é copiado cru: reescreva com copy melhor — títulos mais fortes, frases mais claras, hierarquia de leitura

### 2. Fotos e logo originais são OBRIGATÓRIOS
- Colete via `img.currentSrc` no console JS (role a página inteira para lazy-load)
- O cliente precisa se reconhecer na hora

### 3. Identidade preservada
- Mantenha logo, paleta de cores e fotos do cliente
- Se a paleta original for fraca, refinar os tons — nunca trocar a família de cores

### 4. Mais completo que o original
- Adicione seções relevantes que faltam (desde que com informação REAL):
  - Prova social (nota + avaliações reais do Google)
  - "Como funciona" (se dedutível do original)
  - Localização com mapa
  - Horários (do perfil do Maps)
  - FAQ com conteúdo real
- Seção que exigiria inventar fato = não criar

### 5. Arquivo único
- CSS inline no `<head>`
- Sem build, sem dependências além de Google Fonts
- HTML5 válido e autocontido

### 6. Mobile-first
- A página será aberta pelo cliente no celular
- Teste cada seção em 375px

### 7. Editor sempre
- Gere também o arquivo `[slug]-editor.html` com o editor visual injetado

### 8. Comparador sempre
- Atualize `comparar.html` com o novo cliente

## Estrutura da Página

### 1. Hero
- Nome + especialidade
- Promessa clara em 1 linha
- CTA primário (WhatsApp) visível sem rolar
- Foto do profissional/clínica

### 2. Prova Social
- Nota do Google em destaque ("5.0 ★ · 121 avaliações no Google")
- 2-3 trechos de avaliações reais

### 3. Serviços
- Cards clicáveis → WhatsApp com mensagem pré-preenchida
- `wa.me/55DDDNUMERO?text=Olá! Quero saber sobre [serviço]`

### 4. Sobre
- Formação e credenciais reais

### 5. Oferta (quando fizer sentido)
- Opções de engajamento (ex.: sessão pontual, acompanhamento)
- SEM preços — todos levam ao WhatsApp

### 6. Localização e Contato
- Endereço, mapa (iframe Google Maps), horários, telefone, redes

### 7. Rodapé
- Dados profissionais (registro de classe se existir)

## Copywriting

| Faça | Não faça |
|------|----------|
| Headline = benefício | Rótulo genérico |
| Estrutura PAS suave | Agressividade de lançamento |
| Blocos de 2-3 linhas | Parágrafos de 8 linhas |
| 1 CTA por dobra | Muitos botões conflitantes |
| Microcopy (legendas) | Texto genérico |
| Prova social costurada | Prova social empilhada |

## Padrão Estético

- **Tipografia**: 1 serifada para títulos (Playfair Display, Fraunces) + 1 sans para corpo (Inter, Sora, DM Sans)
- **Hierarquia**: h1 ≥ 40px desktop / 30px mobile
- **Espaçamento**: seções com 80-120px de respiro vertical
- **Paleta**: 1 cor da marca + neutros quentes + 1 tom de destaque para CTA
- **Botão WhatsApp**: flutuante fixo no canto inferior direito
- **Micro-toques**: bordas 12-16px, sombras suaves, transições 0.2s
- **Velocidade**: sem bibliotecas, sem carrosséis, sem animações pesadas

## Checklist Final

- [ ] Zero texto placeholder / lorem ipsum
- [ ] Todos os CTAs apontam para contato REAL do cliente
- [ ] WhatsApp no formato correto: `wa.me/55DDDNUMERO`
- [ ] Responsivo em 375px e 1440px
- [ ] Título e meta description preenchidos
- [ ] Conteúdo importante do site antigo está presente
- [ ] Logo e fotos ORIGINAIS do cliente presentes
- [ ] `[slug]-editor.html` gerado
- [ ] `comparar.html` atualizado
