echo "Configurando o vulkan"
#sudo apt-get install libvulkan-dev vulkan-tools vulkan-validationlayers >> log
#sudo apt-get install fizmo-sdl2 libsdl2-2.0-0 libsdl2-dev libsdl2-gfx-1.0-0 libsdl2-gfx-dev libsdl2-image-2.0-0 libsdl2-mixer-2.0-0 libsdl2-net-2.0-0 >> log

echo "Iniciando a configuração de games"
sudo apt-get install steam >> ~/logHoje
 
echo "Instalando o Wine"
udo apt-get install wine winetricks wine-mono wine_gecko vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d gvfs >> ~/logHoje

echo "Iniciando a instalção do Lutris"
#sudo apt-get install lutris python-magic >> log

echo "Instalando dependencias adicionais"
sudo apt-get install gvfs:i386 wine32-preloader:i386 wine64-preloader wine-binfmt gstreamer1.0-libav:i386 gstreamer1.0-plugins-bad:i386 gstreamer1.0-plugins-ugly winetricks >> ~/logHoje

echo "Ferramenta para melhoria do OBS"
#sudo apt-get instalar ffmpeg libnvidia-encode1 libnvidia-fbc1 nvidia-cuda-toolkit >> log

echo "Dependencias adiconais para wine e codecs"
sudo apt-get install mingw-w64 flvmeta smpeg-plaympeg lame mjpegtools x265 x264 nvidia-vdpau-driver mpv mpg123 libxvidcore4 fluidsynth >> ~/logHoje

echo "Melhorando compa com btrfs"
#sudo apt-get install btrfs-progs duperemove >> log
