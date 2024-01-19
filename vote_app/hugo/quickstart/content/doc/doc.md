---
title: "Documentation de la stack"
date: 2024-01-18T12:00:00Z
---

## Introduction

Cette documentation contient des informations sur la mise en place, les spécificités et le maintien de la stack. Celle-ci comprend un front-end en Python et en JavaScript, des bases de données Redis et PostgreSQL, un worker, un reverse proxy, un système d'orchestration avec Docker Compose, et une plateforme de documentation avec Hugo.

## Orchestration avec Docker Compose

Le fichier "docker-compose.yml" définit tous les services nécessaires, leurs configurations, les réseaux, et les volumes. Il permet de lancer tous les services simultanément. Pour lancer les services, il faut utiliser la commande "sudo docker compose up" depuis le dossier vote_app.

## Architecture des services

La partie front-end est diviser en deux parties :
- Le service vote affichant l'interface de vote en Python (port 5000)
- Le service result exposant les résultats en Javascript (port 4000).

La partie back-end quand à elle est composée de deux bases de données :
- Une DB Redis stockant temporairement les votes venant du front-end Python;
- Une DB PostgreSQL qui va stocker durablement les votes pour les afficher sur le front-end Javascript.

Le sevice worker permet de transférer les votes de la DB Redis à la DB PostgreSQL.

Enfin, le service Hugo (port 1313) permet de lancer la plateforme de documentation. Contrairement aux autres services qui eux sont tous situés dans des réseaux front-end ou back-end, hugo est isolé dans un réseau "internal" car il ne nécessite pas une exposition directe à l'extérieur de l'infrastructure.

Tous les services sont self-healing, leur permettant de redémarrer en cas de problème.

## Reverse Proxy

L'infrastructure possède un Reverse Proxy qui gère les connexions entrantes.
