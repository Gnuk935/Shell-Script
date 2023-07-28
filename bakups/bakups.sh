#!bin/bash
echo "Iniciando processo de backups"
dia=$(date +%d)
mes=$(date +%m)
ano=$(date +%Y)
nomeArquivo=$(echo $ano\-$mes\-$dia)
echo "O nomo do arquivo é:\ $nomeArquivo"
mkdir /backups/aZipar/$nomeArquivo
echo "Criando array com os nomes de arquivos zip"
listNameZips=("teste1.zip" "teste2.zip" "teste3.zip")
echo "Array gerado:\ ${listNameZips[@]}"
echo "====================================="
echo "Criando array com os nomes das pastas"
listNamePastas=("teste1" "teste2" "teste3")
echo "Array gerado:\ ${listNamePastas[@]}"
touch /backups/hahs/$nomeArquivo
for i in "${!listNamePastas[@]}"
do
	echo "=============================="
	echo "Zipando\ ${listNamePastas[$i]}"
	zipName=${listNameZips[$i]}
	pastaName=${listNamePastas[$i]}
        echo $zipName
	echo $pastaName
	echo "============================="
	zip -r9 /backups/aZipar/$nomeArquivo/$zipName $pastaName | sha256sum >> /backups/hahs/$zipName\.sha256
        echo "Verificando integridade"
        zip -T /backups/aZipar/$nomeArquivo/$zipName
done
echo "================================================="
echo "Zipando pasta principal"
zip -r9 /backups/zipados/$nomeArquivo\.zip /backups/aZipar/$nomeArquivo/ | sha256sum >> /backups/hahs/$nomeArquivo\.sha256
echo "Verificando integridade da pasta"
zip -T /backups/zipados/$nomeArquivo\.zip
rm -r /backups/aZipar/$nomeArquivo/
