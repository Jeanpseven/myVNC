#!/bin/bash

# Atualiza a lista de pacotes e instala o Apache
sudo apt-get update
sudo apt-get install -y apache2

# Configuração do ambiente gráfico (LXDE) e servidor VNC
sudo apt-get install -y lxde tightvncserver

# Inicia o servidor VNC
vncserver

# Obtém o endereço IP local usando curl ifconfig.me
local_ip=$(curl -s ifconfig.me)

# Obtém a porta do servidor VNC a partir do arquivo de log
vnc_port=$(cat ~/.vnc/*:1.log | grep -oP '(?<=localhost:)\d+')

# Configura o Apache para redirecionar para o servidor VNC
sudo tee /etc/apache2/sites-available/000-default.conf <<EOF
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined

    RedirectMatch ^/$ http://$local_ip:$vnc_port/
</VirtualHost>
EOF

# Reinicia o Apache para aplicar as configurações
sudo service apache2 restart

# Exibe informações para o usuário
echo "Acesse o ambiente gráfico pela web em: http://$local_ip/"
echo "Use o seguinte comando no seu dispositivo VNC Viewer:"
echo "xtigervncviewer -SecurityTypes VncAuth -passwd /tmp/tigervnc*/passwd :1"
echo "Substitua :1 pelo número do display apropriado, e insira a senha quando solicitado."
