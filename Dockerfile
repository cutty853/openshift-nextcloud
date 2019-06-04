FROM nextcloud:apache

ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data

EXPOSE 8080
RUN sed "s/80/8080/g" /etc/apache2/sites-available/000-default.conf > /tmp/000-default.conf && \
    sed "s/80/8080/g"  /etc/apache2/ports.conf > /tmp/ports.conf && \
    mv /tmp/000-default.conf /etc/apache2/sites-available/000-default.conf && \
    mv /tmp/ports.conf /etc/apache2/ports.conf && \
    cat /etc/apache2/sites-available/000-default.conf

USER www-data
