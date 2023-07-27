#!bin/bash
echo "Iniciando processo de backups"
dia=$(date +%d)
mes=$(date +%m)
ano=$(date +%Y)
nomeArquivo=$($ano\-$mes\-$dia)
echo "Criando array com os nomes de arquivos zip"
listNameZips=("teste1.zip" "teste2.zip" "teste3.zip")
echo "Array gerado:\ ${listNameZips[@]}"
echo "Criando array com os nomes das pastas"
listNamePastas=("teste1" "teste2" "teste3")
echo "Array gerado:\ ${listNamePastas[@]}"
for i in "${!listNamePastas[@]}"
do
	echo "Zipando\ ${listNamePastas[$i]}"
	zipName=${listNameZips[$i]}
	pastaName=${listNamePastas[$i]}
        echo $zipName
	echo $pastaName
	zip -r9 $zipName $pastaName | sha256sum >> hashs
        echo "Verificando integridade"
        zip -T $zipName
done
