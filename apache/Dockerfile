###########################
##
## Debian apache is perfered than apache offical httpd image 
## for its enhancement on sites & mods management.
## 
###########################

FROM ubuntu/apache2:2.4-21.10_beta

WORKDIR /etc/apache2

COPY *.conf /etc/apache2/sites-available/

RUN a2enmod rewrite proxy proxy_fcgi proxy_http
RUN a2ensite wp-fpm
