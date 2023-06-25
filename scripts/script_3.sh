#!/bin/bash

cd /home/$USER/OBL-ISC/deployment/source

carpetas=("adservice" "checkoutservice" "currencyservice" "emailservice" "frontend" "loadgenerator" "paymentservice" "productcatalogservice" "recommendationservice" "shippingservice")

read -p "Ingresa tu nombre de usuario de Docker Hub: " username
read -s -p "Ingresa tu contraseÃ±a de Docker Hub: " password


docker login --username $username --password $password

Recorrer cada carpeta
for carpeta in "${carpetas[@]}"; do

  # Entrar en la carpeta
  cd "$carpeta" 

   echo "prueba creando imagen" $carpeta

   docker build -t $carpeta:v1 .

   docker tag $carpeta:v1 $username/$carpeta:v1

   docker push docker.io/$username/$carpeta:v1

  cd ..

done

   cd /home/$USER/OBL-ISC/deployment/source/cartservice/src

   docker build -t cartservice:v1 .

   docker tag cartservice:v1 $username/cartservice:v1

   docker push docker.io/$username/cartservice:v1