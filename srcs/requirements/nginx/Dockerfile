FROM    alpine:3.18
RUN     apk update && apk upgrade &&\
    apk add --no-cache nginx &&\
    mkdir -p /var/www/html/
COPY    ./conf/nginx.conf /etc/nginx/nginx.conf
COPY    ./conf/default.conf /etc/nginx/http.d/default.conf

RUN     apk add --no-cache openssl &&\
    openssl req -x500 -nodes -days 365 -newkey rsa:2048\
    -keyout /etc/ssl/private/nginx-selfsigned.key\
    -out /etc/ssl/certs/nginx-selfsigned.crt\
    -subj "/C=FR/ST=IDF/L=Paris/O=42Network/OU=42Paris/CN=nginx_host_example"

RUN     adduser -D -g 'www' www &&\
    chown -R www:www /run/nginx/ &&\
    chown -R www:www /var/www/html/

EXPOSE  443/tcp

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
