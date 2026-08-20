# 100% Pool — Poolers Guide

The ultimate NHL fantasy pool preparation tool. Player projections, last season stats, tier rankings, trend analysis, and pool value scoring — everything you need to walk into draft night with confidence.

## What it is

A static web app (no framework, no build step) that serves an interactive player table for the upcoming NHL season. The landing page links through to the guide, which pulls live player data from Supabase.

## Features

- **447+ NHL players** with full 2025-26 actuals and hand-crafted 2026-27 projections
- **Tier system** — Elite, Top, Mid, Sleeper — color-coded across the table
- **Trend indicators** — Progression / Stable / Regression with exact points delta
- **Pool Value Score** — composite of pts/GP rate, durability, and tier bonus
- **Sort & filter** by position, tier, team, trend, or any stat column
- **Column toggle** to simplify or expand the view
- **Print** (landscape cheat sheet) and **CSV export**
- **Premium waitlist** with Supabase-backed email capture

## Structure

```
/
├── index.html          # Landing page
├── 100pool.jpg         # Logo
└── 2026-27/
    ├── index.html      # Interactive player guide (main app)
    └── admin.html      # Admin panel for editing projections
```

## Data

Player data is stored in and fetched from [Supabase](https://supabase.com). The `poolers_players` table is queried on page load; the admin panel writes back to the same table.

## Local development

No build step required. Open any HTML file directly in a browser, or serve locally:

```bash
npx serve .
```

## Deployment

Hosted via GitHub Pages. Push to `main` and the site updates automatically.
