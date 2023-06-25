#!/bin/bash

# Solicitar al usuario ingresar las variables
read -p "Ingresa el valor de AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
read -p "Ingresa el valor de AWS_SECRET_ACCESS_KEY: " AWS_SECRET_ACCESS_KEY
read -p "Ingresa el valor de AWS_SESSION_TOKEN: " AWS_SESSION_TOKEN

# Configurar las variables en el cliente de AWS

aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
aws configure set region us-east-1
aws configure set aws_session_token "$AWS_SESSION_TOKEN"

echo "Configuracion completada correctamente."