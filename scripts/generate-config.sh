#!/bin/bash
# Gera config.json via formulário interativo no navegador
# Generates config.json via interactive browser form
#
# Uso/Usage: bash scripts/generate-config.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HTML_FILE="$SCRIPT_DIR/generate-config.html"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "🚀 Abrindo configurador no navegador..."
echo "   Opening configurator in browser..."
echo ""
echo "📋 Instruções / Instructions:"
echo "   PT: Preencha o formulário e clique em 'Baixar config.json'"
echo "   EN: Fill out the form and click 'Download config.json'"
echo ""
echo "📁 O arquivo será salvo como: $PROJECT_DIR/config.json"
echo "   The file will be saved as: $PROJECT_DIR/config.json"
echo ""

case "$OSTYPE" in
  darwin*)
    open "$HTML_FILE" 2>/dev/null
    ;;
  linux*)
    if command -v xdg-open &> /dev/null; then
      xdg-open "$HTML_FILE" 2>/dev/null
    elif command -v gnome-open &> /dev/null; then
      gnome-open "$HTML_FILE" 2>/dev/null
    else
      echo "❌ No browser opener found. Please open manually:"
      echo "   file://$HTML_FILE"
      exit 1
    fi
    ;;
  msys*|cygwin*|mingw*)
    # Windows Git Bash / Cygwin / MSYS2
    HTML_WIN="$(echo "$HTML_FILE" | sed 's|^/\([a-zA-Z]\)/|\1:/|' | sed 's|/|\\|g')"
    cmd //c start "" "$HTML_WIN" 2>/dev/null
    ;;
  *)
    echo "⚠️  Unknown OS. Please open manually:"
    echo "   file://$HTML_FILE"
    exit 1
    ;;
esac

if [ $? -ne 0 ]; then
  echo "❌ Could not open browser. Please open manually:"
  echo "   file://$HTML_FILE"
fi
