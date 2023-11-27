#!/bin/bash

# Instalação do servidor VNC (se não estiver instalado)
sudo apt-get update
sudo apt-get install -y tightvncserver

# Inicia o servidor VNC
vncserver

# Obtém o endereço IP local usando curl ifconfig.me
local_ip=$(curl -s ifconfig.me)

# Obtém a porta do servidor VNC
vnc_port=$(ss -lnt | grep -Eo ':\d+' | awk '{print $1}' | cut -c 2- | grep '^59')

# Exibe o comando para se conectar ao servidor VNC
echo "Use o seguinte comando no seu dispositivo VNC Viewer:"
echo "xtigervncviewer -SecurityTypes VncAuth -passwd /tmp/tigervnc*/passwd :1"
echo "Substitua :1 pelo número do display apropriado, e insira a senha quando solicitado."
echo ""
echo "O endereço IP local do servidor é: $local_ip"
echo "O servidor VNC está rodando na porta: $vnc_port"
