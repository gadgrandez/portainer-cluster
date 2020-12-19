#!/bin/bash

gcloud services enable iam.googleapis.com
gcloud services enable storage-api.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable deploymentmanager.googleapis.com
gcloud deployment-manager deployments create portainer-cluster --config portainer-cluster.yaml