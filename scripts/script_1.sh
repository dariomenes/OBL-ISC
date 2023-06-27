#!/bin/bash

# Actualizar los paquetes existentes
sudo apt update

# Instalar dependencias para permitir que apt utilice repositorios a través de HTTPS
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Agregar la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Agregar el repositorio de Docker al sistema
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar los paquetes nuevamente (con el nuevo repositorio de Docker)
sudo apt update

# Instalar Docker Engine
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Agregar el usuario actual al grupo "docker" para ejecutar comandos de Docker sin sudo
sudo usermod -aG docker $USER

# Configurar Docker para iniciar automáticamente en el arranque del sistema
sudo systemctl enable docker.service

# Verificar la versión de Docker instalada
docker --version

sudo apt-get update 

## Instalacion GitHub ##

sudo apt install git
git config --global color.ui true
git config --global color.status auto
git config --global color.branch auto
git config --global color.editor auto

## instalacion de CLI AWS ##

sudo apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

## instalacion Terraform

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update
sudo apt-get install terraform

## instalacion Kubernetes 
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


## Instalacion de ENVSUBST
sudo apt install gettext -y

## Reiniciar el equipo ##

sudo reboot