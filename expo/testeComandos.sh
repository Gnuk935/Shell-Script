echo "Testando configuração"
KEY=$1
if [ $KEY -eq 1 ]
then
    echo "Testando Java"
    java --version
    exit 0
else
    echo "Erro ao testar o Java"
    exit 1
fi

if [ $KEY -eq 2 ]
then
    echo "Testando NVM"
    nvm -v
    exit 0
else
    echo "Erro ao testar o NVM"
    exit 1
fi

if [ $KEY -eq 3 ]
then
    echo "Testando ADB"
    adb --version
    exit 0
else
    echo "Erro ao testar o ADB"
    exit 1
fi