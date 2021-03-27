# portainer-cluster

## Instalación a través de script
Este repositorio alberga archivos de configuración para desplegar un cluster básico de docker con una instalación de portainer.

El cluster está compuesto por una instancia "portainer", una instancia "nextcloud" y una instancia "qiime" de.

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
$ ./deploy.sh
~~~
> Recuerde otorgar los permisos que se le solicite al momento de ejecutar el script

Al finalizar la ejecución continúe con los pasos siguientes:
- Configurar portainer
- Configurar nextcloud
- Crear un volumen virtual (usando el plugin webdav) en qiime
- Configurar el contenedor de qiime2
## Configuración manual
