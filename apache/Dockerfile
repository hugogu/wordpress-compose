###########################
##
## Debian apache is perfered than apache offical httpd image 
## for its enhancement on sites & mods management.
## 
###########################

FROM ubuntu/apache2:2.4-21.10_beta

RUN apt update
RUN apt install -y iputils-ping dnsutils vim

WORKDIR /etc/apache2

COPY *.conf /etc/apache2/sites-available/

RUN a2enmod ssl headers http2 rewrite proxy proxy_fcgi proxy_http proxy_http2 remoteip
RUN a2ensite wp-fpm
