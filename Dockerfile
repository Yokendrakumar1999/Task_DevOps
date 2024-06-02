FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y apache2 git php libapache2-mod-php php-mysql mysql-client-core-8.0 && \
    apt-get clean

RUN git clone https://github.com/Yokendrakumar1999/Task_DevOps.git /tmp/Task_DevOps

RUN mv /tmp/Task_DevOps/* /var/www/html/

RUN rm /var/www/html/index.html

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
