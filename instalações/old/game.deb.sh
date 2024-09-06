#!/bin/bash

# Variável para obter data e hora atuais
LOGFILE=~/Downloads/Log$(date +%Y%m%d%H%M%S).log

# Função para logar a saída no terminal e no arquivo ao mesmo tempo
log() {
    echo "$1" | tee -a "$LOGFILE"
}

# Início do script
log "Configurando Debian para Jogos"

log "Resolvendo questões de arquitetura"
sudo dpkg --add-architecture i386 2>&1 | tee -a "$LOGFILE"
sudo apt update -y 2>&1 | tee -a "$LOGFILE"
sudo apt upgrade -y 2>&1 | tee -a "$LOGFILE"
sudo apt install firmware-misc-nonfree -y 2>&1 | tee -a "$LOGFILE"

log "Configuração para Intel"
sudo apt install intel-microcode -y 2>&1 | tee -a "$LOGFILE"

log "Instalando drivers Vulkan para Intel com gráficos integrados"
sudo apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386 -y 2>&1 | tee -a "$LOGFILE"

log "Configuração do Wine"
sudo apt install wine wine64 wine32 -y 2>&1 | tee -a "$LOGFILE"

log "Configurando bibliotecas SDL2"
sudo apt install fizmo-sdl2 libsdl2-2.0-0 libsdl2-dev libsdl2-gfx-1.0-0 libsdl2-gfx-dev libsdl2-image-2.0-0 libsdl2-mixer-2.0-0 libsdl2-net-2.0-0 -y 2>&1 | tee -a "$LOGFILE"

log "Instalando pacotes adicionais e Wine 32-bit"
sudo apt install gvfs:i386 wine32-preloader:i386 wine64-preloader wine-binfmt gstreamer1.0-libav:i386 gstreamer1.0-plugins-bad:i386 gstreamer1.0-plugins-ugly winetricks gstreamer1.0-alsa gamemode gamescope timidity opus-tools:i386 libgl1-mesa-glx:i386 -y 2>&1 | tee -a "$LOGFILE"

log "Instalando vkBasalt (filtro de pós-processamento Vulkan)"
sudo apt install meson ninja-build -y 2>&1 | tee -a "$LOGFILE"
git clone https://github.com/DadSchoorse/vkBasalt.git && cd vkBasalt && meson --buildtype=release builddir 2>&1 | tee -a "$LOGFILE"
ninja -C builddir install 2>&1 | tee -a "$LOGFILE"

log "Configurando vkBasalt"
mkdir -p ~/.config/vkBasalt && cp /usr/share/vkBasalt/vkBasalt.conf.example ~/.config/vkBasalt/vkBasalt.conf 2>&1 | tee -a "$LOGFILE"

log "Instalando plataformas de jogos (Steam, Lutris, ScummVM, DOSBox)"
sudo apt install steam lutris scummvm dosbox -y 2>&1 | tee -a "$LOGFILE"

log "Configuração finalizada!"
