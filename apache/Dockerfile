###########################
##
## Debian apache is perfered than apache offical httpd image 
## for its enhancement on sites & mods management.
## 
###########################

FROM ubuntu/apache2:2.4-21.10_beta
COPY docker-fpm.conf /etc/apache2/sites-available/docker-fpm.conf

RUN a2enmod rewrite proxy proxy_fcgi
RUN a2ensite docker-fpm
