# Obligatorio - 2023 - Infraestructura en Soluciones Cloud
# Docente Mauricio Amendola
### Alumnos
* Federico Gonzalez - 245993
* Heber Dario Meneses - 257370

## Presentacion del obligatorio
Una empresa busca migrar su infraestructura on-premise al cloud, se entrega un diagramas de como es la estructura previa para verificar las necesidades. <br>
![](./files/images/obl2023.png)

# Resumen de la solución
La solución propuesta se basa en el uso de servicios de la nube y se apoya en los principios de Infraestructura como Código (IaC). Se emplean diversas herramientas con el fin de lograr un despliegue rápido y eficiente del sitio web, migrando así los servicios previamente propuestos.

En primera instancia, se hace uso de dos módulos personalizados para crear una estructura básica que albergará los servicios necesarios. Estos recursos incluyen una VPC (Virtual Private Cloud), subredes, tabla de enrutamiento y un internet gateway. Estos componentes son fundamentales para establecer una infraestructura sólida.

Posteriormente, se procede al despliegue de los servicios previamente mencionados. Para ello, se prepara un entorno local o una máquina virtual en AWS. En este entorno se instalan los servicios necesarios para llevar a cabo las acciones requeridas. Se crea un clúster de Kubernetes, el cual se configura con restricciones de comunicación entre los componentes internos del clúster y la comunicación externa.

Este enfoque permite automatizar el despliegue de la infraestructura y facilita la gestión y escalabilidad de los servicios en la nube. Al utilizar IaC, se logra una mayor eficiencia y agilidad en la implementación y administración de la infraestructura, lo que resulta beneficioso para el despliegue exitoso del sitio web.
## Diagrama de AWS
***
![DiagramaAWS](./files/images/diagramaAWS.jpg)
## Estructura de directorios
***
[Estructura-Backend](files/backend.md) <br>
[Main-Principal](files/main.md) <br>
[Modulo-Infra](files/infra.md) <br>
[Modulo-Red](files/red.md)

## Prerequisitos
***
Es necesario tener una cuenta en DockerHub.

## Como ejecutar la solucion
***

1. Descargar el repositorio en algun sistema (Ubuntu en este caso)
2. Ejecutar los scripts de aprovisionamiento de script_1 al script_3.(Si las imagenes estan en un repositorio, no es necesario el script_2)
3. Verificar la instalacion de AWS CLI, Terraform, Docker y Kubectl
4. Ejecutar el backend (Modificar el momento de llamar al recurso backend sin tener el bucket y dynamodb previamente creado.)
5. Ejecutar en el directorio raiz del git, terraform init
6. terraform apply -var-name=terraform.tfvars.
7. Ejecutar el script_final.sh

## Demostracion de funcionamiento
***
[Demostracion](https://www.youtube.com/watch?v=IhmfQYJdJBE) <br>
[Presentacion](https://fi365-my.sharepoint.com/:p:/g/personal/hm257370_fi365_ort_edu_uy/EWbkKtbj-O5MihIILExPc4IBuPoejrjusEU3kiHcT8u8rw?e=12LV67) <br>

## Anexo
***
[revision](files/limitaciones.md) <br>
