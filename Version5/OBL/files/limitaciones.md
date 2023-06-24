# Revision de limitantes
* Se nos han presentado desafíos durante el proyecto

Debido al tiempo de comprensión de los fundamentos, no fue posible lograr una solución más ambiciosa o por fuera del ambito academico basarse en la realidad o simplemente en despliegues de conocidas figuras en el mundo del Cloud Computing esto fue debido al LabRole.

* Funcionamiento de otros proveedores como Docker y Kubectl 

Elementos clave para desarrollar el trabajo con un mayor nivel de parametrización y personalización de los microservicios en ejecución. <br>
Nos habría permitido las mejores prácticas que ofrece Docker para el proceso de construcción, etiquetado y envío de imágenes a un repositorio personal.

Kubectl, es posible conectarse al clúster sin necesidad de hacerlo a través del equipo bastión o local, lo que simplifica considerablemente la ejecución de comandos porque es posible utilizar HCL para dicho cometido.<br>
Sin embargo, fue necesario extraer los datos de los recursos con data para usarlos como input en otros recursos.<br>
No se encontraron fuentes con el nivel de claridad didáctica que se necesitaba, ya que siempre se hacia referencia a los modulos de HashiCorp, que simplifican el trabajo pero el LabRole genera Crash con ciertos Resources.

* Con los modulos de Hashicorp era mas sencillo crear mas recursos y entender su comunicacion con la GUI, para mejorar las practicas en seguridad, entre nodos, externa publicaciones y demas.

Surgieron problematicas en el tratamiento de las variables locales, globales y en el intercambio de esos datos, por eso algunas componentes manejan Hardcode.

* Manifiestos de Kubernetes
Es importante tener en cuenta que no es adecuado tener un documento con tantas líneas. 
1. Conflictos de personalización, archivo grande dificil manejo
2. No es amigable con la escalabilidad, lo que dificulta su mantenimiento a medida que el proyecto crece o tiene cambios redundantes o de requisitos. 
3. Es algo tedioso leer y comprender los recursos de ese YAML.
4. Se dejo por defecto dos Bases de datos Redis, eso nos hace perder la sesion de conexion depende por donde se genere la primer Query, esto fue debido al cambio introducido por los Replica Set de ciertos componentes usando el mismo manifiesto.

### Lecciones
Es fundamental buscar un enfoque más modular y escalable al diseñar los manifiestos , los archivos pequeños y mas específicos basados en cada tipo de servicio, nos permiten identificar cual es el comportamiento de cada container.