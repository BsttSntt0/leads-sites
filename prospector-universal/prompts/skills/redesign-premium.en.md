# Skill: Premium Redesign

## Description
Use this skill when redesigning a prospect's website — create a premium, high-conversion version of the existing page, maintaining the client's content, logo, and palette.

## Inviolable Rules

### 1. Nothing invented — but text must be IMPROVED
- Every service, credential, number, address, and contact comes from the original site
- NO fake data, created testimonials, or services the client doesn't offer
- However, the TEXT is not copied raw: rewrite with better copy — stronger headlines, clearer sentences, reading hierarchy

### 2. Original photos and logo are MANDATORY
- Collect via `img.currentSrc` in the JS console (scroll the entire page for lazy-load)
- The client must recognize themselves immediately

### 3. Preserved identity
- Maintain the client's logo, color palette, and photos
- If the original palette is weak, refine the tones — never change the color family

### 4. More complete than the original
- Add relevant missing sections (as long as filled with REAL information):
  - Social proof (Google rating + real reviews)
  - "How it works" (if deducible from the original)
  - Location with map
  - Hours (from Google Maps profile)
  - FAQ with real content
- Section that would require inventing facts = don't create

### 5. Single file
- Inline CSS in `<head>`
- No build tools, no dependencies beyond Google Fonts
- Valid, self-contained HTML5

### 6. Mobile-first
- The page will be opened by the client on their phone
- Test every section at 375px

### 7. Editor always
- Also generate the `[slug]-editor.html` file with the injected visual editor

### 8. Comparer always
- Update `comparar.html` with the new client

## Page Structure

### 1. Hero
- Name + specialty
- Clear promise in 1 line
- Primary CTA (WhatsApp) visible without scrolling
- Professional/clinic photo

### 2. Social Proof
- Google rating highlighted ("5.0 ★ · 121 Google reviews")
- 2-3 real review excerpts

### 3. Services
- Clickable cards → WhatsApp with pre-filled message
- `wa.me/55DDDNUMBER?text=Hello! I'd like to know about [service]`

### 4. About
- Real education and credentials

### 5. Offer (when applicable)
- Engagement options (e.g., single session, 90-day program, semester plan)
- NO prices — all lead to WhatsApp

### 6. Location & Contact
- Address, map (Google Maps iframe), hours, phone, social media

### 7. Footer
- Professional credentials (license number if exists)

## Copywriting

| Do | Don't |
|----|-------|
| Headline = benefit | Generic label |
| Gentle PAS structure | Launch aggression |
| 2-3 line blocks | 8-line paragraphs |
| 1 CTA per fold | Conflicting buttons |
| Microcopy (captions) | Generic text |
| Woven social proof | Stacked social proof |

## Aesthetic Standard

- **Typography**: 1 serif for headings (Playfair Display, Fraunces) + 1 sans for body (Inter, Sora, DM Sans)
- **Hierarchy**: h1 ≥ 40px desktop / 30px mobile
- **Spacing**: sections with 80-120px vertical breathing room
- **Palette**: 1 brand color + warm neutrals + 1 accent for CTA
- **WhatsApp button**: fixed floating, bottom right corner
- **Micro-touches**: 12-16px borders, soft shadows, 0.2s transitions
- **Speed**: no libraries, no carousels, no heavy animations

## Final Checklist

- [ ] Zero placeholder text / lorem ipsum
- [ ] All CTAs point to client's REAL contact
- [ ] WhatsApp in correct format: `wa.me/55DDDNUMBER`
- [ ] Responsive at 375px and 1440px
- [ ] Title and meta description filled
- [ ] All important content from old site is present
- [ ] Client's ORIGINAL logo and photos present
- [ ] `[slug]-editor.html` generated
- [ ] `comparar.html` updated
