FROM ubuntu:14.04
MAINTAINER Nick Jones "nick@dischord.org"

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg-divert --local --rename --add /sbin/initctl

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN echo "mysql-server-5.5 mysql-server/root_password password root123" | debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password_again password root123" | debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password seen true" | debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password_again seen true" | debconf-set-selections

RUN apt-get update && apt-get install -y \
	apache2 \
	php5 php5-gd php-xml-parser php5-intl \
	php5-mysql php5-curl php5-sqlite \
	mysql-server-5.5 \
	smbclient \
	curl \
	libcurl3 \
	bzip2 \
	wget \
	vim \
	openssl \
	ssl-cert \
	sharutils

RUN wget -q -O - https://download.owncloud.org/community/owncloud-7.0.4.tar.bz2 | tar jx -C /var/www/

RUN mkdir /etc/apache2/ssl

COPY resources/cfgmysql.sh /tmp/
RUN chmod +x /tmp/cfgmysql.sh 
RUN /tmp/cfgmysql.sh
RUN rm /tmp/cfgmysql.sh

COPY resources/001-owncloud.conf /etc/apache2/sites-available/
COPY resources/start.sh /

RUN a2ensite 001-owncloud.conf
RUN a2enmod rewrite ssl

RUN chown -R www-data:www-data /var/www/owncloud
RUN chmod +x /start.sh

CMD ["/start.sh"]
