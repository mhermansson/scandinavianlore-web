# Scandinavian Lore Pod — Pre-Launch Checklist

Use this checklist as you prepare to launch and grow the site.

## ✅ Local Development (Complete)

- [x] Hugo site structure created
- [x] Custom theme with warm/earthy palette
- [x] 3 episodes converted from your scripts
- [x] 11 glossary terms with pronunciation
- [x] 1 sample guide
- [x] Responsive layouts
- [x] `start-dev.sh` script ready

**Your action:** Install Hugo and run `./start-dev.sh` to preview

---

## ⬜ Pre-Launch Setup

- [ ] Install Hugo locally (`brew install hugo`)
- [ ] Run `./start-dev.sh` and verify site loads at http://localhost:1313
- [ ] Review all 3 episode pages and check for any edits needed
- [ ] Review glossary terms—add any missing terms from your research vault
- [ ] Write your host bio for the About page
- [ ] Update Patreon link in `hugo.toml`
- [ ] Update podcast listen links (Spotify, Apple, Google) in `hugo.toml`
- [ ] Test all internal links work

**Time estimate:** 1–2 hours

---

## 🚀 Server Deployment

- [ ] SSH into your server
- [ ] Run one-time setup (create Git repo, post-receive hook, web directory)
- [ ] Configure nginx with the provided config
- [ ] Test nginx restart (`sudo systemctl restart nginx`)
- [ ] On your local machine: `git init` in the project directory
- [ ] Add production remote: `git remote add production ssh://[server-details]`
- [ ] Make first commit: `git add . && git commit -m "Initial site"`
- [ ] Deploy: `git push production master`
- [ ] Verify site appears at http://your-domain.com

**Time estimate:** 1–2 hours (first time), 5 minutes after that

---

## 📝 Content Expansion (Ongoing)

For each new episode:
- [ ] Copy `content/episodes/TEMPLATE.md`
- [ ] Rename to `s01eXX-title.md`
- [ ] Fill in frontmatter (title, date, episode number, runtime, description, tags)
- [ ] Add show notes, key concepts, sources
- [ ] Commit and push: `git add . && git commit -m "Add S01E04" && git push production master`

For new glossary terms:
- [ ] Create `content/glossary/term-name.md`
- [ ] Add Old Norse term, pronunciation guide, definition
- [ ] Link to related episodes in the frontmatter
- [ ] Commit and push

For guides:
- [ ] Create `content/guides/guide-name.md`
- [ ] Write in Markdown (no character limit!)
- [ ] Link to related episodes
- [ ] Commit and push

---

## 🎨 Customization (Optional)

- [ ] Adjust color palette in `themes/scandinavian-lore/static/css/style.css`
- [ ] Update fonts if desired
- [ ] Add custom navigation items in `hugo.toml`
- [ ] Modify episode/guide layout if desired
- [ ] Add favicon or logo image
- [ ] Set up SSL/HTTPS on your server (recommended)

---

## 📊 Post-Launch Monitoring

- [ ] Set up web analytics (Google Analytics, Plausible, etc.) — optional
- [ ] Monitor server disk space and bandwidth
- [ ] Test that new episodes deploy correctly
- [ ] Verify all links work after deployment
- [ ] Check mobile responsiveness on phones
- [ ] Monitor site performance with lighthouse or similar

---

## 🔗 Integration Tasks

**These are separate from the Hugo site but useful:**

- [ ] Set up podcast RSS feed (Hugo auto-generates at `/index.xml`)
- [ ] Submit to Spotify, Apple Podcasts, etc. (use the RSS feed URL)
- [ ] Add tracking links if you want analytics per platform
- [ ] Set up Patreon page
- [ ] Configure email newsletter if desired
- [ ] Set up social media accounts (Twitter, Instagram, etc.)

---

## 📋 Ongoing Maintenance

**Weekly/Biweekly:**
- Write new episode
- Add glossary terms from episode research
- Commit and push to deploy

**Monthly:**
- Review analytics if you're tracking them
- Check for any broken links
- Update content if sources need corrections

**Quarterly:**
- Review and expand guides
- Add new regional folklore content
- Expand glossary with deeper definitions

---

## 🎯 Success Metrics

**Launch:**
- [ ] Site is live and accessible
- [ ] All 3 episodes visible and clickable
- [ ] Glossary searchable
- [ ] Mobile version works
- [ ] Listen links go to correct platforms

**Month 1:**
- [ ] Add 1-2 new episodes
- [ ] Expand glossary to 20+ terms
- [ ] Create 2-3 thematic guides
- [ ] Get initial listener feedback

**Month 2-3:**
- [ ] Launch on Patreon with tier structure
- [ ] Start regional folklore content (Sweden next)
- [ ] Expand guides with deeper research
- [ ] Build social media presence

---

## ❓ If You Get Stuck

1. **Hugo questions:** https://gohugo.io/documentation/
2. **Markdown help:** https://www.markdownguide.org/
3. **Git/deployment:** `README.md` in the project
4. **Content structure:** Look at existing episode files as templates
5. **CSS/styling:** Edit `themes/scandinavian-lore/static/css/style.css`

---

## 📦 Project Files

```
/Users/marcus/git/scandinavianlore-web/
├── SETUP_SUMMARY.md          ← Start here for overview
├── README.md                 ← Full technical documentation
├── start-dev.sh              ← Run locally
├── deploy.sh                 ← Deployment helper
├── hugo.toml                 ← Configuration
├── content/                  ← All your content
│   ├── episodes/
│   ├── guides/
│   └── glossary/
└── themes/scandinavian-lore/ ← Custom theme
```

---

**Status:** Ready for launch
**Last Updated:** February 28, 2026
**Next Action:** Install Hugo and run locally
