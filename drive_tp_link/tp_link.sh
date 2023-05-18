#!/bin/bash
echo "Este scrit faz a instalação do driver da TP-Link"
cd ~/drive
echo "Fazendo o dowload do driver TL-WN821N_V6_Linux"
wget https://static.tp-link.com/2018/201801/20180130/TL-WN821N_V6_Linux.zip
echo "Desconpactando arquivo:"
unzip TL-WN821N_V6_Linux.zip
echo "Verificando a instalação do GCC"
sudo apt install gcc
echo "Acessando diretorio do Drive da TPLink"
cd TL-WN821N_V6_Linux
echo "Copilando o Driver"
sudo make
echo "Instalando o driver:"
sudo make install
echo "Veja se está funcionando"
