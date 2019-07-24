FROM nextcloud:production

RUN sed 's/80/8080/g' -i /etc/apache2/sites-available/000-default.conf && \
    sed 's/80/8080/g' -i /etc/apache2/ports.conf && \
    sed -i 's/Timeout 300/Timeout 1000/g' /etc/apache2/apache2.conf
