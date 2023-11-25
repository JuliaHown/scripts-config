#!/bin/bash

# Configurações do Docker

# Atualiza a lista de pacotes
sudo apt update 

# Instalação do Docker
sudo apt install -y docker.io

# Adiciona o usuário atual ao grupo docker para executar comandos docker sem sudo
sudo usermod -aG docker $USER

# Reinicia o serviço do Docker para aplicar as alterações
sudo systemctl restart docker

echo "Docker foi instalado e configurado com sucesso. Por favor, faça logout e login novamente para aplicar as alterações do grupo Docker."

sleep 5

#Instalando o Docker.io
chmod +x docker-setup.sh

./docker-setup.sh