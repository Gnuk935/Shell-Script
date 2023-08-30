echo "Iniciando"
nvm install v18.16.0
if [ $? -eq 0 ]
then
    echo "Node instalado com sucesso"
    exit 0
else
    echo "Node não foi instalado"
    exit 1
fi