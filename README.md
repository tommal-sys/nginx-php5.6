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

