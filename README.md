# Scandinavian Lore

Hugo static site for the Scandinavian Lore podcast — Norse mythology, Scandinavian folklore, and the cultural heritage of the North.

## Project Structure

```
scandinavianlore-web/
├── hugo.toml                    # Hugo configuration
├── content/
│   ├── episodes/                # Episode pages
│   ├── guides/                  # Thematic guides
│   ├── glossary/                # Pronunciation guide & terms
│   ├── news/                    # News posts
│   ├── about.md                 # About page
│   └── contact.md               # Contact page
├── themes/
│   └── scandinavian-lore/       # Custom theme
│       ├── layouts/             # HTML templates
│       ├── layouts/partials/    # JSON-LD structured data
│       └── static/css/          # Stylesheets
└── .github/workflows/           # GitHub Actions (auto-deploy to Pages)
```

## Local Development

### Prerequisites

- [Hugo](https://gohugo.io/installation/) (extended version)

### Preview Locally

```bash
hugo server
```

Open `http://localhost:1313`. Hugo watches for file changes and auto-reloads.

## Content

### Episodes

Create new files in `content/episodes/`:

```yaml
---
title: "Episode Title"
date: 2026-03-01
episode: 1
season: 1
runtime: "30 min"
description: "Brief description"
tags: ["tag1", "tag2"]
podcast_player_url: "https://your-host.com/embed/episode-id"
audio_url: "https://your-host.com/audio/episode.mp3"
audio_length: 28800000
---

Your episode content in Markdown...
```

**`podcast_player_url`** — Embeddable player URL from your podcast host
(Buzzsprout, Transistor, etc.). An iframe player appears in the episode hero
automatically. Optional — the page renders fine without it.

**`audio_url`** and **`audio_length`** (bytes) — Feed the podcast RSS
`<enclosure>` tag for podcast apps. Also optional until you have a host.

### Guides

```yaml
---
title: "Guide Title"
category: "Category Name"
related_episodes: ["s01e01-ginnungagap"]
---
```

### Glossary Terms

```yaml
---
title: "Term Name"
pronunciation: "Pronunciation Guide"
episodes: ["s01e01-ginnungagap"]
related_terms: ["Related Term"]
---
```

Related terms and episodes are rendered as links on the glossary page automatically.

## Deployment

Deploys to GitHub Pages via GitHub Actions on push to `main`. The workflow is
in `.github/workflows/deploy.yml`.

To set up:

1. Go to **Settings > Pages** on the repo
2. Set source to **GitHub Actions**
3. (Optional) Add custom domain under the same settings

## Customization

### Colors

CSS variables in `themes/scandinavian-lore/static/css/style.css`:

```css
:root {
  --bg:     #f8f5ef;
  --amber:  #e05a2b;
  --brown:  #5c3d1e;
  --tan:    #a07850;
  --text:   #1a1612;
}
```

### Fonts

Cormorant Garamond (display) and DM Sans (body), loaded via Google Fonts in `baseof.html`.

### Templates

All in `themes/scandinavian-lore/layouts/`. Standard Hugo template syntax.

## SEO

The site includes:

- Canonical URLs and Open Graph / Twitter Card meta tags
- JSON-LD structured data (PodcastSeries, PodcastEpisode, DefinedTerm, BreadcrumbList)
- Podcast RSS feed with iTunes namespace at `/episodes/index.xml`
- `robots.txt` with sitemap reference
- Image resolution chain: page `thumb` > `hero_image` > site `podcastImage`
