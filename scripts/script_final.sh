#!/bin/bash

# Actualizar la configuración de kubeconfig para el clúster de EKS
aws eks --region us-east-1 update-kubeconfig --name kluster
sleep 3

# Crear los objetos definidos en el archivo manifests.yaml
envsubst < /home/$USER/OBL-ISC/deployment/manifests_replicas.yaml | kubectl apply -f -
sleep 3

#Filtra la columna que tiene el punto de acceso.
echo " "
echo "Enlace al sitio WEB"
sleep 120
kubectl get svc | awk 'NR==8' | awk '{print $4}'