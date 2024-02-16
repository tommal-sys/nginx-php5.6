
# Docker nginx + php5.6 container

Docker container based on Ubuntu. Using nginx-alphine version with php 5.6

## Includes packages

 * nginx:alpine
 * memcached
 * mariadb
 * php 5.6 (fpm, mysql, redis, memcache, memcached, gd, dom, cli, json, common, mbstring, opcache, readline)
 * adminer
    
## Problem

I came across an old project that was working on php5.6 and the old memcache library (without d) which is no longer supported.

## Run Localy
Install MariaDB:
```
docker run --detach --name some-mariadb --env MARIADB_USER=user --env MARIADB_PASSWORD=pass --env MARIADB_DATABASE=example-database --env MARIADB_ROOT_PASSWORD=brak  mariadb:latest
```
Create network:
```
docker network create www_default
```
Build project:
```
docker-compose up -d --build
```
Check everything is ok and all containers are working:
```
docker ps -a
```
Start project:
```
docker-compose up -d
```
Stop project:
```
docker-compose down
```
Import example database:
```
cp example.sql nginx-php56-mysql-1:/home/prawojazdy_lite.sql
docker exec -it nginx-php56-mysql-1-mysql-1 /bin/bash
mariadb -u user -p example-database < example.sql
```