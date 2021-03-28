# portainer-cluster

## Instalación a través de script
Este repositorio alberga archivos de configuración para desplegar un cluster básico de docker con una instalación de portainer.

El cluster está compuesto por una instancia "portainer", una instancia "nextcloud" y una instancia "qiime".

| Instancia | Tipo | Tamaño de disco (GB) | Sistema Operativo | Uso | Nota |
|:---------:|:----:|:--------------------:|:-----------------:|-----|-------|
| portainer | f1-micro | 20 | container-optimized | Permite administrar instancias de docker a través de una interfaz web | Deberán abrirse los puertos de red tcp: 9000 y 8000. |
| nextcloud | f1-micro | 500 | container-optimized | Almacen de archivos con interfaz web, admite el formato webdav para para crear volúmenes remotos en docker (con plugin [fentas/davfs](https://github.com/fentas/docker-volume-davfs)) | Deberá abrirse el puerto de red tcp: 80 |
| qiime | e2-standard-8 | 500 | debian-9 | Instancia de alto rendimiento para cargas de trabajo pesadas | Esta pensado para ejecutar qiime2, pero puede ser usado para cualquier otro programa |
----
El script deploy.sh será usado como punto de entrada y deberá ser ejecutado en Google Cloud Shell

1. Iniciar sesión en [Google Cloud Platform](https://console.google.com) y activar [Cloud Shell](https://cloud.google.com/shell)
2. Clonar este repositorio.
~~~
$ git clone https://github.com/gadgrandez/portainer-cluster.git
~~~
3. Otorgar permisos de ejecución al script y ejecutar
~~~
$ cd portainer-cluster
$ chmod +x deploy.sh
$ ./deploy.sh start
~~~
> Recuerde otorgar los permisos que se le solicite al momento de ejecutar el script

Al finalizar la ejecución continúe con los pasos siguientes:
- [Configurar portainer](#configurar-portainer)
- Configurar nextcloud
- Crear un volumen virtual (usando el plugin webdav) en qiime
- Configurar el contenedor de qiime2
## Configuración manual
### Configurar portainer
1. Accede a la interfaz a través del navegador usando la IP external de la instancia "portainer" y añadiendo ":9000" al final. Ejemplo: **45.100.45.50:9000**

![IP Externa de portainer](https://assets.gadgrandez.com/sites/1/portainer-ip-selected.png, "IP Externa de portainer")\
![IP de ingreso a portainer](https://assets.gadgrandez.com/sites/1/portainer-ip-ingresed.png, "IP de ingreso a portainer")

2. Se establece un nombre de usuario y contraseña para el administrador y se pulsa el botón **"Create User"**

![Crear usuario admin de portainer](https://assets.gadgrandez.com/sites/1/Captura-de-pantalla-34.png, "Crear usuario admin de portainer")

3. Se ignora la conexión inicial haciendo click en el botón **"Skip"**.

![Ignorar la configuración inicial](https://assets.gadgrandez.com/sites/1/portainer-skip-initial.png, "Ignorar la configuración inicial")

#### Agregar endpoints
Para esta configuración se usará la opción de Edge Agent, la documentación se encuentra [aquí](https://documentation.portainer.io/v2.0/endpoints/edge/, "Configuración de edge agent")

1. Se ingresa a la sección **"Endpoints"** del menú de navegación, se presiona el botón **"Add endpoint"**.

![Añadir endpoint](https://assets.gadgrandez.com/sites/1/portainer-add-endpoint-1.png, "Añadir endpoint")

2. Se elije la opción **"Edge Agent"**, se ingresa un nombre (puede ser cualquier nombre, de preferencia que sea descriptivo) y se pulsa el botón **"Add endpoint"**.

![Configuración del endpoint](https://assets.gadgrandez.com/sites/1/portainer-add-endpoint-2.png, "Configuración del endpoint")

3. Ejecutar la linea de comando en el terminal ssh de la instancia que se quiere conectar.