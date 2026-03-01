# Scandinavian Lore — Hugo Setup Guide

## Project Structure

```
scandinavianlore-web/
├── hugo.toml                    # Hugo configuration
├── content/
│   ├── episodes/                # Episode pages
│   ├── guides/                  # Thematic guides
│   ├── glossary/                # Pronunciation guide & terms
│   └── about.md                 # About page
├── themes/
│   └── scandinavian-lore/       # Custom theme
│       ├── layouts/             # HTML templates
│       ├── static/css/          # Stylesheets
│       └── static/js/           # JavaScript (if needed)
└── public/                      # Generated site (Hugo builds here)
```

## Local Development

### Prerequisites

- Hugo (extended version recommended)
  ```bash
  # macOS (homebrew)
  brew install hugo
  
  # Verify installation
  hugo version
  ```

### Preview Locally

1. Navigate to the project directory:
   ```bash
   cd /Users/marcus/git/scandinavianlore-web
   ```

2. Start the development server:
   ```bash
   hugo server
   ```

3. Open your browser to `http://localhost:1313`

4. Hugo will watch for file changes and auto-reload. Start writing content and see it update in real-time.

### File Structure for Content

**Episodes:** Create new files in `content/episodes/`
```yaml
---
title: "Episode Title"
date: 2026-03-01
episode: 1
season: 1
runtime: "30 min"
type: episodes
description: "Brief description"
tags: ["tag1", "tag2"]
podcast_player_url: "https://your-host.com/embed/episode-id"
audio_url: "https://your-host.com/audio/episode.mp3"
audio_length: 28800000
---

Your episode content in Markdown...
```

**Podcast player embed (`podcast_player_url`):** When you sign up with a podcast
host (Buzzsprout, Transistor, etc.), each episode gets an embeddable player URL.
Add it to the episode's front matter and an iframe player appears in the hero
section automatically. Leave it out and the hero renders without a player — no
errors. The `audio_url` and `audio_length` (bytes) fields feed the podcast RSS
`<enclosure>` tag for podcast apps; they're also optional until you have a host.

**Guides:** Create new files in `content/guides/`
```yaml
---
title: "Guide Title"
type: guides
category: "Category Name"
related_episodes: ["s01e01-ginnungagap"]
---

Your guide content...
```

**Glossary Terms:** Create new files in `content/glossary/`
```yaml
---
title: "Term Name"
type: glossary
pronunciation: "Pronunciation Guide"
episodes: ["s01e01-ginnungagap"]
related_terms: ["Related Term"]
---

Definition and context...
```

## Deployment to Your Server

### First-Time Setup (SSH + Git)

1. **On your server**, create a bare Git repository:
   ```bash
   mkdir -p ~/repos/scandinavianlore-web.git
   cd ~/repos/scandinavianlore-web.git
   git init --bare
   ```

2. **On your server**, create the web directory and post-receive hook:
   ```bash
   mkdir -p /var/www/scandinavian-lore-pod/public
   
   # Create the post-receive hook
   cat > ~/repos/scandinavianlore-web.git/hooks/post-receive << 'EOF'
   #!/bin/bash
   REPO_DIR="/home/marcus/repos/scandinavianlore-web.git"
   WORK_TREE="/tmp/scandinavianlore-build"
   WEB_ROOT="/var/www/scandinavian-lore-pod/public"
   
   git --work-tree=$WORK_TREE --git-dir=$REPO_DIR checkout -f
   cd $WORK_TREE
   hugo -d $WEB_ROOT
   EOF
   
   # Make it executable
   chmod +x ~/repos/scandinavianlore-web.git/hooks/post-receive
   ```

3. **On your local machine**, add the remote:
   ```bash
   cd /Users/marcus/git/scandinavianlore-web
   git init
   git add .
   git commit -m "Initial commit"
   git remote add production ssh://marcus@your-server.com/home/marcus/repos/scandinavianlore-web.git
   ```

4. **Deploy**:
   ```bash
   git push production master
   ```

### Nginx Configuration

Add this to your nginx config (e.g., `/etc/nginx/sites-available/scandinavianlorepod.com`):

```nginx
server {
    listen 80;
    server_name scandinavianlorepod.com www.scandinavianlorepod.com;
    
    root /var/www/scandinavian-lore-pod/public;
    index index.html;
    
    # Redirect to HTTPS (optional, recommended)
    # return 301 https://$server_name$request_uri;
    
    location / {
        try_files $uri $uri/ =404;
    }
    
    # Cache static assets
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
        expires 30d;
        add_header Cache-Control "public, immutable";
    }
}
```

Then restart nginx:
```bash
sudo systemctl restart nginx
```

## Workflow

1. **Write content** in `content/` directory (Markdown files)
2. **Preview locally** with `hugo server`
3. **Commit & push** to your server:
   ```bash
   git add .
   git commit -m "Describe your changes"
   git push production master
   ```
4. Hugo auto-builds, and nginx serves the updated site

## Content Management

### Adding Episodes

1. Create a new file: `content/episodes/s01e04-title.md`
2. Use the frontmatter template (see File Structure section above)
3. Write your show notes in Markdown
4. Link to glossary terms using filenames: `[Yggdrasil](/glossary/yggdrasil/)`
5. Commit and push

### Adding Glossary Terms

1. Create: `content/glossary/term-name.md`
2. Include pronunciation guide in the `pronunciation` field
3. Tag related episodes
4. Push

### Organizing by Season

Hugo's taxonomies handle this automatically. Add a `season` tag to episodes and guides to group them.

## Customization

### Colors

Edit the CSS variables in `themes/scandinavian-lore/static/css/style.css`:

```css
:root {
  --primary: #3d2817;      /* Dark brown */
  --secondary: #8b6f47;    /* Warm tan */
  --accent: #c4a57b;       /* Light sand */
  --background: #f5f1e8;   /* Cream */
  --text: #2c2416;         /* Dark charcoal */
}
```

### Fonts

Modify `body { font-family: ... }` in the same file.

### Layout

Edit templates in `themes/scandinavian-lore/layouts/`. All use standard Hugo template syntax.

## Troubleshooting

**Hugo not found:** Make sure it's installed (`brew install hugo`)

**Build errors:** Check your Markdown frontmatter—YAML syntax must be exact

**Changes not showing:** Make sure you saved the file and Hugo is watching (`hugo server` refreshes automatically)

**Site looks broken after push:** SSH into your server and check:
```bash
cat ~/repos/scandinavianlore-web.git/hooks/post-receive  # Verify hook exists
ls -la /var/www/scandinavian-lore-pod/public/            # Check build output
```

## Next Steps

1. Test locally: `hugo server`
2. Set up Git and nginx on your server
3. Push your first commit
4. Start writing episodes and guides
5. Link to related content as you expand

---

**Questions?** Review the Hugo documentation at https://gohugo.io or the specific layouts/content structure above.
