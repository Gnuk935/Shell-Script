#!/bin/bash

# Variável para obter data e hora atuais
LOGFILE=~/Downloads/Log$(date +%Y%m%d%H%M%S).log

# Função para logar a saída no terminal e no arquivo ao mesmo tempo
log() {
    echo "$1" | tee -a "$LOGFILE"
}

# Início do script
log "Configurando Debian para Jogos com Nvidia e AMD"

log "Baixando nova source list"
SOURCE_URL="https://raw.githubusercontent.com/Gnuk935/Shell-Script/main/instala%C3%A7%C3%B5es/old/Source.list"
SOURCE_PATH="/etc/apt/sources.list"
BACKUP_PATH="/etc/apt/sources.list.bak"

log "Fazendo backup da source list atual"
sudo cp "$SOURCE_PATH" "$BACKUP_PATH" 2>&1 | tee -a "$LOGFILE"

log "Baixando nova source list"
sudo wget -O "$SOURCE_PATH" "$SOURCE_URL" 2>&1 | tee -a "$LOGFILE"

log "Atualizando repositórios"
if ! sudo apt update -y 2>&1 | tee -a "$LOGFILE"; then
    log "Erro ao atualizar os repositórios. Restaurando source list anterior."
    sudo cp "$BACKUP_PATH" "$SOURCE_PATH" 2>&1 | tee -a "$LOGFILE"
    log "Saindo do script."
    exit 1
fi

log "Resolvendo questões de arquitetura (32-bit)"
sudo dpkg --add-architecture i386 2>&1 | tee -a "$LOGFILE"
sudo apt update -y 2>&1 | tee -a "$LOGFILE"
sudo apt upgrade -y 2>&1 | tee -a "$LOGFILE"
sudo apt install firmware-misc-nonfree -y 2>&1 | tee -a "$LOGFILE"

log "Instalando drivers para Nvidia"
sudo apt install nvidia-detect -y 2>&1 | tee -a "$LOGFILE"
nvidia-detect 2>&1 | tee -a "$LOGFILE"
sudo apt install nvidia-driver -y 2>&1 | tee -a "$LOGFILE"
sudo apt install nvidia-settings nvidia-vulkan-icd vulkan-tools vulkan-validationlayers -y 2>&1 | tee -a "$LOGFILE"

log "Instalando drivers para AMD"
sudo apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386 -y 2>&1 | tee -a "$LOGFILE"
sudo apt install libvulkan1 libvulkan1:i386 -y 2>&1 | tee -a "$LOGFILE"

log "Configurando bibliotecas SDL2"
sudo apt install fizmo-sdl2 libsdl2-2.0-0 libsdl2-dev libsdl2-gfx-1.0-0 libsdl2-gfx-dev libsdl2-image-2.0-0 libsdl2-mixer-2.0-0 libsdl2-net-2.0-0 -y 2>&1 | tee -a "$LOGFILE"

log "Instalando o Steam"
sudo apt install steam -y 2>&1 | tee -a "$LOGFILE"

log "Configuração do Wine"
sudo apt install wine wine64 wine32 winetricks wine-mono wine_gecko -y 2>&1 | tee -a "$LOGFILE"
sudo apt install vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d gvfs -y 2>&1 | tee -a "$LOGFILE"

log "Instalando pacotes adicionais e Wine 32-bit"
sudo apt install gvfs:i386 wine32-preloader:i386 wine64-preloader wine-binfmt gstreamer1.0-libav:i386 gstreamer1.0-plugins-bad:i386 gstreamer1.0-plugins-ugly winetricks gstreamer1.0-alsa gamemode gamescope timidity opus-tools:i386 libgl1-mesa-glx:i386 -y 2>&1 | tee -a "$LOGFILE"

log "Instalando vkBasalt (filtro de pós-processamento Vulkan)"
sudo apt install meson ninja-build -y 2>&1 | tee -a "$LOGFILE"
git clone https://github.com/DadSchoorse/vkBasalt.git && cd vkBasalt && meson --buildtype=release builddir 2>&1 | tee -a "$LOGFILE"
ninja -C builddir install 2>&1 | tee -a "$LOGFILE"

log "Configurando vkBasalt"
mkdir -p ~/.config/vkBasalt && cp /usr/share/vkBasalt/vkBasalt.conf.example ~/.config/vkBasalt/vkBasalt.conf 2>&1 | tee -a "$LOGFILE"

log "Configurando o Lutris com repositório oficial"
echo "deb [signed-by=/etc/apt/keyrings/lutris.gpg] https://download.opensuse.org/repositories/home:/strycore/Debian_12/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list > /dev/null
wget -q -O- https://download.opensuse.org/repositories/home:/strycore/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/keyrings/lutris.gpg > /dev/null
sudo apt update -y 2>&1 | tee -a "$LOGFILE"
sudo apt install lutris -y 2>&1 | tee -a "$LOGFILE"

log "Instalando plataformas de jogos (ScummVM, DOSBox)"
sudo apt install scummvm dosbox -y 2>&1 | tee -a "$LOGFILE"

log "Instalando dependências adicionais"
sudo apt install ffmpeg libnvidia-encode1 libnvidia-fbc1 nvidia-cuda-toolkit -y 2>&1 | tee -a "$LOGFILE"
sudo apt install mingw-w64 flvmeta smpeg-plaympeg lame mjpegtools x265 x264 nvidia-vdpau-driver mpv mpg123 libxvidcore4 fluidsynth -y 2>&1 | tee -a "$LOGFILE"

log "Melhorando compatibilidade com BTRFS"
sudo apt install btrfs-progs duperemove -y 2>&1 | tee -a "$LOGFILE"

log "Configuração finalizada! Reiniciando o sistema..."
sudo systemctl reboot
