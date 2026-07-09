# Estrutura de Página Recomendada

Use esta estrutura como guia ao criar o redesign de cada cliente. Adapte à profissão e ao conteúdo real disponível.

## Layout Padrão

```
┌─────────────────────────────────┐
│          HERO                   │
│  Nome + Especialidade           │
│  Promessa em 1 linha            │
│  [CTA: WhatsApp]                │
│  Foto profissional              │
├─────────────────────────────────┤
│       PROVA SOCIAL              │
│  ⭐ 4,9 · 87 avaliações        │
│  "Ótimo profissional..."        │
├─────────────────────────────────┤
│        SERVIÇOS                 │
│  ┌──────┐ ┌──────┐ ┌──────┐   │
│  │Card 1│ │Card 2│ │Card 3│   │
│  └──────┘ └──────┘ └──────┘   │
├─────────────────────────────────┤
│         SOBRE                   │
│  Formação, credenciais          │
│  Foto (se houver)               │
├─────────────────────────────────┤
│       COMO FUNCIONA             │
│  1️⃣ 2️⃣ 3️⃣ — Passo a passo     │
├─────────────────────────────────┤
│     LOCALIZAÇÃO                 │
│  Endereço + Mapa                │
│  Horários                       │
├─────────────────────────────────┤
│         CTA FINAL               │
│  [Quero agendar minha consulta] │
├─────────────────────────────────┤
│        RODAPÉ                   │
│  Registro, redes sociais        │
└─────────────────────────────────┘
```

## Elementos de Cada Seção

### Hero
```html
<section class="hero">
  <div class="container">
    <span class="kicker">Psicóloga · CRP 00/00000</span>
    <h1>Dra. Maria Silva</h1>
    <p class="subtitle">Psicoterapia para ansiedade e desenvolvimento pessoal</p>
    <a href="https://wa.me/5511999999999?text=Olá! Vim pelo site e quero agendar uma consulta" class="btn-whatsapp">
      Agende sua consulta
    </a>
  </div>
  <img src="URL_DA_FOTO" alt="Dra. Maria Silva" class="hero-img">
</section>
```

### Prova Social
```html
<section class="social-proof">
  <div class="container">
    <div class="rating">
      <span class="stars">★★★★★</span>
      <span class="score">4,9 · 87 avaliações no Google</span>
    </div>
    <blockquote>"Texto da avaliação real..." — Nome</blockquote>
  </div>
</section>
```

### Serviços
```html
<section class="services">
  <div class="container">
    <h2>Áreas de Atuação</h2>
    <div class="cards">
      <div class="card">
        <h3>Terapia Individual</h3>
        <p>Descrição real do serviço</p>
        <a href="https://wa.me/5511999999999?text=Olá! Quero saber sobre Terapia Individual">Saiba mais</a>
      </div>
      <!-- ... -->
    </div>
  </div>
</section>
```

## Paleta de Cores Padrão

Use estas proporções:
- **Cor primária**: extraída da marca do cliente (60% da página)
- **Neutro quente**: off-white, cinza claro (30%)
- **Destaque CTA**: cor contrastante (10%)

## Breakpoints

- **Mobile**: 375px (prioritário)
- **Tablet**: 768px
- **Desktop**: 1440px

## Google Fonts Recomendadas

| Uso | Fontes |
|-----|--------|
| Títulos | Playfair Display, Fraunces, Lora, Cormorant Garamond |
| Corpo | Inter, Sora, DM Sans, Nunito, Work Sans |
| Alternativa | system-ui, -apple-system |

## Cores de Acento (CTAs)

CTA primário: tom vibrante e contrastante
- Verde: `#22c55e` (saúde, bem-estar)
- Azul: `#3b82f6` (profissional, confiança)
- Laranja: `#f97316` (ação, urgência)
- Vinho: `#b91c1c` (sofisticação)

## Ícones

Use SVG inline para ícones (redes sociais, setas, bullets) — não dependa de bibliotecas externas.
