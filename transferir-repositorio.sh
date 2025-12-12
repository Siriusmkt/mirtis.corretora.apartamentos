#!/bin/bash

# Script para transferir o repositório para o novo GitHub
# Execute este script após configurar suas credenciais do GitHub

echo "🚀 Transferindo repositório para https://github.com/patrickdias2705-alt/mirtis.corretora.git"
echo ""

# Verificar se está no diretório correto
if [ ! -f "package.json" ]; then
    echo "❌ Erro: Execute este script na raiz do projeto"
    exit 1
fi

# Verificar se há mudanças não commitadas
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️  Há mudanças não commitadas. Fazendo commit..."
    git add -A
    git commit -m "Preparar transferência para novo repositório"
fi

# Fazer push para o novo repositório
echo "📤 Fazendo push para o novo repositório..."
echo ""
echo "⚠️  IMPORTANTE: Se pedir credenciais, use seu token de acesso pessoal do GitHub"
echo "   Você pode criar um em: https://github.com/settings/tokens"
echo ""

# Tentar push
git push novo main --force || {
    echo ""
    echo "❌ Erro ao fazer push. Tente uma das opções abaixo:"
    echo ""
    echo "Opção 1 - Usar token na URL:"
    echo "  git remote set-url novo https://SEU_TOKEN@github.com/patrickdias2705-alt/mirtis.corretora.git"
    echo "  git push novo main --force"
    echo ""
    echo "Opção 2 - Usar SSH (se configurado):"
    echo "  git remote set-url novo git@github.com:patrickdias2705-alt/mirtis.corretora.git"
    echo "  git push novo main --force"
    echo ""
    echo "Opção 3 - Fazer manualmente no GitHub:"
    echo "  1. Acesse https://github.com/patrickdias2705-alt/mirtis.corretora"
    echo "  2. Vá em Settings > General > Scroll até 'Danger Zone'"
    echo "  3. Clique em 'Transfer ownership' ou faça upload dos arquivos manualmente"
    exit 1
}

echo ""
echo "✅ Repositório transferido com sucesso!"
echo "🌐 Novo repositório: https://github.com/patrickdias2705-alt/mirtis.corretora"
