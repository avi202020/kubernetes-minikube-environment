#!/usr/bin/env bash

helm install \
--name my-mysql \
--set imageTag=5.7.25 \
--set mysqlDatabase=keycloak \
--set mysqlRootPassword=root-password \
--set mysqlUser=keycloak \
--set mysqlPassword=keycloak \
--set persistence.enabled=false \
stable/mysql

helm install \
--name my-mongodb \
--set image.tag=4.0.9 \
--set image.pullPolicy=IfNotPresent \
--set usePassword=false \
--set persistence.enabled=false \
stable/mongodb

sleep 20

helm install \
--name my-keycloak \
--set keycloak.image.tag=5.0.0 \
--set keycloak.username=admin \
--set keycloak.password=admin \
--set keycloak.service.type=NodePort \
--set keycloak.persistence.dbVendor=mysql \
--set keycloak.persistence.dbHost=my-mysql \
--set keycloak.persistence.dbPort=3306 \
--set keycloak.persistence.dbName=keycloak \
--set keycloak.persistence.dbUser=keycloak \
--set keycloak.persistence.dbPassword=keycloak \
stable/keycloak

helm install \
--name my-kong \
--set image.tag=1.1.1 \
--set admin.useTLS=false \
--set readinessProbe.httpGet.scheme=HTTP \
--set livenessProbe.httpGet.scheme=HTTP \
stable/kong
