#!/bin/bash


# Iniciando o script de instalação e configuração do Docker
echo "Iniciando instalação e configuração do Docker..."

# Instalação do Docker
sudo apt update && sudo apt upgrade –y
sudo apt install docker.io 

sleep 5

# Verificar se o Docker foi instalado corretamente
docker --version

sleep 5

# Adiciona o usuário ao grupo do Docker (para evitar a necessidade de sudo)
sudo usermod -aG docker $USER

sleep 5

# Inicia o serviço do Docker
sudo systemctl start docker

# Habilitar o serviço do Docker
sudo systemctl enable docker

sleep 5

# Fazer pull da imagem do MySQL 5.7
sudo docker pull mysql:latest

# Criando container e configurando o MySQL
sudo docker run -d -p 3306:3306 --name yotte-container -e "MYSQL_DATABASE=yotte" -e "MYSQL_ROOT_PASSWORD=yotte2023" mysql:5.7

# Mensagem de confirmação da instalação e configuração do Docker
echo "Docker foi instalado e configurado com sucesso. O Docker está pronto para uso!"

sleep 5

sudo docker exec -i yotte-container mysql -u root -pyotte2023 < /home/ubuntu/containers/script.sql;

sleep 5
fi