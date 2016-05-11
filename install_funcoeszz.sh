#!/usr/bin/env bash

# ----------------------------------------------------------------------------
# Baixa e instala a última versão das funcoeszz
#
# Uso: ./install_funcoeszz.sh
#
# Autor: @codexico
# Desde: 2016-05-11
# Versão: 0.1
#
# TODO:
#     - perguntar ao user em que diretório deseja deixar o arquivo
# ----------------------------------------------------------------------------

echo "instalando as funcoeszz";

LAST_ZZ_VERSION=$(curl http://funcoeszz.net/v);
LAST_ZZ_URL="http://funcoeszz.net/download/funcoeszz-$LAST_ZZ_VERSION.sh";
curl -L -o funcoeszz $LAST_ZZ_URL

# seria melhor testar a existência dos arquivos ~/.bashrc e ~/.zshrc?
if [ "$SHELL" == "/bin/bash" ]; then
    echo "instalando no bash";
    chmod +x funcoeszz
    mv funcoeszz ~/bin/funcoeszz
    cd ~/bin
    ./funcoeszz zzzz --bashrc
elif [ "$SHELL" == "/usr/bin/zsh" ]; then
    echo "instalando no zsh";
    chmod +x funcoeszz
    mv funcoeszz ~/bin/funcoeszz
    cd ~/bin
    ./funcoeszz zzzz --zshrc
else
    echo "Não sei qual o seu shell!";
    echo "Por favor acesse o FAQ: http://funcoeszz.net/faq.html";
fi
