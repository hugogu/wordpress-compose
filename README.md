# WordPress

## Introduction

Intalling WordPress and its dependencies manually on bare mental is a tedius practice. 

WordPress released [a few docker images](https://hub.docker.com/_/wordpress) to mitigate that cost but still not ideal. Its apache images works directly but it does NOT have fpm enabled, it fpm image enabled fpm for better performance but doesn't work by itself. 

This tiny project features an all-in-one solution to setup a WordPress site with optimized configuration as default. 

This is usually suitable to setup personal site. 

## Basic Setup

* [Apache2](https://httpd.apache.org/) from Debian distribution is choiced for its convinient sites and mods management. Please read its [doc](https://salsa.debian.org/apache-team/apache2/-/blob/master/debian/config-dir/apache2.conf.in) for more information
* mpm_event enabled with fcgi proxy to fpm. (The official [Apache httpd image](https://hub.docker.com/_/httpd/) don't as of 2.4)
* Static resources are handled by Apache without hitting PHP engine
* Permalinks support by default. (The official Apache httpd image don't as of 2.4)

Hopefully you can gain reasonable good performance even on a host with a lower spec on mordan cloud service provides. 

## How to Deploy

### Prequisitions

Install *Docker* by following [offical instruction](https://docs.docker.com/engine/install/).
:warning: Please note it doesn't work with [Podman](https://podman.io/) due to a network issue. (Bug to fix)

And install *docker-compose* by following an on-line instruction like [this](https://docs.docker.com/compose/install/). 

### Deployment Steps

Customize your options in the [env.template](env.template) file.

```bash
cd /mnt              # Or on any data disk. 
git clone git@github.com:hugogu/wordpress-compose.git blog
cd blog
set -a; source env.template; set +a
docker-compose up --build
```

If you just wanna use the env.template directly. Try:
```bash
docker-compose --env-file env.template up --build
```

## How to Backup

Deployment will create `html` and `mysql` as data folder, customizable via environment variables defined in [env.template](env.template). 

You need to backup these two folders regularly to prevent unnessesary data lost. It is adviced to make the deployment on a data disk than a system disk. It should be quite simple to setup a data backup job in your cloud service provider. 

## Roadmap

* Support data migration from existing WordPress site. 
* Suuport customized document root.
* Support FTP managed sites content. 
* Support docker-swarm & kubernates.
* Support docker secrets & kubernates secrets.
* Support hosting multiple sites
* Support nginx as Web Server.
* Rewrite WordPress Dockfile on an alpine distribution.
