# Checkpoint — Design Tokens

Derived from the mockups in `/design`. Brand vibe: **warm orange + forest green on cream**,
heavily rounded surfaces, pill-shaped primary CTAs, playful-but-clean travel feel.

## Files

| File          | What it is                                                              |
| ------------- | ----------------------------------------------------------------------- |
| `tokens.json` | Source of truth (colors, type, radius, spacing, shadows, motion).       |
| `theme.css`   | Tailwind CSS v4 drop-in: raw palette + semantic light/dark + utilities. |

## Palette at a glance

| Role            | Token            | Hex       | Used for                                        |
| --------------- | ---------------- | --------- | ----------------------------------------------- |
| Primary         | `primary-500`    | `#F4511E` | CHECK-IN button, email login, map pins, active nav |
| Brand / heading | `clay-500`       | `#B23A1F` | "Checkpoint" wordmark, headings, passport card  |
| Secondary       | `green-700`      | `#1B5E20` | AI Plan tab, XP/level bars, success             |
| Accent          | `accent-500`     | `#EF4329` | Create-post CTA, like/heart                     |
| Background       | `neutral-50`    | `#FAF7F2` | App background (cream)                           |
| Surface          | `neutral-0`     | `#FFFFFF` | Cards                                            |
| Text             | `foreground`    | `#211C17` | Primary text (warm near-black)                   |

## Typography

- **Display / headings:** Fredoka (rounded, friendly) — matches the wordmark.
- **Body / UI:** Be Vietnam Pro — excellent Vietnamese diacritics.

Load via Google Fonts (or `next/font`):

```html
<link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@500;600;700&family=Be+Vietnam+Pro:wght@400;500;600;700&display=swap" rel="stylesheet">
```

## Component cues from the mockups

- **Primary CTA:** `rounded-full`, `bg-primary` (or `--gradient-primary`), `text-white`, `shadow-cta`, bold.
- **Cards:** `rounded-xl`, `bg-surface`, `shadow-card`, padding `16–20px`.
- **Chips / tags** (e.g. `#PhuQuoc_4_Ngay`): `rounded-full`, `bg-green-50`, `text-green-700`.
- **XP badge** (`+50 XP`): `rounded-md`, `bg-green-700`, `text-white`, small bold.
- **Bottom nav:** 5 tabs (Map · Discover · Create · AI Plan · Profile), active tab pill-highlighted in `primary` (Map) or `green` (AI Plan).
- **Passport / profile card:** `--gradient-passport` background, stat columns, white text.
- **Inputs / search:** `rounded-full`, `bg-surface`, `border`.

## Usage (Tailwind v4)

```css
/* globals.css */
@import "tailwindcss";
@import "./theme.css";
```

```tsx
<button className="rounded-full bg-primary px-6 py-3 font-display font-bold text-primary-foreground shadow-cta">
  Check-in
</button>
<span className="rounded-md bg-green-700 px-2 py-0.5 text-xs font-semibold text-white">+50 XP</span>
```

Dark mode: toggle `class="dark"` on `<html>`; semantic colors flip automatically.
