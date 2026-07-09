# Recommended Page Structure

Use this structure as a guide when creating the redesign for each client. Adapt to the profession and available real content.

## Standard Layout

```
┌─────────────────────────────────┐
│          HERO                   │
│  Name + Specialty               │
│  Promise in 1 line              │
│  [CTA: WhatsApp]                │
│  Professional photo             │
├─────────────────────────────────┤
│       SOCIAL PROOF              │
│  ⭐ 4.9 · 87 reviews           │
│  "Great professional..."        │
├─────────────────────────────────┤
│        SERVICES                 │
│  ┌──────┐ ┌──────┐ ┌──────┐   │
│  │Card 1│ │Card 2│ │Card 3│   │
│  └──────┘ └──────┘ └──────┘   │
├─────────────────────────────────┤
│         ABOUT                   │
│  Education, credentials         │
│  Photo (if available)           │
├─────────────────────────────────┤
│       HOW IT WORKS             │
│  1️⃣ 2️⃣ 3️⃣ — Step by step     │
├─────────────────────────────────┤
│     LOCATION                    │
│  Address + Map                  │
│  Hours                          │
├─────────────────────────────────┤
│         FINAL CTA               │
│  [Book my appointment]          │
├─────────────────────────────────┤
│        FOOTER                   │
│  License, social media          │
└─────────────────────────────────┘
```

## Section Elements

### Hero
```html
<section class="hero">
  <div class="container">
    <span class="kicker">Psychologist · CRP 00/00000</span>
    <h1>Dr. John Smith</h1>
    <p class="subtitle">Psychotherapy for anxiety and personal development</p>
    <a href="https://wa.me/5511999999999?text=Hello! I came from the website and want to book an appointment" class="btn-whatsapp">
      Book your appointment
    </a>
  </div>
  <img src="PHOTO_URL" alt="Dr. John Smith" class="hero-img">
</section>
```

### Social Proof
```html
<section class="social-proof">
  <div class="container">
    <div class="rating">
      <span class="stars">★★★★★</span>
      <span class="score">4.9 · 87 Google reviews</span>
    </div>
    <blockquote>"Real review text..." — Name</blockquote>
  </div>
</section>
```

### Services
```html
<section class="services">
  <div class="container">
    <h2>Areas of Expertise</h2>
    <div class="cards">
      <div class="card">
        <h3>Individual Therapy</h3>
        <p>Real service description</p>
        <a href="https://wa.me/5511999999999?text=Hello! I want to know about Individual Therapy">Learn more</a>
      </div>
      <!-- ... -->
    </div>
  </div>
</section>
```

## Default Color Palette

Use these proportions:
- **Primary color**: extracted from the client's brand (60% of page)
- **Warm neutral**: off-white, light gray (30%)
- **CTA accent**: contrasting color (10%)

## Breakpoints

- **Mobile**: 375px (priority)
- **Tablet**: 768px
- **Desktop**: 1440px

## Recommended Google Fonts

| Use | Fonts |
|-----|-------|
| Headings | Playfair Display, Fraunces, Lora, Cormorant Garamond |
| Body | Inter, Sora, DM Sans, Nunito, Work Sans |
| Alternative | system-ui, -apple-system |

## CTA Accent Colors

Primary CTA: vibrant, contrasting tone
- Green: `#22c55e` (health, wellness)
- Blue: `#3b82f6` (professional, trust)
- Orange: `#f97316` (action, urgency)
- Wine: `#b91c1c` (sophistication)

## Icons

Use inline SVG for icons (social media, arrows, bullets) — don't depend on external libraries.
