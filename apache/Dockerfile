FROM httpd:2.4.52-alpine

COPY docker-fpm.conf /usr/local/apache2/conf.d/docker-fpm.conf
RUN echo "IncludeOptional conf.d/*.conf" >> /usr/local/apache2/conf/httpd.conf
