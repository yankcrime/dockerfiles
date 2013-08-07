FROM ubuntu:12.04
MAINTAINER Nick Jones "nick@dischord.org"
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN apt-get -y update

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN apt-get install -y apache2 php5 php5-gd php-xml-parser php5-intl php5-sqlite smbclient curl libcurl3 php5-curl bzip2 wget vim

RUN wget -O - http://download.owncloud.org/community/owncloud-5.0.9.tar.bz2 | tar jx -C /var/www/

ADD ./001-owncloud.conf /etc/apache2/sites-available/
ADD ./start.sh /

RUN ln -s /etc/apache2/sites-available/001-owncloud.conf /etc/apache2/sites-enabled/
RUN a2enmod rewrite

EXPOSE :80

VOLUME ["/srv/mysql:/var/lib/mysql"]
VOLUME ["/srv/ocdata:/var/www/owncloud/data"]

RUN chown -R www-data:www-data /var/www/owncloud
RUN chmod +x /start.sh

CMD ["/start.sh"]

