# Guia de Configuração

## Primeira Execução

### 1. Copie o arquivo de configuração

```bash
cp config.json.example config.json
```

### 2. Preencha seus dados

Edite `config.json` com suas informações:

```json
{
  "assinatura": {
    "nome": "Ana Silva",
    "apresentacao": "Especialista em presença digital para profissionais de saúde",
    "whatsapp": "5511999999999"
  },
  "prospeccao": {
    "nichos": ["nutricionistas", "psicólogos"],
    "cidade": "São Paulo",
    "leadsPorBusca": 10
  }
}
```

### 3. Configure a hospedagem

Escolha seu provedor em `hosting/` e siga as instruções específicas. Exemplo para Netlify:

```bash
# Instale a CLI da Netlify (opcional, para deploy manual)
npm install -g netlify-cli
```

Depois, configure o provedor no `config.json`:

```json
{
  "hospedagem": {
    "provedor": "netlify",
    "pastaBase": "clientes"
  }
}
```

### 4. (Opcional) Conecte seu Gmail

Para enviar propostas por e-mail, você pode:
- Usar o rascunho manual (copiar o texto gerado pela IA)
- Usar a integração com Gmail (se seu assistente de IA suportar)
- Exportar os dados para sua ferramenta de e-mail preferida

### 5. Pronto!

Agora abra `prompts/1-setup.md` e compartilhe com seu assistente de IA preferido.

---

## Gerenciando Credenciais

⚠️ **Segurança**: Sua senha de hospedagem fica em texto no `config.json` no seu computador. 
Nunca compartilhe este arquivo. Nunca cole a senha diretamente no chat da IA.

### Boas práticas:
- Mantenha `config.json` no `.gitignore`
- Não versionem este arquivo
- Use variáveis de ambiente se possível

---

## Migrando do Prospector de Sites Original

Se você já usa a versão original para Claude:

1. Copie seus dados de `prospector-config.json` para o novo `config.json`
2. Ajuste o provedor de hospedagem (não precisa ser HostGator)
3. Os leads em `leads.md` são compatíveis — mantenha o arquivo
4. As pastas em `sites/[slug]/` são compatíveis — mantenha-as
