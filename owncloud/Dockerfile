FROM ubuntu:12.04
MAINTAINER Nick Jones "nick@dischord.org"
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN apt-get -y update

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN echo "mysql-server-5.5 mysql-server/root_password password root123" | debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password_again password root123" | debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password seen true" | debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password_again seen true" | debconf-set-selections

RUN apt-get install -y apache2 php5 php5-gd php-xml-parser php5-intl php5-sqlite mysql-server-5.5 smbclient curl libcurl3 php5-mysql php5-curl bzip2 wget vim openssl ssl-cert

RUN wget -q -O - http://download.owncloud.org/community/owncloud-5.0.9.tar.bz2 | tar jx -C /var/www/

RUN mkdir /etc/apache2/ssl

ADD resources/001-owncloud.conf /etc/apache2/sites-available/
ADD resources/server.crt /etc/apache2/ssl/
ADD resources/server.key /etc/apache2/ssl/
ADD resources/start.sh /

RUN ln -s /etc/apache2/sites-available/001-owncloud.conf /etc/apache2/sites-enabled/
RUN a2enmod rewrite ssl

EXPOSE :443

RUN chown -R www-data:www-data /var/www/owncloud
RUN chmod +x /start.sh

CMD ["/start.sh"]

