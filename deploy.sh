#!/bin/bash

gcloud services enable compute.googleapis.com
gcloud services enable deploymentmanager.googleapis.com
gcloud deployment-manager deployments delete portainer-cluster -q
gcloud deployment-manager deployments create portainer-cluster --config portainer-cluster.yaml