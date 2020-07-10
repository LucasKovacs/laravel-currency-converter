FROM ubuntu:16.04
MAINTAINER Lucas Kovacs
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python-software-properties
RUN apt-get install -y software-properties-common
RUN apt-get install -y language-pack-en-base
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt-key update
RUN apt-get update
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
RUN apt-get install -y --force-yes curl
RUN apt-get install -y --force-yes php
RUN apt-get install -y --force-yes php-pear php7.4-curl php7.4-dev php7.4-gd php7.4-mbstring php7.4-zip php7.4-mysql php7.4-xml
RUN apt-get install -y nodejs npm wget
RUN a2enmod rewrite
RUN npm config set strict-ssl false
RUN npm install -g istanbul
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN export TERM=xterm

COPY ./setup.sh /root/setup.sh
RUN /root/setup.sh

ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
#You can modify these below with your host user
ENV APACHE_RUN_USER thinkpad
ENV APACHE_RUN_GROUP thinkpad

EXPOSE 80
EXPOSE 8080
EXPOSE 443
EXPOSE 3306

COPY converter /var/www/site
ADD virtualhost.conf /etc/apache2/sites-enabled/000-default.conf

WORKDIR /var/www/site
RUN composer install

CMD /usr/sbin/apache2ctl -D FOREGROUND