FROM ubuntu/apache2:2.4-21.10_beta
COPY docker-fpm.conf /etc/apache2/sites-available/docker-fpm.conf

RUN a2enmod rewrite proxy proxy_fcgi
RUN a2ensite docker-fpm
