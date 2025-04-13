FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install git php php-gd php-xml php-curl php-mysql -y
RUN a2enmod rewrite

WORKDIR /var/www/html

RUN echo "<Directory /var/www/html>" >> /etc/apache2/apache2.conf
RUN echo "    AllowOverride All" >> /etc/apache2/apache2.conf
RUN echo "</Directory>" >> /etc/apache2/apache2.conf

CMD ["apache2ctl", "-D", "FOREGROUND"]
