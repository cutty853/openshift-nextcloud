FROM nextcloud:production-fpm

EXPOSE 8080
RUN sed "s/80/8080/g" -i /etc/apache2/sites-available/000-default.conf && \
    sed "s/80/8080/g" -i /etc/apache2/ports.conf
