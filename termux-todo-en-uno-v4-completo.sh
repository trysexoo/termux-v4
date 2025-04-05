#!/data/data/com.termux/files/usr/bin/bash

echo -e "\n======================"
echo -e "  TODO EN UNO V4 - TERMUX"
echo -e "======================\n"

# [0] Verificar si tiene root
echo "[0] Verificando acceso root..."
if [ "$(id -u)" -eq 0 ]; then
  echo ">> Acceso root detectado."
  HAS_ROOT=true
else
  echo ">> No tienes root. Se instalarán herramientas compatibles."
  HAS_ROOT=false
fi

# [1] Actualizar sistema y repositorios
echo -e "\n[1] Actualizando paquetes y habilitando repositorios..."
pkg update -y && pkg upgrade -y
pkg install -y x11-repo unstable-repo root-repo tur-repo

# [2] Instalar paquetes esenciales
echo -e "\n[2] Instalando herramientas básicas..."
pkg install -y git curl wget nano vim neofetch htop tree tsu proot tar zip unzip figlet toilet cowsay ruby python python2 python3 php perl nodejs golang rust clang make cmake openssh termux-api

# [3] Instalar lolcat
echo -e "\n[3] Instalando lolcat..."
gem install lolcat

# [4] Herramientas de hacking desde GitHub
echo -e "\n[4] Clonando herramientas de hacking en ~/HERRAMIENTAS..."
mkdir -p ~/HERRAMIENTAS && cd ~/HERRAMIENTAS

# Clonar solo si no existen
git clone https://github.com/sqlmapproject/sqlmap
git clone https://github.com/noob-hackers/hydra
git clone https://github.com/Tuhinshubhra/RED_HAWK
git clone https://github.com/htr-tech/zphisher
git clone https://github.com/DarkSecDevelopers/HiddenEye
git clone https://github.com/Gameye98/Lazymux
git clone https://github.com/1N3/IntruderPayloads
git clone https://github.com/techchipnet/CamPhish
git clone https://github.com/Bhai4You/Termux-Banner
git clone https://github.com/threat9/routersploit
git clone https://github.com/vanhauser-thc/thc-hydra
git clone https://github.com/Hax4us/Metasploit_termux

# [5] Instalar Metasploit sin root
echo -e "\n[5] Instalando Metasploit Framework..."
cd ~/HERRAMIENTAS/Metasploit_termux
chmod +x metasploit.sh
./metasploit.sh

# [6] Instalar Tor y Anonsurf
echo -e "\n[6] Instalando Tor y Anonsurf..."
pkg install tor -y
pip install anonsurf

# [7] Instalar ngrok
echo -e "\n[7] Instalando ngrok..."
cd ~
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
unzip ngrok-stable-linux-arm.zip
chmod +x ngrok && mv ngrok $PREFIX/bin

# [8] Instalar entornos Linux si no hay root
if [ "$HAS_ROOT" = false ]; then
  echo -e "\n[8] Instalando entornos Linux (Kali y Ubuntu) sin root..."
  cd ~
  pkg install -y wget proot
  wget https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Kali/kali.sh
  bash kali.sh
  wget https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Ubuntu/ubuntu.sh
  bash ubuntu.sh
fi

# [9] Configuración final
echo -e "\n[9] Todo listo. Inicia Termux con estilo:"
echo "neofetch | lolcat"
echo -e "\nPuedes explorar las herramientas en ~/HERRAMIENTAS"

