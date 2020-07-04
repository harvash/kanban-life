#!/bin/bash

cd $WORKSPACE/kanban-life/compose_postgres

docker build -f Dockerfile.pgdb -t  fskubecr.azurecr.io/kanban-pg:latest .
docker build -f Dockerfile.pgadmin -t  fskubecr.azurecr.io/kanban-db-admin:latest .

cd $WORKSPACE/kanban-life/server/app
docker build -f Dockerfile fskubecr.azurecr.io/kanban-web:latest .

az acr login --name fskubecr
docker push fskubecr.azurecr.io/kanban-web:latest
docker push fskubecr.azurecr.io/kanban-db-admin
docker push fskubecr.azurecr.io/kanban-pg


kubectl apply -f deploy_backend.yaml -f deploy_frontend.yaml -f deploy_web.yaml
