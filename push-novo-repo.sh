#!/bin/bash
# Script para fazer push no novo repositório

echo "Fazendo push para o novo repositório..."
echo "Repositório: patrickdias2705-alt/mirtis.corretora"

# Verificar se está autenticado
git push novo main --force

if [ $? -ne 0 ]; then
    echo ""
    echo "Erro de autenticação!"
    echo "Por favor, configure suas credenciais do GitHub:"
    echo "1. Acesse: https://github.com/settings/tokens"
    echo "2. Crie um Personal Access Token"
    echo "3. Execute: git remote set-url novo https://SEU_TOKEN@github.com/patrickdias2705-alt/mirtis.corretora.git"
    echo "   ou use: git push https://SEU_TOKEN@github.com/patrickdias2705-alt/mirtis.corretora.git main --force"
fi
