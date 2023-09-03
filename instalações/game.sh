echo "NÃO USE ESSE SCRIPT!! AINDA EM DEV!!"
exit
echo "Configura o Arch para games:"
#COLOCAR UM IF PARA SABER SE AMD OU NVIDIA
# POR HORA ESSE SCRIPT VERIFICA PARA NVIDIA
echo "Instalando a Steam"
sudo pacman -Syu steam


echo "Instalando o Wine"
sudo pacman -Syu wine winetricks wine-mono wine_gecko vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d gvfs

echo "Iniciando instalação do GameMod"
sudo pacman -Syu lib32-gamemode
pacman -Syu gamemode

echo "Criando grupo para o gamemod"
groupadd -r gamemode
# Criar uma var pegando o nome do usuario 
sudo usermod -a barros -G gamemode
echo "ADD na ultima linha a conf para alterar os limites de segurança:"
echo "@gamemode       -       nice    10" >> /etc/security/limits.conf
echo "Testando config"
gamemoded -t
echo "!!! ATENÇÃO !!!"
echo "Antes de jogar rode:"
echo "gamemoderun ./[jogo]"
echo "Ou add na steam:"
echo "gamemoderun %command%"
echo "!!! 2º SOLUÇÃO:"
echo "Configure a extensão GameMod no GNOME"
#por hr é tratado como GNOME
echo "Iniciando instalação do gamemod"
cd ~/Dowloads
git clone https://github.com/gicmo/gamemode-extension.git
cd gamemode-extension 
sudo pacman -Syu meson ninja jq
./make-zip.sh 
./make-zip.sh install
echo "Ative a extensão"
# colocar ms de confirmação
echo "Iniciando a instalção do Lutris"
sudo pacman -Syu lutris python-magic

echo "Por hora é só"
