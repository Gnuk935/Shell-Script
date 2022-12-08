#!bin/bash

 echo "==================BEM VINDO=================="
 echo "Os seguintes programas vão ser instalados:"
 echo "GitHub desktop - Visual Studio Code - SDKMAN - Maven - Java 12 - Gradle - Eclipse - Discord - Google Chrome"
 echo "Por via das duvidas alguns comandos são colocados por segurança"
 echo "============================================="


#Ultilização do sistema
 echo "=================="
 echo "Iniciando processo"
 echo "=================="

 sudo apt-get update -y
 sudo apt-get upgrade -y
 
 echo "===================================="
 echo "Instalando os programas esenciais"
 echo "===================================="
 sudo apt-get install -y wget dpkg git snapd flatpak curl
 flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
 
 echo "========================================="
 echo "Reinicie e o pc e rode novamente o script"
 echo "========================================="

#Programas variados 
 echo "======================================================"
 echo "Iniciando a instalação do programas variados"
 echo " "
 echo "Iniciando a instalação do Google Chrome"
 echo "======================================================"

 flatpak install app/com.google.Chrome/x86_64/stable -y

 echo "===================================="
 echo "Iniciando a intalação do Discord"
 echo "===================================="
 sudo snap install discord

#Programas de desenvolvimento
 echo "======================================================"
 echo "Iniciando instalação dos programas de desenvolvimento"
 echo " "
 echo "Iniciando instalação do VsCode"
 echo "======================================================"
 sudo snap install code --classic
 
 echo "======================================================"
 echo "Iniciando instalação do GitHub Desktop"
 echo "======================================================"
 sudo flatpak install io.github.shiftey.Desktop -y
 
##Instalação do SDKMAN
 
 echo "===================================="
 echo "Iniciando instalação do SDKMAN!"
 echo "===================================="
 curl -s "https://get.sdkman.io" | bash
 source "$HOME/.sdkman/bin/sdkman-init.sh"
 sdk version

##Instalação do java e do gradle com SDKMAN
 
 echo "===================================="
 echo "Iniciando instalação do Java 12"
 echo "===================================="
 sdk install java 12.0.2.hs-adpt

 echo "===================================="
 echo "Iniciando instalação do Gradle"
 echo "===================================="

 sdk install gradle 7.5
 
 echo "===================================="
 echo "Iniciando instalção do Maven"
 echo "===================================="
 sdk install maven

##Instalação do eclipse

 echo "===================================="
 echo "Iniciando instalação do eclipse"
 echo "===================================="
 sudo snap install eclipse --classic

##Instalação do node
 echo "===================================="
 echo "Iniciando instalação do node"
 echo "===================================="
 curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
 nvm install v18.12.1  

 echo "Obrigado por usar este Script, tenha um bom dia!"
 echo "A amizade desenvolve a felicidade e reduz o sofrimento, duplicando a nossa alegria e dividindo a nossa dor. -Joseph Addison"












