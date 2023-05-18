#!/bin/bash
echo "Nesse scripr vai ser instalada a versão 4.3.1.1 do DWA-131"
echo "Criando pasta e navegando ate ela"
mkdir ~/drive && cd ~/drive
echo "Puxando ZIP da net"
wget http://files.dlink.com.au/products/DWA-131/REV_E/Drivers/DWA-131_E1_Linux_v4.3.1.1/DWA-131_Linux_v4.3.1.1.zip
echo "atulizando repo's"
sudo apt update
echo "instalando alguns pacotes:"
sudo apt install git linux-headers-generic build-essential dkms
echo "Clonado repo rtl8192eu-linux-driver"
git clone https://github.com/Mange/rtl8192eu-linux-driver
echo "Entrando no repositorio"
cd rtl8192eu-linux-driver/
echo "ADD driver ao DKMS"
sudo dkms add .
echo "copilando e instalando:"
sudo dkms install rtl8192eu/1.0
echo "Jogando o driver RTL8XXXU na black list:"
echo "blacklist rtl8xxxu" | sudo tee /etc/modprobe.d/rtl8xxxu.conf
echo "Forçando o driver ficar ativo na inicilização:"
echo -e "8192eu\n\nloop" | sudo tee /etc/modules
echo "Atualizando as mudanças nos grub e no initramfs"
sudo update-grub; sudo update-initramfs -u
echo "Reiniciando o sistema:"
systemctl reboot -i#!/bin/bash
echo "Nesse scripr vai ser instalada a versão 4.3.1.1 do DWA-131"
echo "Criando pasta e navegando ate ela"
mkdir ~/drive && cd ~/drive
echo "Puxando ZIP da net"
wget http://files.dlink.com.au/products/DWA-131/REV_E/Drivers/DWA-131_E1_Linux_v4.3.1.1/DWA-131_Linux_v4.3.1.1.zip
echo "atulizando repo's"
sudo apt update
echo "instalando alguns pacotes:"
sudo apt install git linux-headers-generic build-essential dkms
echo "Clonado repo rtl8192eu-linux-driver"
git clone https://github.com/Mange/rtl8192eu-linux-driver
echo "Entrando no repositorio"
cd rtl8192eu-linux-driver/
echo "ADD driver ao DKMS"
sudo dkms add .
echo "copilando e instalando:"
sudo dkms install rtl8192eu/1.0
echo "Jogando o driver RTL8XXXU na black list:"
echo "blacklist rtl8xxxu" | sudo tee /etc/modprobe.d/rtl8xxxu.conf
echo "Forçando o driver ficar ativo na inicilização:"
echo -e "8192eu\n\nloop" | sudo tee /etc/modules
echo "Atualizando as mudanças nos grub e no initramfs"
sudo update-grub; sudo update-initramfs -u
echo "Reiniciando o sistema:"
systemctl reboot -i
