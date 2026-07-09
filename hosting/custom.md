# Hospedagem Customizada

## Adicione QUALQUER provedor de hospedagem

Este guia mostra como configurar um provedor de hospedagem que não está listado nos guias existentes.

## Passo a passo

### 1. Identifique o método de deploy disponível

| Método | Exemplos |
|--------|----------|
| **CLI** | Netlify CLI, Vercel CLI, Firebase CLI |
| **FTP/SFTP** | Hospedagem tradicional |
| **API REST** | Cloudflare Pages, DigitalOcean App Platform |
| **Git Push** | GitHub Pages, GitLab Pages |
| **Webhook** | Deploy via integração contínua |
| **Upload Manual** | Painel de controle do provedor |

### 2. Documente no config.json

```json
{
  "hospedagem": {
    "provedor": "custom",
    "pastaBase": "clientes",
    "credenciais": {
      "metodo": "ftp",
      "servidor": "ftp.seusite.com",
      "usuario": "",
      "senha": "",
      "porta": 21,
      "pastaRaiz": "public_html",
      "urlBase": "https://seusite.com"
    }
  }
}
```

### 3. Escreva seu próprio guia

Crie um arquivo `hosting/[seu-provedor].md` seguindo este template:

```markdown
# Deploy no [Nome do Provedor]

## Pré-requisitos
- [Lista de requisitos]

## Credenciais necessárias
- [Lista de credenciais]

## Método de deploy
[Descreva os comandos ou passos]

## Configuração no config.json
[Template JSON]

## Verificação
[Como verificar se o deploy funcionou]
```

## Exemplos de provedores customizáveis

| Provedor | Método | Documentação |
|----------|--------|--------------|
| Cloudflare Pages | CLI/API | api.cloudflare.com |
| Firebase Hosting | CLI/firebase-tools | firebase.google.com |
| Amazon S3 + CloudFront | AWS CLI | aws.amazon.com/s3 |
| DigitalOcean App Platform | API/CLI | digitalocean.com |
| Railway | CLI/Git | railway.app |
| Render | Git/Manual | render.com |
| Heroku | Git/CLI | heroku.com |
| Seu próprio servidor | FTP/SCP | — |

## Dica

Se seu provedor tiver suporte a upload via arrastar-soltar no painel, o método mais simples é:

1. Acessar o painel de controle
2. Navegar até a pasta desejada
3. Fazer upload do `index.html`
4. Confirmar a URL

Isso funciona com praticamente qualquer provedor de hospedagem.
