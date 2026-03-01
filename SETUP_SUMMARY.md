# Scandinavian Lore — Hugo Site Complete ✅

## What's Built

I've created a complete Hugo site structure for Scandinavian Lore Pod, ready for local development and deployment to your server.

### Project Location
```
/Users/marcus/git/scandinavianlore-web/
```

### What You Have

**Configuration:**
- `hugo.toml` — Site metadata, navigation, colors, social links
- Custom theme with warm/earthy color palette (dark brown, tan, cream)

**Content (Ready to Use):**
- 3 complete episode pages (S01E01, S01E02, S01E03) — converted directly from your scripts
- 1 sample guide ("Understanding Norse Cosmology")
- 11 glossary terms with Old Norse pronunciation guides
- About page and episode/guide index pages

**Custom Theme:**
- Responsive design (mobile-friendly)
- Warm/earthy aesthetic matching your brand vision
- Glossary with pronunciation support
- Episode cards with metadata
- Clean typography and navigation
- Static site generation (zero database, zero maintenance)

**Templates:**
- Homepage with featured episodes and guides
- Episode archive/list view
- Individual episode pages with show notes
- Glossary with pronunciation guides
- Responsive layouts

**Deployment:**
- `README.md` — Full setup and deployment guide
- `start-dev.sh` — Quick script to run locally
- `deploy.sh` — Deployment helper script
- Post-receive hook template for auto-building on your server

---

## Getting Started (3 Steps)

### Step 1: Install Hugo
```bash
brew install hugo
```

### Step 2: Run Locally
```bash
cd /Users/marcus/git/scandinavianlore-web
./start-dev.sh
```
Then open http://localhost:1313 in your browser. You'll see the full site with all 3 episodes, guides, and glossary.

### Step 3: Explore the Structure
Open the `content/` folder:
- `episodes/s01e01-ginnungagap.md` — Episode 1 (with your script content)
- `glossary/yggdrasil.md` — Pronunciation guide example
- `guides/norse-cosmology.md` — Sample guide

---

## How to Use This Going Forward

### Adding a New Episode
1. Create `content/episodes/s01e04-title.md`
2. Copy the frontmatter from an existing episode
3. Paste your script content
4. Commit and push

### Adding Glossary Terms
1. Create `content/glossary/term-name.md`
2. Include `pronunciation` in the frontmatter
3. Link related episodes
4. Commit and push

### Adding Guides
1. Create `content/guides/guide-name.md`
2. Write in Markdown
3. Tag related episodes
4. Commit and push

---

## Deployment to Your Server

Once you're ready to go live:

1. **SSH into your server** and run the one-time setup (see `README.md` or `deploy.sh`)
2. **Configure Git remote** on your machine pointing to your server
3. **Push to deploy**: `git push production master`

That's it. Hugo builds automatically, and nginx serves the new site.

---

## Design Features

**Color Palette (warm/earthy, matches your brand):**
- Primary: #3d2817 (dark brown)
- Secondary: #8b6f47 (warm tan)
- Accent: #c4a57b (light sand)
- Background: #f5f1e8 (cream)

All colors are in `themes/scandinavian-lore/static/css/style.css` and easy to customize.

**Typography:**
- Clean sans-serif for readability
- Proper heading hierarchy
- Generous line spacing
- Mobile-responsive

---

## Customization

Everything is easy to change:

- **Colors:** Edit `:root` variables in `style.css`
- **Fonts:** Change `body { font-family: ... }`
- **Layout:** Edit templates in `themes/scandinavian-lore/layouts/`
- **Navigation:** Edit menu in `hugo.toml`

No need for page builders or WordPress plugins. Just Markdown files and simple HTML templates.

---

## Key Advantages Over WordPress

✅ **No database** — Everything is files. Easy to back up, easy to understand.
✅ **No security updates** — Static HTML doesn't get hacked.
✅ **Fast** — Serves static files. No PHP, no queries, no wait time.
✅ **Version control** — Git tracks all changes. Easy rollback if needed.
✅ **Automation** — Write → Git push → Site updates automatically.
✅ **No maintenance** — Hugo doesn't need updates like WordPress does.
✅ **Cheaper hosting** — Any server with nginx. No PHP requirements.

---

## File Structure Overview

```
scandinavianlore-web/
├── hugo.toml                          # Configuration
├── README.md                          # Full documentation
├── start-dev.sh                       # Local dev script
├── deploy.sh                          # Deployment helper
│
├── content/                           # All content goes here
│   ├── _index.md                      # Homepage
│   ├── about.md                       # About page
│   ├── episodes/
│   │   ├── _index.md                  # Episodes archive
│   │   ├── s01e01-ginnungagap.md     # Episode 1 (from your script)
│   │   ├── s01e02-yggdrasil.md       # Episode 2 (from your script)
│   │   └── s01e03-nine-worlds.md     # Episode 3 (from your script)
│   ├── guides/
│   │   ├── _index.md                  # Guides archive
│   │   └── norse-cosmology.md         # Sample guide
│   └── glossary/
│       ├── _index.md                  # Glossary index
│       └── [11 individual terms]      # Yggdrasil, Odin, etc.
│
└── themes/scandinavian-lore/          # Custom theme
    ├── layouts/                       # HTML templates
    │   ├── baseof.html               # Base layout
    │   ├── index.html                # Homepage
    │   ├── episodes/
    │   │   ├── list.html             # Episode archive
    │   │   └── single.html           # Single episode
    │   ├── guides/
    │   │   ├── list.html             # Guides archive
    │   │   └── single.html           # Single guide
    │   └── glossary/
    │       ├── list.html             # Glossary index
    │       └── single.html           # Single term
    └── static/
        └── css/style.css             # All styling
```

---

## Next Steps

1. ✅ **Install Hugo** (`brew install hugo`)
2. ✅ **Run locally** (`./start-dev.sh`)
3. ✅ **Explore the site** at http://localhost:1313
4. ✅ **Read the README** for deployment instructions
5. ✅ **Start adding content** (new episodes, guides, glossary terms)
6. ✅ **Deploy to your server** when ready

---

## Support

All information you need is in:
- **Local setup:** `README.md` (detailed, step-by-step)
- **Hugo docs:** https://gohugo.io
- **Markdown guide:** https://www.markdownguide.org

The site is built. The workflow is set up. You're ready to launch.

---

**Created:** February 28, 2026
**Project:** Scandinavian Lore Pod
**Framework:** Hugo (static site generator)
**Theme:** Custom, warm/earthy aesthetic
**Status:** Ready for local development and server deployment
