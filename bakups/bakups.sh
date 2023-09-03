#!/usr/bin/bash
# Ola, me chamo Barros, este script serve para fazer backups de pasta espesificas do sistema
# Ele foi o meu priemeiro shell script e sempre que aprendo coisas novas eu busco melhorar ele, fique a vontade para me dar um feedback sobre ele
# meu email é: victorbmcarvalho@proton.me
# Ultima atulização: 03/09/2023

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
VERIFICADOS=()
LISTNAMEZIPS=("test1.zip" "test2.zip" "test3.zip")
LISTNAMEPASTAS=("test1" "test2" "test3")

mkdir -v "$LOGSDIA"
##Direciona a saida:
exec &> >(tee -a $	LOGSDIA/$NOMEARQUIVO.log)

verVariaveis(){
echo "O nome do log é: $LOGSDIA" 
echo "O nome do arquivo é: $NOMEARQUIVO"
echo "Nome dos arquivos a serem zipados: ${LISTNAMEZIPS[@]}"
echo "As pastas a serem zipadas: ${LISTNAMEPASTAS[@]}"
}

criarPastas(){
echo "====================================================="
echo "Criando pasta para colocar os arquivos temporarios"
mkdir -v $AZIP/$NOMEARQUIVO
if [ $? -eq 0 ]
then
	echo "Pasta criada com sucesso"
	echo "====================================================="
	echo "Criando pasta para salvar os hahs"
	mkdir -v $DIRHASH/$NOMEARQUIVO
	if [ $? -eq 0 ]
	then
		echo "Pasta criada com sucesso"
		echo "====================================================="
		echo "Criando a pasta de logs"
		ls $LOGSDIA
		if [ $? -eq 0 ]
		then
			echo "Pasta criada com sucesso"
			echo "====================================================="
			return 0
		else
		echo "Erro ao criar a pasta:"
		echo $LOGSDIA
		return 1
		fi
	else
	echo "Erro ao criar a pasta:"
	echo $DIRHASH/$NOMEARQUIVO
	return 1
	fi
else
	echo "Erro ao criar a pasta:"
	echo $AZIP/$NOMEARQUIVO
	return 1
fi

}

ziparPastas(){
for i in "${!LISTNAMEPASTAS[@]}"
do
	echo "================================================="
	echo "Zipando\ ${LISTNAMEPASTAS[$i]}"
	ZIPNAME=${LISTNAMEZIPS[$i]}
	PASTANAME=${LISTNAMEPASTAS[$i]}
        echo $ZIPNAME
	echo $PASTANAME
	echo $HOME/$PASTANAME
	echo "================================================="
	zip -vr9 $AZIP/$NOMEARQUIVO/$ZIPNAME $HOME/$PASTANAME >> $LOGSDIA/$ZIPNAME.log 2>&1 | sha256sum >> $DIRHASH/$NOMEARQUIVO/$ZIPNAME\.sha256
        echo "Verificando integridade"
	zip -T $AZIP/$NOMEARQUIVO/$ZIPNAME
	if [ $? -eq 0 ]
	then
		echo "Integridade do $ZIPNAME verificiada com sucesso"
		VERIFICADOS+=(0)
	else
		echo "Erro ao zipar o $ZIPNAME"
		VERIFICADOS+=(1)
	fi
done
echo "================================================="
echo "Zipando pasta principal"
zip -vr9 $DIRZIPADOS/$NOMEARQUIVO\.zip $AZIP/$NOMEARQUIVO/ $LOGSDIA/$NOMEARQUIVO.log 2>&1 | sha256sum >> $DIRHASH/$NOMEARQUIVO\.sha256
echo "Verificando integridade da pasta"
zip -T /backups/zipados/$NOMEARQUIVO\.zip
}

verificaZipsArray(){
	echo "================================================="
    echo "Iniciando a verificação dos arquivos"
    for verificado in "${VERIFICADOS[@]}"; do
        echo "Verificando $verificado"
        if [ $verificado -ne 0 ]; then
            echo "Inválido, o backup não foi gerado!"
            echo "================================================="
            return 1
        fi
    done
    echo "Todos os arquivos foram gerados corretamente"
    echo "Backup realizado com sucesso"
    echo "================================================="
    return 0
}


gerarBackup(){
	verVariaveis
	criarPastas
	if [ $? -eq 0 ]
	then
		ziparPastas
		if [ $? -eq 0 ]
		then
			verificaZipsArray
			if [ $? -eq 0 ]
			then
			return 0
			else
			return 1
			fi
		else
		return 1	
		fi
	else
	return 1
	fi

}


mandarEmail(){
	# Como fazer isso? Estudar para conseguir realizar esses testes!
	STATUS=$1
}

main(){
	gerarBackup
	if [ $? -eq 0 ]
	then
	mandarEmail 0
	exit 0
	else
	mandarEmail 1
	exit 1
	fi
}
main