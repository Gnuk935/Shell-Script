RECEBIDO=$1
ESPACO="==========================================================================="
recebeValores(){
if [ $RECEBIDO -eq 1 ]
then
	echo $ESPACO
	echo "Instalação de desenvolvedor selecionada, iniciando o processo"
elif [ $RECEBIDO -eq 2 ]
then
	echo $ESPACO
	echo "Instação para Jogador selecionada, iniciando o processo"
elif [ $RECEBIDO -eq 3 ]
then
	echo $ESPACO
	echo "Instalação comum selecionada, iniciando o processo"
elif [ $RECEBIDO -eq 4 ]
then
	echo $ESPACO
	echo "Instalção completa"
else
	echo "Not OK"
fi
}
recebeValores
