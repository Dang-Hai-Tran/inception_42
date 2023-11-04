FROM alphine:3.18
# Install php and mariadb-client
RUN apk update && apk upgrade &&\
    apk add --no-cache php82 php82-fpm php82-mysqli &&\
    apk add --no-cache mariadb-client
# Config php-fpm to listen on internal port 9000
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php82/php-fpm.d/www.conf

# Install wp-cli
RUN apk add curl &&\
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
    chmod +x wp-cli.phar &&\
    mv wp-cli.phar /usr/bin/wp-cli.phar

# Copy wordpress configuration file

COPY ./conf/configure-wordpress.sh /tmp/configure-wordpress.sh
RUN chmod +x /tmp/configure-wordpress.sh

WORKDIR /var/www/html/wordpress

ENTRYPOINT [ "sh", "/tmp/configure-wordpress.sh" ]
