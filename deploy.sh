#!/bin/bash
# DEPLOYMENT INSTRUCTIONS FOR SCANDINAVIAN LORE
# Follow these steps once to set up your server for auto-deployment

# ============================================================
# STEP 1: Server Setup (run these ON your server via SSH)
# ============================================================

# 1a. Create a bare Git repository:
# ssh marcus@your-server.com
# mkdir -p ~/repos/scandinavianlore-web.git
# cd ~/repos/scandinavianlore-web.git
# git init --bare

# 1b. Create the web root directory:
# mkdir -p /var/www/scandinavian-lore-pod/public

# 1c. Create the post-receive hook to auto-build with Hugo:
# 
# cat > ~/repos/scandinavianlore-web.git/hooks/post-receive << 'EOF'
# #!/bin/bash
# REPO_DIR="/home/marcus/repos/scandinavianlore-web.git"
# WORK_TREE="/tmp/scandinavianlore-build"
# WEB_ROOT="/var/www/scandinavian-lore-pod/public"
# 
# git --work-tree=$WORK_TREE --git-dir=$REPO_DIR checkout -f
# cd $WORK_TREE
# hugo -d $WEB_ROOT
# EOF
#
# chmod +x ~/repos/scandinavianlore-web.git/hooks/post-receive

# 1d. Configure nginx (edit /etc/nginx/sites-available/scandinavianlorepod.com):
#
# server {
#     listen 80;
#     server_name scandinavianlorepod.com www.scandinavianlorepod.com;
#     
#     root /var/www/scandinavian-lore-pod/public;
#     index index.html;
#     
#     location / {
#         try_files $uri $uri/ =404;
#     }
# }
#
# Then: sudo systemctl restart nginx

# ============================================================
# STEP 2: Local Setup (run these on YOUR MACHINE)
# ============================================================

echo "Setting up Git for deployment..."

# Initialize Git in the project (only do this once!)
cd /Users/marcus/git/scandinavianlore-web

if [ ! -d .git ]; then
    git init
    echo "✅ Git repository initialized"
fi

# Add your server as a remote (replace with your actual server details)
if ! git remote | grep -q production; then
    # EDIT THIS LINE with your server username and hostname
    git remote add production ssh://marcus@your-server.com/home/marcus/repos/scandinavianlore-web.git
    echo "✅ Production remote added"
else
    echo "✅ Production remote already configured"
fi

# ============================================================
# STEP 3: Deploy
# ============================================================

# Make sure everything is committed:
git add .
git commit -m "Add Scandinavian Lore site content" || echo "(No changes to commit)"

# Push to your server:
echo "Deploying to production..."
git push production master

echo ""
echo "✅ Deployment complete!"
echo "🌍 Check your site at: https://scandinavianlorepod.com"
echo ""
echo "Next time you make changes, just run:"
echo "  git add ."
echo "  git commit -m 'Your message'"
echo "  git push production master"
