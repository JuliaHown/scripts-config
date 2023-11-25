#!/bin/bash

# Verificar se o usuário já existe
USERNAME="user01"
if id "$USERNAME" &>/dev/null; then
    echo "O usuário $USERNAME já existe."
else
    # Criação de usuário
    sudo adduser "$USERNAME"
    sudo usermod -a-G sudo "$USERNAME"
    su "$USERNAME"
fi
sleep 5


# Atualização e Upgrade
sudo apt update && sudo apt upgrade -y

# Versão do Java a ser instalada
JAVA_VERSION=17.0.6

if [[ $(java -version | grep "$JAVA_VERSION") ]]; then
        echo "Seu Java já está instalado"
    else
        echo "A versão do Java é inferior"
        echo "Deseja atualizar? [s/n]"
        read get

        if [ "$get" == "s" ]; then
            sudo apt install openjdk-${JAVA_VERSION}-jre -y
        else
            echo "Finalizando script..."
        fi
    fi

else
    echo "Java não instalado"
    echo "Deseja instalar o Java versão ${JAVA_VERSION}? [s/n]"
    read get

sleep 5

#Instalação do Maven
sudo apt install maven

sleep 5


# Clonar o repositórios do projeto
echo "Clonando o repositório do Containers"
git clone https://github.com/projeto-yotte/containers.git
cd ./containers/

echo "Clonando o repositório do JAR"
git clone https://github.com/projeto-yotte/yotte-monitoramento.git

# Navegue até o diretório do repositório clonado
cd ./yotte-monitoramento/

# Execute o comando Maven para criar o JAR
mvn clean package

sleep 5

#Configurando permissões
chmod +x docker-config.sh

./docker-config.sh


