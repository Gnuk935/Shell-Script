echo "Iniciando a instalação do Expo"
npx expo --version
if [ $? -eq 0 ]
then
    echo "Expo instalado com sucesso"
    exit 0
else
    echo "Expo não foi instalado"
    exit 1
fi
