validarDistro(){
# Como validar qual é a distro? Como fazer essa validação?
echo "Olá, em qual distro voce deseja fazer a instalação?"
echo " 1 - Debian (e derivados) "
echo " 2 - Arch "
echo " 3 - outra "
read DISTRONAME
if [ $DISTRONAME -eq 1 ]
then
	echo "Você escolheu Debian, esse script esta escrito para versão"
       	echo "Debian 12 - Bookworm"	 
	echo "Que tipo de instalação você deseja?"
	echo " 1 - Desenvolvedor "
	echo " 2 - Jogador "
	echo " 3 - Comum "
        echo " 4 - Completa "
	read OPCAO	
	bash ./debian.sh $OPCAO
elif [ $DISTRONAME -eq 2 ]
then
	echo "Voce escolheu Arch, voce tem certeza disso? ... "

else
	echo "Me envie um email com a distro que voce deseja!"
	echo "gnuk935@proton.me"
fi
}
validarDistro
