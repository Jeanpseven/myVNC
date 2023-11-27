#!/bin/bash

# Instalação do servidor VNC (se não estiver instalado)
sudo apt-get update
sudo apt-get install -y tightvncserver

# Inicia o servidor VNC
vncserver

# Obtém o endereço IP local
local_ip=$(ip a | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1' | head -n 1)

# Exibe o comando para se conectar ao servidor VNC
echo "Use o seguinte comando no seu dispositivo VNC Viewer:"
echo "xtigervncviewer -SecurityTypes VncAuth -passwd /tmp/tigervnc*/passwd :1"
echo "Substitua :1 pelo número do display apropriado, e insira a senha quando solicitado."
echo ""
echo "O endereço IP local do servidor é: $local_ip"
