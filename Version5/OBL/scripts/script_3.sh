#!/bin/bash

cd /home/ubuntu/OBL-ISC/Version5/OBL/deployment/source

carpetas=("adservice" "checkoutservice" "currencyservice" "emailservice" "frontend" "loadgenerator" "paymentservice" "productcatalogservice" "recommendationservice" "shippingservice")

read -p "Ingresa tu nombre de usuario de Docker Hub: " username
read -s -p "Ingresa tu contraseña de Docker Hub: " password

export DOCKER_USERNAME=$username
export DOCKER_PASSWORD=$password

docker login --username $DOCKER_USERNAME --password $DOCKER_PASSWORD

Recorrer cada carpeta
for carpeta in "${carpetas[@]}"; do

  # Entrar en la carpeta
  cd "$carpeta" 

   echo "prueba creando imagen" $carpeta

   docker build -t $carpeta:v1 .

   docker tag $carpeta:v1 $DOCKER_USERNAME/$carpeta:v1

   docker push docker.io/$DOCKER_USERNAME/$carpeta:v1

  cd ..

done

   cd /home/ubuntu/OBL-ISC/Version5/OBL/deployment/source/cartservice/src

   docker build -t cartservice:v1 .

   docker tag cartservice:v1 $DOCKER_USERNAME/cartservice:v1

   docker push docker.io/$DOCKER_USERNAME/cartservice:v1