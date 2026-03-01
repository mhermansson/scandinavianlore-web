#!/bin/bash
# Quick-start script for Scandinavian Lore Hugo site

echo "🌳 Scandinavian Lore Pod — Hugo Setup"
echo ""

# Check for Hugo
if ! command -v hugo &> /dev/null; then
    echo "❌ Hugo not found. Install it first:"
    echo "   macOS: brew install hugo"
    echo "   Linux: sudo apt-get install hugo (or equivalent)"
    echo "   Windows: choco install hugo-extended"
    exit 1
fi

HUGO_VERSION=$(hugo version)
echo "✅ Hugo found: $HUGO_VERSION"
echo ""

# Start dev server
echo "🚀 Starting Hugo server..."
echo "📱 Open http://localhost:1313 in your browser"
echo "📝 Edit files in content/ and watch the site update in real-time"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

hugo server --buildDrafts
