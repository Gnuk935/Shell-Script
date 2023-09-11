#!/usr/bin/bash
RECEBIDO=$1
ESPACO="==========================================================================="
TEMP=/tmp/instalacao
TMPGERAL=$TEMP/geral.txt
PUSER=$(whoami)
DOWNLOADS="/home/$USER/Downloads"
echo $PUSER
mkdir -p $TEMP 
padrao(){
echo $ESPACO
echo "Os seguintes pwrogramas vão ser instalados:"
echo "wget dpkg git flatpak curl"
echo "O seu sistema também sera atualizado"
sudo apt-get update
if [ $? -eq 0 ]
then
	sudo apt-get upgrade
	if [ $? -eq 0 ]
	then
		sudo apt install -y wget dpkg git snapd flatpak curl
		if [ $? -eq 0 ]
		then
			flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
			if [ $? -eq 0 ]
			then
			echo $ESPACO
			echo "Todos os programas foram instalados corretamente"
			return 0
			else
			echo "O repositorio de flatpak não foi adicionado"
			return 0
			fi
		else
		echo $ESPACO
		echo "Erro ao istanlar os novos programas"
		return 1
		fi
	else
	echo $ESPACO
	echo "Erro ao instalar atualizações"
	return 1
	fi
else
echo $ESPACO
echo "Erro ao atulizar repositorios"
return 1
fi
}

comum(){
echo $ESPACO
echo "TIPO DE INSTALAÇÃO:"
echo "COMUM"
echo $ESPACO
	chrome(){
	NAMETMP="chrome.txt"
	TMPSDKMAN=$TEMP/$NAMETMP
	ARQUIVO="google-chrome-stable_current_amd64.deb"
	touch $TMPCHROME
	echo "Iniciando a instalação do Google Chrome"
	echo $ESPACO
	LINK_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
	ls $DOWNLOADS | grep chrome
	if [ $? -ne 0 ]
	then
		wget -P $DOWNLOADS $LINK_CHROME
		if [ $? -eq 0 ]
		then
			echo "Goole Chrome baixado com sucesso"
			echo "0" >> $TMPCHROME
		else
		echo "Erro do baixar o Goole Chrome"
		echo "1" >> $TMPCHROME
		return 1
		fi
	else
	echo "O google chrome já foi baixado"
	echo "Seguindo para instalação"
	echo "0" >> $TMPCHROME
	fi

	STATS_CHROME=$(sed -n '1p' $TMPCHROME)
	if [ $STATS_CHROME -eq 0 ]
	then
		dpkg -i $DOWNLOADS/$ARQUIVO
		if [ $? -eq 0 ]
		then
			echo "Google Chrome instalado com sucesso"
			echo "0" >> $TMPCHROME
			return 0
		else
		echo "Erro ao instalar o Google Chrome"
		echo "1" >> $TMPCHROME
		return 1
		fi
	else
	echo "Erro ao verificar se o chrome esta baixado!!"
	echo "ERR: GC11"
	fi
	}

	obs(){
		NAMETMP="obs.txt"
		TMPOBS=$TEMP/$NAMETMP
		echo $ESPACO
		echo "Iniciando o processo do Obs-studio"
		echo $ESPACO
		echo "Verificando a instalação"
		dpkg -l | grep obs-studio
		if [ $? -ne 0 ]
		then
			echo "Iniciando o processo de instalação do Obs Studio"
			sudo apt-get install obs-studio -y
			if [ $? -eq 0 ]
			then
				echo "O Obs Studio foi instalado corretamente"
				echo "0" >> $TMPOBS
				return 0
			else
			echo "O Obs Studio não foi instalado"
			echo "1" >> $TMPOBS
			fi
		else
		echo "O	programa já esta instalado"
		echo "0" >> $TMPOBS
		return 0
		fi 
	}

	mousepad(){
		NAMETMP="mousepad.txt"
		TMPMOS=$TEMP/$NAMETMP
		echo $ESPACO
		echo "Iniciando o processo do mousepad"
		echo $ESPACO
		echo "Verificando a instalação"
		dpkg -l | grep mousepad | grep simple
		if [ $? -ne 0 ]
		then
			echo "Iniciando o processo de instalação do Mousepad"
			sudo apt-get install mousepad -y
			if [ $? -eq 0 ]
			then
				echo "O Mousepad foi instalado corretamente"
				echo "0" >> $TMPMOS
				return 0
			else
			echo "O Mousepad não foi instalado"
			echo "1" >> $TMPMOS
			fi
		else
		echo "O	programa já esta instalado"
		echo "0" >> $TMPMOS
		return 0
		fi
	}

	discord(){
	NAMETMP="discord.txt"
	TMPDISCORD=$TEMP/$NAMETMP
	ARQUIVO="discord-0.0.29.deb"
	touch $TMPDISCORD
	echo "Iniciando a instalação do Google Chrome"
	echo $ESPACO
	LINK_DISCORD="https://dl.discordapp.net/apps/linux/0.0.29/discord-0.0.29.deb"
	ls $DOWNLOADS | grep discord
	if [ $? -ne 0 ]
	then
		wget -P $DOWNLOADS $LINK_CHROME
		if [ $? -eq 0 ]
		then
			echo "Discord baixado com sucesso"
			echo "0" >> $TMPDISCORD
		else
		echo "Erro do baixar o Discord"
		echo "1" >> $TMPDISCORD
		return 1
		fi
	else
	echo "O Discord já foi baixado"
	echo "Seguindo para instalação"
	echo "0" >> $TMPDISCORD
	fi

	STATS_DISCORD=$(sed -n '1p' $TMPDISCORD)
	if [ $STATS_DISCORD -eq 0 ]
	then
		dpkg -i $DOWNLOADS/$ARQUIVO
		if [ $? -eq 0 ]
		then
			echo "Discord instalado com sucesso"
			echo "0" >> $TMPDISCORD
			return 0
		else
		echo "Erro ao instalar o Discord"
		echo "1" >> $TMPDISCORD
		return 1
		fi
	else
	echo "Erro ao verificar se o Discord esta baixado!!"
	echo "ERR: DC11"
	fi	
	}

	main(){
		echo $ESPACO
		echo "Bem vindo, sua instalação esta sendo iniciada!"
		echo "Obrigado por estar ultilizando esse script"
		echo $ESPACO
		echo "Iniciando um verificação geral dos programas"
		dpkg -l | grep google-chrome
		if [ $? -eq 0 ]
		then
			echo "O Google Chorome já foi instalado!" 
		else
			chrome
			if [ $? -eq 0 ]
			then
				echo "0" >> $TMPGERAL		
			else
				echo "1" >> $TMPGERAL
			fi
		fi

		dpkg -l | grep obs-studio
		if [ $? -eq 0 ]
		then
			echo "O OBS já foi instalado!" 
		else
			obs
			if [ $? -eq 0 ]
			then
				echo "0" >> $TMPGERAL		
			else
				echo "1" >> $TMPGERAL
			fi
		fi

		dpkg -l | grep mousepad | grep simple
		if [ $? -eq 0 ]
		then
			echo "O mousepad já foi instalado!" 
		else
			mousepad
			if [ $? -eq 0 ]
			then
				echo "0" >> $TMPGERAL		
			else
				echo "1" >> $TMPGERAL
			fi
		fi
	
		dpkg -l | grep discord
		if [ $? -eq 0 ]
		then
			echo "O Discord já foi instalado!" 
		else
			discord
			if [ $? -eq 0 ]
			then
				echo "0" >> $TMPGERAL		
			else
				echo "1" >> $TMPGERAL
			fi
		fi
	}
main
}

desenvolvedor(){
echo $ESPACO
echo "TIPO DE INSTALAÇÃO:"
echo "Desenvolvedor"
echo $ESPACO
	sdkMan(){
	NAMETMP="sdkman.txt"
	TMPSDKMAN=$TEMP/$NAMETMP
	touch $TMPSDKMAN
	echo "Iniciando a instalação do Sdkman"
	echo $ESPACO
	LINK_SDKMAN="https://get.sdkman.io"
	ls $HOME | grep .sdkman
	if [ $? -ne 0 ]
	then
		echo "Fazendo download do Sdkman"
		curl -s $LINK_SDKMAN | bash
		if [ $? -eq 0 ]
		then
			echo "SDKMAN foi baixado com sucesso"
			echo "0" >> $TMPSDKMAN
		else
		echo "Erro do baixar o SDKMAN"
		echo "1" >> $TMPSDKMAN
		return 1
		fi
	else
	echo "O sdkman já foi baixado"
	echo "Seguindo para instalação"
	echo "0" >> $TMPSDKMAN
	fi
	
	STATS_SDKMAN=$(sed -n '1p' $TMPSDKMAN)
	if [ $STATS_SDKMAN -eq 0 ]
	then
		source "$HOME/.sdkman/bin/sdkman-init.sh"
		if [ $? -eq 0 ]
		then
			echo "0" >> $TMPSDKMAN
			source $HOME/.bashrc
			sdk version
			if [ $? -eq - 0 ]
			then
			echo "SDKMAN foi instalado com sucesso"
			echo "0" >> $TMPSDKMAN
			return 0
			else
			echo "Erro ao instalar o SDKMAN (source)"
			echo "1" >> $TMPSDKMAN
			return 1
			fi
		else
		echo "Erro ao instalar o SDKMAN (source)"
		echo "1" >> $TMPSDKMAN
		return 1
		fi
	else
	echo "Erro ao verificar se o SDKMAN esta baixado!!"
	echo "ERR: SD11"
	fi
	}

	java(){
	source $HOME/.bashrc
	echo $ESPACO
	NAMETMP="java.txt"
	TMPJAVA=$TEMP/$NAMETMP
	touch $TMPJAVA
	echo "Iniciando a instalação do Java"
	echo $ESPACO
	sdk version
	if [ $? -eq 0 ]
	then
		echo "0" >> $TMPJAVA
		echo "O java 12 será instalado"
		sdk install java 12.0.2.hs-adpt
		if [ $? -eq 0 ]
		then
			source $BASHRC
			java --version
			if [ $? -eq 0 ]
			then
				echo "O Java foi instalado com sucesso"
				echo "0" >> $TMPJAVA
				return 0
			else
			echo "O java não foi instalado"
			echo "1" >> $TMPJAVA
			fi
		else
		echo "Erroo oa instalar o java"
		echo "1" >> $TMPJAVA
		return 1
		fi
	else
	echo "Erro ao verificar o sdkman"
	echo "1" >> $TMPJAVA
	return 1
	fi
	}
}

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
	comum
	if [ $? -eq 0 ]
	then
		echo $ESPACO
		echo "Tudo foi instalado corretamente"
		echo "Obrigado por usar este script!"
		echo "Apressa-te a viver bem e pensa que cada dia é, por si só, uma vida."
		echo "Sêneca"
		echo $ESPACO 
	else
		echo "Deu erro em algo e não tratei esse erro, se vira! E perdão :("
		echo "Você pode abir uma issue"
		echo "Acesse: https://github.com/Gnuk935/Shell-Script/issues"
	fi
elif [ $RECEBIDO -eq 4 ]
then
	echo $ESPACO
	echo "Instalção completa"
else
	echo "Not OK"
fi
}
recebeValores
