#!/bin/bash

# Passo 1: Instalação dos pacotes novnc e x11vnc
sudo apt-get install novnc x11vnc

# Passo 2: Iniciar o servidor VNC dentro do ambiente gráfico do Linux
x11vnc -display :0 -autoport -nopwd -bg -xkb -ncache off -quiet -forever &

# Passo 3: Redirecionar a porta 5900 para a porta 80 usando o script launch.sh do novnc
cd /usr/share/novnc/utils/
./launch.sh --listen 80 --vnc localhost:5900
