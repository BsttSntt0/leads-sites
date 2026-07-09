#!/bin/bash
# Script interativo para criar config.json / Interactive config creator

echo "🔧 Prospector Universal — Configuração Inicial / Initial Setup"
echo "============================================================="
echo ""

LANG=""
echo "Select language / Selecione o idioma:"
echo "1) Português"
echo "2) English"
read -r LANG_OPTION
case $LANG_OPTION in
  2) LANG="en" ;;
  *) LANG="pt" ;;
esac

if [ "$LANG" = "en" ]; then
  echo ""
  echo "--- Signature ---"
  echo -n "Your full name: "; read -r NOME
  echo -n "Your presentation (e.g., High-conversion page designer): "; read -r APRESENTACAO
  echo -n "Your WhatsApp (5511999999999): "; read -r WHATSAPP

  echo ""
  echo "--- Prospecting ---"
  echo -n "Niches (comma separated, e.g., nutritionists,psychologists): "; read -r NICHOS_INPUT
  echo -n "Default city: "; read -r CIDADE
  echo -n "Leads per search (10): "; read -r LEADS
  LEADS=${LEADS:-10}

  echo ""
  echo "--- Hosting ---"
  echo "Providers:"
  echo "1) Netlify (recommended)  2) Vercel  3) GitHub Pages"
  echo "4) HostGator  5) FTP  6) Cloudflare Pages"
  echo "7) Railway  8) Firebase  9) Render  10) Custom"
  echo -n "Choice (1-10): "; read -r PROVEDOR_OPCAO
  FORMATO_DATA="MM/DD/YYYY"
  MOEDA="USD"
else
  echo ""
  echo "--- Assinatura ---"
  echo -n "Seu nome completo: "; read -r NOME
  echo -n "Sua apresentação (ex.: Designer de páginas de alta conversão): "; read -r APRESENTACAO
  echo -n "Seu WhatsApp (5511999999999): "; read -r WHATSAPP

  echo ""
  echo "--- Prospecção ---"
  echo -n "Nichos (separados por vírgula, ex.: nutricionistas,psicólogos): "; read -r NICHOS_INPUT
  echo -n "Cidade padrão: "; read -r CIDADE
  echo -n "Leads por busca (10): "; read -r LEADS
  LEADS=${LEADS:-10}

  echo ""
  echo "--- Hospedagem ---"
  echo "Provedores disponíveis:"
  echo "1) Netlify  2) Vercel  3) GitHub Pages  4) HostGator"
  echo "5) FTP  6) Cloudflare Pages  7) Railway"
  echo "8) Firebase Hosting  9) Render  10) Customizado"
  echo -n "Escolha (1-10): "; read -r PROVEDOR_OPCAO
  FORMATO_DATA="DD/MM/AAAA"
  MOEDA="BRL"
fi

IFS=',' read -ra NICHOS_ARRAY <<< "$NICHOS_INPUT"
NICHOS_JSON="["
FIRST=true
for NICHO in "${NICHOS_ARRAY[@]}"; do
  NICHO=$(echo "$NICHO" | xargs)
  if [ "$FIRST" = true ]; then
    NICHOS_JSON="$NICHOS_JSON\"$NICHO\""
    FIRST=false
  else
    NICHOS_JSON="$NICHOS_JSON,\"$NICHO\""
  fi
done
NICHOS_JSON="$NICHOS_JSON]"

case $PROVEDOR_OPCAO in
  1) PROVEDOR="netlify" ;; 2) PROVEDOR="vercel" ;;
  3) PROVEDOR="github-pages" ;; 4) PROVEDOR="hostgator" ;;
  5) PROVEDOR="ftp" ;; 6) PROVEDOR="cloudflare-pages" ;;
  7) PROVEDOR="railway" ;; 8) PROVEDOR="firebase-hosting" ;;
  9) PROVEDOR="render" ;; *) PROVEDOR="netlify" ;;
esac

echo -n "$([ "$LANG" = "en" ] && echo 'Base folder on server (clients): ' || echo 'Pasta base no servidor (clientes): ')"
read -r PASTA_BASE
PASTA_BASE=${PASTA_BASE:-clients}

cat > config.json << EOF
{
  "assinatura": {
    "nome": "$NOME",
    "apresentacao": "$APRESENTACAO",
    "whatsapp": "$WHATSAPP"
  },
  "prospeccao": {
    "nichos": $NICHOS_JSON,
    "cidade": "$CIDADE",
    "leadsPorBusca": $LEADS,
    "notaMinima": 4.7,
    "avaliacoesMinimas": 40
  },
  "envio": {
    "modo": "draft"
  },
  "hospedagem": {
    "provedor": "$PROVEDOR",
    "pastaBase": "$PASTA_BASE",
    "credenciais": {}
  },
  "preferencias": {
    "idioma": "$LANG",
    "formatoData": "$FORMATO_DATA",
    "moeda": "$MOEDA"
  }
}
EOF

echo ""
if [ "$LANG" = "en" ]; then
  echo "✅ config.json created successfully!"
  echo ""
  echo "📋 Summary:"
  echo "  Name: $NOME"
  echo "  Niches: $NICHOS_INPUT"
  echo "  City: $CIDADE"
  echo "  Leads/search: $LEADS"
  echo "  Hosting: $PROVEDOR"
  echo "  Base folder: $PASTA_BASE"
  echo ""
  echo "▶️  Edit manually to add hosting credentials if needed."
  echo "▶️  See hosting/$PROVEDOR.md for detailed instructions."
else
  echo "✅ config.json criado com sucesso!"
  echo ""
  echo "📋 Resumo:"
  echo "  Nome: $NOME"
  echo "  Nichos: $NICHOS_INPUT"
  echo "  Cidade: $CIDADE"
  echo "  Leads/busca: $LEADS"
  echo "  Hospedagem: $PROVEDOR"
  echo "  Pasta base: $PASTA_BASE"
  echo ""
  echo "▶️  Edite manualmente para adicionar credenciais de hospedagem, se necessário."
  echo "▶️  Consulte hosting/$PROVEDOR.md para instruções detalhadas."
fi
