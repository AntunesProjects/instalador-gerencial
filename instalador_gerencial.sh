#!/bin/bash

#Instalação de maquinas gerenciais.
#Criado por Matheus Antunes 13/09/23
ultima_att="14/09/23"

#urls
asinstall="http://192.168.0.29/autosystem/as_install.sh"

#dir
dirConfig=/var/tmp/instalador-gerencial-main/assets/config\ files/ 
dirImgs=/var/tmp/instalador-gerencial-main/assets/imgs/
dirIcons=/var/tmp/instalador-gerencial-main/assets/imgs/icons/
dirAssets=/var/tmp/instalador-gerencial-main/assets/


#FUNÇÕES APPS:
function instApps(){
    
    sudo apt install vim -y;
    sudo apt install cups -y;
    sudo apt install net-tools -y;
    sudo apt install lynx -y;
    sudo apt install dialog -y; 
    sudo apt install sshpass -y;
    sudo apt install ntp -y;
    sudo apt install ntpdate -y;
    sudo apt install ssh * -y;
    sudo apt install htop -y;
}

function services(){
    
    sudo service ntp stop;
    sudo ntpdate br.pool.ntp.org;
    sudo service ntp start;
}

function instAutosystem(){
    sudo curl -O $asinstall;
    sudo chmod 777 as_install.sh;
    sudo ./as_install.sh;
}

function instMerito(){
    sudo curl -O 
}

###INICIO DO SCRIPT###
echo "Iniciando instalador gerecial"
sleep 1
echo "Criado por Matheus Antunes, atualizado dia $ultima_att"
sleep 1
echo "Digite o nome da máquina (gerente, gerenteloja, auxiliar, etc...)"
read maquina
sleep 1
#clear

##atualizado o pc
echo "update"
sleep 1
sudo apt update -y;
clear
echo "update ok"
clear

echo "upgrade"
sleep 1
sudo apt upgrade -y
clear
echo "upgrade ok"
clear

##instalando app
echo "Instalando apps"
    instApps
clear
echo "apps ok"
sleep 1

##serviços
echo "serviços"
    services
clear
echo "serviços ok"
sleep 1

###Instalando autosystem###
echo "Instalando autosystem"
sleep 1
    #instAutosystem
echo "Autosystem ok"
sleep 1
clear

###Instalando merito###
echo "Instalando merito"
sleep 1
    instMerito
echo "Merito ok"
sleep 1
clear

###Movendo Arquivos###
echo "Movendo arquivos"
sleep 1
cd $dirConfig
sudo cp squidCA.der /home/$maquina/
sudo cp sshd_config /etch/ssh/

cd $dirImgs
sudo cp backgroundBuffon /usr/share/xfce4/backdrops/

cd $dirIcons
sudo cp *.desktop /home/$maquina/Área\ de\ Trabalho/

cd $dirAssets
sudo cp user /usr/bin/
sudo chmod 777 user

echo "Mover ok"
sleep 1
clear

echo "Configurar apps"
sleep 1

user