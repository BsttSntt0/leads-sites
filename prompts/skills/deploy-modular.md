# Skill: Deploy Modular

## Descrição
Use esta skill ao publicar páginas na hospedagem escolhida — upload, criação de pastas por cliente e verificação da URL pública.

## Fluxo Universal

1. **Identifique o provedor** em `config.json` → `hospedagem.provedor`
2. **Consulte o guia específico** em `hosting/[provedor].md`
3. **Prepare os arquivos**: `sites/[slug]/[slug].html`
4. **Publique**: siga o método recomendado para o provedor
5. **Verifique**: confirme HTTP 200 + conteúdo correto na URL pública
6. **Registre**: atualize `leads.md` com status `publicado` + URL

## Estrutura de Destino

Cada cliente em sua própria pasta:
```
/[pastaBase]/[slug]/index.html
```

Exemplo:
```
/clientes/ana-nutri/index.html
https://meusite.com/clientes/ana-nutri/
```

## Métodos de Publicação

### Via CLI (recomendado para provedores com CLI)
```bash
# Exemplo Netlify
netlify deploy --dir=sites/ana-nutri --prod
```

### Via Upload Manual
Se a IA não puder executar comandos, forneça instruções claras:
1. Acessar o painel do provedor
2. Navegar ao diretório correto
3. Fazer upload do arquivo
4. Verificar a URL

### Via API
Se o provedor tiver API, use curl ou SDK:
```bash
curl -X POST -H "Authorization: Bearer $TOKEN" \
  -F "file=@sites/ana-nutri/ana-nutri.html" \
  https://api.provedor.com/deploy
```

## Verificação

Após publicar:
1. Acesse `https://[dominio]/[pastaBase]/[slug]/`
2. Confirme HTTP 200
3. Verifique se o título do cliente aparece
4. Se 404, cheque: caminho, permissões (644 arquivos, 755 pastas)

## Organização

- 1 pasta por cliente, slug em kebab-case sem acentos
- Nunca sobrescrever a pasta de outro cliente
- Página de teste: `/[pastaBase]/teste/index.html`
