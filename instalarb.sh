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

 echo "===================================="
 echo "Iniciando a intalação do Mousepad"
 echo "===================================="
 sudo apt-get install mousepad

 echo "Obrigado por usar este Script, tenha um bom dia!"
 echo "A amizade desenvolve a felicidade e reduz o sofrimento, duplicando a nossa alegria e dividindo a nossa dor. -Joseph Addison"












