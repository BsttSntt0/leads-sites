#!/bin/bash
# Script de deploy — publica a página de um cliente na hospedagem configurada
# Deploy script — publishes a client page to the configured hosting
# Uso/Usage: bash scripts/deploy.sh [slug] [--prod]

set -e

# Detect language from config.json
LANG="pt"
if command -v python3 &> /dev/null && [ -f "config.json" ]; then
  LANG_DETECT=$(python3 -c "import json;c=json.load(open('config.json'));print(c.get('preferencias',{}).get('idioma','pt'))" 2>/dev/null || echo "pt")
  if [ "$LANG_DETECT" = "en" ]; then LANG="en"; fi
fi

if [ "$LANG" = "en" ]; then
  MSG_USAGE="Usage: bash scripts/deploy.sh [slug] [--prod]"
  MSG_EXAMPLE="Example: bash scripts/deploy.sh ana-nutri --prod"
  MSG_AVAILABLE="Available slugs:"
  MSG_FILE_NOT_FOUND="❌ File not found:"
  MSG_CONFIG_NOT_FOUND="❌ config.json not found. Copy config.json.example to config.json and configure."
  MSG_PYTHON_REQUIRED="❌ Python3 is required. Install it and try again."
  MSG_CLIENT="📦 Client:"
  MSG_FILE="📄 File:"
  MSG_PROVIDER="🏗️  Provider:"
  MSG_BASE_FOLDER="📁 Base folder:"
  MSG_DEPLOYING_NETLIFY="🚀 Deploying via Netlify CLI..."
  MSG_NETLIFY_NOT_FOUND="⚠️  Netlify CLI not found. Install with: npm install -g netlify-cli"
  MSG_MANUAL_NETLIFY="📋 Publish manually:"
  MSG_DEPLOYING_VERCEL="🚀 Deploying via Vercel CLI..."
  MSG_VERCEL_NOT_FOUND="⚠️  Vercel CLI not found. Install with: npm install -g vercel"
  MSG_MANUAL_VERCEL="📋 Publish manually:"
  MSG_FTP_INSTRUCTIONS="📋 Publish via FTP following hosting/$PROVEDOR.md"
  MSG_SUGGESTED_CMD="Suggested command:"
  MSG_GHP_INSTRUCTIONS="📋 Publish via GitHub Pages following hosting/github-pages.md"
  MSG_GHP_SUMMARY="Summary:"
  MSG_NO_SUPPORT="📋 Provider \"$PROVEDOR\" not directly supported by this script."
  MSG_CONSULT="   See hosting/$PROVEDOR.md for instructions."
  MSG_DONE="✅ After publishing, update the status in leads.md to 'published'"
  MSG_EXPECTED_URL="   Expected URL: https://[domain]/$PASTA_BASE/$SLUG/"
  MSG_DEPLOYING_CLOUDFLARE="🚀 Deploying via Wrangler CLI..."
  MSG_CLOUDFLARE_NOT_FOUND="⚠️  Wrangler CLI not found. Install with: npm install -g wrangler"
  MSG_MANUAL_CLOUDFLARE="📋 Publish manually:"
  MSG_DEPLOYING_FIREBASE="🚀 Deploying via Firebase CLI..."
  MSG_FIREBASE_NOT_FOUND="⚠️  Firebase CLI not found. Install with: npm install -g firebase-tools"
  MSG_MANUAL_FIREBASE="📋 Publish manually:"
else
  MSG_USAGE="Uso: bash scripts/deploy.sh [slug] [--prod]"
  MSG_EXAMPLE="Exemplo: bash scripts/deploy.sh ana-nutri --prod"
  MSG_AVAILABLE="Slugs disponíveis:"
  MSG_FILE_NOT_FOUND="❌ Arquivo não encontrado:"
  MSG_CONFIG_NOT_FOUND="❌ config.json não encontrado. Copie config.json.example para config.json e configure."
  MSG_PYTHON_REQUIRED="❌ Python3 é necessário. Instale-o e tente novamente."
  MSG_CLIENT="📦 Cliente:"
  MSG_FILE="📄 Arquivo:"
  MSG_PROVIDER="🏗️  Provedor:"
  MSG_BASE_FOLDER="📁 Pasta base:"
  MSG_DEPLOYING_NETLIFY="🚀 Publicando via Netlify CLI..."
  MSG_NETLIFY_NOT_FOUND="⚠️  Netlify CLI não encontrada. Instale com: npm install -g netlify-cli"
  MSG_MANUAL_NETLIFY="📋 Publique manualmente:"
  MSG_DEPLOYING_VERCEL="🚀 Publicando via Vercel CLI..."
  MSG_VERCEL_NOT_FOUND="⚠️  Vercel CLI não encontrada. Instale com: npm install -g vercel"
  MSG_MANUAL_VERCEL="📋 Publique manualmente:"
  MSG_FTP_INSTRUCTIONS="📋 Publique via FTP seguindo as instruções em hosting/$PROVEDOR.md"
  MSG_SUGGESTED_CMD="Comando sugerido:"
  MSG_GHP_INSTRUCTIONS="📋 Publique via GitHub Pages seguindo hosting/github-pages.md"
  MSG_GHP_SUMMARY="Resumo:"
  MSG_NO_SUPPORT="📋 Provedor \"$PROVEDOR\" não tem suporte direto neste script."
  MSG_CONSULT="   Consulte hosting/$PROVEDOR.md para instruções."
  MSG_DONE="✅ Após publicar, atualize o status em leads.md para 'publicado'"
  MSG_EXPECTED_URL="   URL esperada: https://[dominio]/$PASTA_BASE/$SLUG/"
  MSG_DEPLOYING_CLOUDFLARE="🚀 Publicando via Wrangler CLI..."
  MSG_CLOUDFLARE_NOT_FOUND="⚠️  Wrangler CLI não encontrada. Instale com: npm install -g wrangler"
  MSG_MANUAL_CLOUDFLARE="📋 Publique manualmente:"
  MSG_DEPLOYING_FIREBASE="🚀 Publicando via Firebase CLI..."
  MSG_FIREBASE_NOT_FOUND="⚠️  Firebase CLI não encontrada. Instale com: npm install -g firebase-tools"
  MSG_MANUAL_FIREBASE="📋 Publique manualmente:"
fi

if [ -z "$1" ]; then
  echo "$MSG_USAGE"
  echo "$MSG_EXAMPLE"
  echo ""
  echo "$MSG_AVAILABLE"
  ls -d sites/*/ 2>/dev/null | sed 's|sites/||' | sed 's|/||'
  exit 1
fi

SLUG="$1"
FLAG_PROD=false
if [ "$2" = "--prod" ]; then FLAG_PROD=true; fi

FILE="sites/$SLUG/$SLUG.html"

if [ ! -f "$FILE" ]; then
  echo "$MSG_FILE_NOT_FOUND $FILE"
  exit 1
fi

if [ ! -f "config.json" ]; then
  echo "$MSG_CONFIG_NOT_FOUND"
  exit 1
fi

if ! command -v python3 &> /dev/null; then
  echo "$MSG_PYTHON_REQUIRED"
  exit 1
fi

PROVEDOR=$(python3 -c "import json;c=json.load(open('config.json'));print(c['hospedagem']['provedor'])")
PASTA_BASE=$(python3 -c "import json;c=json.load(open('config.json'));print(c['hospedagem']['pastaBase'])")

echo "$MSG_CLIENT $SLUG"
echo "$MSG_FILE $FILE"
echo "$MSG_PROVIDER $PROVEDOR"
echo "$MSG_BASE_FOLDER $PASTA_BASE"
echo ""

case "$PROVEDOR" in
  netlify)
    echo "$MSG_DEPLOYING_NETLIFY"
    if ! command -v netlify &> /dev/null; then
      echo "$MSG_NETLIFY_NOT_FOUND"
      echo ""
      echo "$MSG_MANUAL_NETLIFY"
      echo "   1. Access app.netlify.com"
      echo "   2. Drag the sites/$SLUG/ folder to deploy"
      echo "   3. URL: https://[app].netlify.app/$PASTA_BASE/$SLUG/"
      exit 0
    fi
    if [ "$FLAG_PROD" = true ]; then
      netlify deploy --dir="sites/$SLUG" --prod
    else
      netlify deploy --dir="sites/$SLUG"
    fi
    ;;

  vercel)
    echo "$MSG_DEPLOYING_VERCEL"
    if ! command -v vercel &> /dev/null; then
      echo "$MSG_VERCEL_NOT_FOUND"
      echo ""
      echo "$MSG_MANUAL_VERCEL"
      echo "   1. Access vercel.com"
      echo "   2. Import the sites/$SLUG/ directory"
      exit 0
    fi
    cd "sites/$SLUG" && vercel ${FLAG_PROD:+--prod} && cd - > /dev/null
    ;;

  cloudflare-pages)
    echo "$MSG_DEPLOYING_CLOUDFLARE"
    if ! command -v wrangler &> /dev/null; then
      echo "$MSG_CLOUDFLARE_NOT_FOUND"
      echo ""
      echo "$MSG_MANUAL_CLOUDFLARE"
      echo "   1. Access dash.cloudflare.com → Pages"
      echo "   2. Click 'Create a project' → 'Direct Upload'"
      echo "   3. Upload sites/$SLUG/"
      exit 0
    fi
    wrangler pages deploy "sites/$SLUG" --project-name="$SLUG"
    ;;

  firebase-hosting)
    echo "$MSG_DEPLOYING_FIREBASE"
    if ! command -v firebase &> /dev/null; then
      echo "$MSG_FIREBASE_NOT_FOUND"
      echo ""
      echo "$MSG_MANUAL_FIREBASE"
      echo "   1. Access console.firebase.google.com"
      echo "   2. Go to Hosting section"
      echo "   3. Upload sites/$SLUG/"
      exit 0
    fi
    echo "{\"hosting\":{\"public\":\"sites/$SLUG\",\"ignore\":[\"firebase.json\"]}}" > firebase.json
    firebase deploy --only hosting
    rm firebase.json
    ;;

  railway)
    echo "📋 Deploy via Railway: railway.com"
    echo "   Upload the sites/$SLUG/ folder in the dashboard."
    ;;

  render)
    echo "📋 Deploy via Render: render.com"
    echo "   Create a Static Site and set publish directory to sites/$SLUG/"
    ;;

  ftp|hostgator)
    echo "$MSG_FTP_INSTRUCTIONS"
    echo ""
    echo "$MSG_SUGGESTED_CMD"
    echo "  curl -sS --ftp-create-dirs -T \"$FILE\" \\"
    echo "    \"ftp://YOUR_SERVER/public_html/$PASTA_BASE/$SLUG/index.html\" \\"
    echo "    --user \"USER:PASSWORD\""
    ;;

  github-pages)
    echo "$MSG_GHP_INSTRUCTIONS"
    echo ""
    echo "$MSG_GHP_SUMMARY"
    echo "   1. Copy sites/$SLUG/ to your GitHub repo"
    echo "   2. URL: https://[user].github.io/[repo]/$PASTA_BASE/$SLUG/"
    ;;

  *)
    echo "$MSG_NO_SUPPORT"
    echo "$MSG_CONSULT"
    ;;
esac

echo ""
echo "$MSG_DONE"
echo "$MSG_EXPECTED_URL"
