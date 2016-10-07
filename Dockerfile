FROM nginx:1.11.4
MAINTAINER serenader xyslive@gmail.com
ENV PYDIO_VERSION 6.4.2

RUN apt-get update && apt-get install -yq wget unzip \
    php5-fpm php5-common php5-json php5-cli php5-mysql \
    php5-gd php5-mcrypt php5-readline psmisc php-pear \
    libgd-tools libmcrypt-dev mcrypt \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && sed -i -e "s/output_buffering\s*=\s*4096/output_buffering = Off/g" /etc/php5/fpm/php.ini \
    && sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini \
    && sed -i -e "s/upload_max_filesize\s*=\s*2M/upload_max_filesize = 20G/g" /etc/php5/fpm/php.ini \
    && sed -i -e "s/post_max_size\s*=\s*8M/post_max_size = 20G/g" /etc/php5/fpm/php.ini \
    && php5enmod mcrypt \
    && mkdir /var/www/ && chown www-data:www-data /var/www

COPY nginx.conf /etc/nginx/nginx.conf
WORKDIR /var/www
RUN wget http://downloads.sourceforge.net/project/ajaxplorer/pydio/stable-channel/${PYDIO_VERSION}/pydio-core-${PYDIO_VERSION}.zip \
    && unzip pydio-core-${PYDIO_VERSION}.zip && mv pydio-core-${PYDIO_VERSION} pydio-core \
    && chown -R www-data:www-data /var/www/pydio-core && chmod -R 770 /var/www/pydio-core \
    && chmod 777  /var/www/pydio-core/data/files/ \
    && chmod 777  /var/www/pydio-core/data/personal/

EXPOSE 80

VOLUME /var/www/pydio-core/data/files/
VOLUME /var/www/pydio-core/data/personal/

CMD service php5-fpm restart && nginx
