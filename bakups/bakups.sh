#!/usr/bin/bash
echo "Iniciando processo de backups"
USER=$(whoami)
HOME=/home/$USER
DIA=$(date +%d)
MES=$(date +%m)
ANO=$(date +%Y)
LOGS=/var/log/teste
NOMEARQUIVO=$(echo $ANO\-$MES\-$DIA)
LOGSDIA=$LOGS/$NOMEARQUIVO
AZIP=/teste/testeAzip
DIRHASH=/teste/hashs
DIRZIPADOS=/teste/zipados
echo "O nome do log é:\ $LOGSDIA"
echo "O nome do arquivo é:\ $NOMEARQUIVO"
mkdir -v $AZIP/$NOMEARQUIVO
echo "Criando array com os nomes de arquivos zip"
LISTNAMEZIPS=("test1.zip" "test2.zip" "test3.zip")
echo "Array gerado:\ ${LISTNAMEZIPS[@]}"
echo "====================================="
echo "Criando array com os nomes das pastas"
LISTNAMEPASTAS=("test1" "test2" "test3")
echo "Array gerado:\ ${LISTNAMEPASTAS[@]}"
mkdir -v /backups/hahs/$NOMEARQUIVO
mkdir -v "$LOGSDIA"
for i in "${!LISTNAMEPASTAS[@]}"
do
	echo "=============================="
	echo "Zipando\ ${LISTNAMEPASTAS[$i]}"
	ZIPNAME=${LISTNAMEZIPS[$i]}
	PASTANAME=${LISTNAMEPASTAS[$i]}
        echo $ZIPNAME
	echo $PASTANAME
	echo $HOME/$PASTANAME
	echo "============================="
	zip -vr9 $AZIP/$NOMEARQUIVO/$ZIPNAME $HOME/$PASTANAME >> $LOGSDIA/$NOMEARQUIVO.log 2>&1 | sha256sum >> $DIRHASH/$NOMEARQUIVO/$ZIPNAME\.sha256
        echo "Verificando integridade"
        zip -T $AZIP/$NOMEARQUIVO/$ZIPNAME
done
echo "================================================="
echo "Zipando pasta principal"
zip -vr9 $DIRZIPADOS/$NOMEARQUIVO\.zip $AZIP/$NOMEARQUIVO/ $LOGSDIA/$NOMEARQUIVO.log 2>&1 | sha256sum >> $DIRHASH/$NOMEARQUIVO\.sha256
echo "Verificando integridade da pasta"
zip -T /backups/zipados/$NOMEARQUIVO\.zip
#rm -r /backups/aZipar/$NOMEARQUIVO/

