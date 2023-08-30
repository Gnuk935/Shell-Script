#!/bin/bash
echo "Iniciando a configuração"
EXTRA=/extra/
JAVA=/extra/jdk-11
DUSER=$(whoami)
DIC_SCRIPT=$(pwd)
DOWNLOADS="/home/$DUSER/Downloads"
BASHRC="/home/$DUSER/.bashrc"
SDK="/extra/android/sdk"
ANDROID="extra/android"
STUDIO="/extra/android-studio/bin"
echo "Informe o User que esta nos sudoers"
read SUDO
su -c "sudo mkdir $EXTRA" -s /bin/bash $SUDO
su -c "sudo chown $DUSER:$DUSER $EXTRA" -s /bin/bash $SUDO
ls -lah / | grep ext
if [ $? -eq 0 ]
then
    echo "Pasta criada com sucesso"
    echo "Baixando Java"
    wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz -P $DOWNLOADS
    tar -xvzf $DOWNLOADS/openjdk-11.0.2_linux-x64_bin.tar.gz --remove-files
    mv jdk* $JAVA
    ls $EXTRA | grep jdk
    if [ $? -eq 0 ]
    then
        echo "Iniciando configuração das variaveis de ambiente"
        echo "Executando backup"
        cp $BASHRC $BASHRC.bkp
        if [ $? -eq 0 ]
        then
            echo 'export JAVA_HOME=/extra/jdk-11' >> $BASHRC
            echo 'export PATH=$PATH:$JAVA_HOME/bin' >> $BASHRC
           bash $DIC_SCRIPT/testComandos.sh 1
                if [ $? -eq 0 ]
                then
                    echo "Iniciando a configuração do NVM"
                    echo "Esse gabiarra vai dar bom"
                    cd $EXTRA
                    git clone https://github.com/nvm-sh/nvm.git .nvm
                    cd $DIC_SCRIPT
                    ls -lah | grep .nv
                        if [ $? -eq 0]
                        then
                            cp $BASHRC $BASHRC.bkp2
                            echo "Configurando env do nvm"
                            echo 'export NVM_DIR=/extra/.nvm' >> $BASHRC
                            echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $BASHRC
                            echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> $BASHRC
                            echo "testando NVM"
                            bash $DIC_SCRIPT/testComandos.sh 2
                            if [ $? -eq 0 ]
                            then
                                echo "Iniciando instalação do Node"
                                bash $DIC_SCRIPT/instalarNode.sh
                                if [ $? -eq 0 ]
                                then
                                    cp $BASHRC $BASHRC.bkp3
                                    echo "Iniciando Configuração das Variaveis do Android"
                                    echo 'export ANDROID_HOME=/extra/android/sdk' >> $BASHRC
                                    echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> $BASHRC
                                    echo 'export PATH=$PATH:$ANDROID_HOME/tools' >> $BASHRC
                                    echo 'export PATH=$PATH:$ANDROID_HOME/tools/bin' >> $BASHRC
                                    echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> $BASHRC
                                    echo 'export PATH=$PATH:/extra/android-studio/bin' >> $BASHRC
                                    echo "Configurando pastas do Android"
                                    mdkir $ANDROID
                                    mdkir $SDK
                                    echo "Iniciando instalação do ADB"
                                    su -c "sudo apt install adb" -s /bin/bash $SUDO
                                    echo "Iniciando teste do ADB"
                                    bash $DIC_SCRIPT/testComandos.sh 3
                                    if [ $? -eq 0 ]
                                    then
                                        echo "Iniciando configuração do expo"
                                        bash $DIC_SCRIPT/instalarExpo.sh
                                            if [ $? -eq 0 ]
                                            then
                                                echo "Baixando AndroidStudio"
                                                wget https://r1---sn-oxuf5tcg-2c9l.gvt1.com/edgedl/android/studio/ide-zips/2022.3.1.19/android-studio-2022.3.1.19-linux.tar.gz -P $DOWNLOADS
                                                ls -lah $DOWNLOADS | grep and
                                                if [ $? -eq 0 ]
                                                then
                                                    echo "Iniciando a descompatação do AndroidStudio"
                                                    tar -xvzf $DOWNLOADS/android-studio-2022.3.1.19-linux.tar.gz --remove-files
                                                    mv $DOWNLOADS/android-studio $EXTRA
                                                    bash $STUDIO/studio.sh
                                                    echo "Obg por ultilizar o Script"
                                                    exit 0
                                                else

                                                fi
                                            else 
                                                echo "Erro ao Instalar o expo"
                                                exit 1
                                            fi   
                                    else 
                                        echo "Erro ao testar o ADB"
                                        exit 1
                                    fi
                                else
                                    echo "Node não foi instalado"
                                    exit 1
                                fi
                            else
                                echo "nvm env não foi configurado"
                                exit 1
                            fi
                        else
                            echo "Erro ao baixar o nvm"
                            exit 1
                        fi
                else
                    echo "Erro ao teste o Java"
                    exit 1
                fi
        else
            echo "Erro ao configurar env do Java"
        fi
    else 
        echo "Erro ao efetuar Backup"
        exit 1
    fi
else
    echo "Erro ao instalar Java"
    exit 1
fi