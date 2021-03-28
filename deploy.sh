#!/bin/bash

clear

echo "Verificando si las apis están activas"

gcloud services enable compute.googleapis.com
gcloud services enable deploymentmanager.googleapis.com

delete() {
    clear
    echo "Eliminando portainer-cluster y todos sus recursos"
    gcloud deployment-manager deployments delete portainer-cluster -q
}

start() {
    clear
    echo "Creando portainer-cluster..."
    gcloud deployment-manager deployments create portainer-cluster --config portainer-cluster.yaml
}

load() {
    echo "Elija la tarea que desee realizar"
    echo ""
    echo "1. Configurar el cluster portainer-cluster"
    echo "2. Eliminar el cluster portainer-cluster"
    echo ""
    read -p 'Elija una opción >_: ' selectionvar

    case $selectionvar in
        "1")
            start
            ;;
        "2")
            delete
            ;;
        *)
            echo "No se eligió una opción válida, saliendo..."
            exit 1
            ;;
    esac
}

case $1 in 
    "start")
        start
        ;;
    "delete")
        delete
        ;;
    *)
        load
        ;;
esac