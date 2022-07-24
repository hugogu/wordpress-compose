###########################
##
## Debian apache is perfered than apache offical httpd image 
## for its enhancement on sites & mods management.
## 
###########################

FROM ubuntu/apache2:2.4-21.10_beta

RUN apt update
RUN apt install -y iputils-ping dnsutils vim
# Generate a snakeoil certification.
# RUN apt-get install -y ssl-cert

WORKDIR /etc/apache2

COPY *.conf /etc/apache2/sites-available/

# Enanble SSL when /etc/apache2/ssl.crt/server-ca.crt is mount.
RUN if [ -f /etc/ssl/certs/ssl-cert-snakeoil.pem ]; then cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/www-ssl.conf; fi
RUN if [ -f /etc/apache2/ssl.crt/server-ca.crt ]; then sed -i -e 's/#SSLCertificateChainFile/SSLCertificateChainFile/' /etc/apache2/sites-available/www-ssl.conf; fi

RUN a2enmod ssl headers http2 rewrite proxy proxy_fcgi proxy_http proxy_http2 remoteip

# Automatically enable all sites copied except for ssl as that requires pem file exist.
RUN find sites-available/ -type f -exec basename {} .conf \; | grep -v default | xargs a2ensite
