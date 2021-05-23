FROM ubuntu:18.04

MAINTAINER Aruna Wijewardana, aruna.wijewardana@gmail.com

RUN apt-get -y update \
    && apt-get install -y wget gcc make libpcre3 libpcre3-dev libssl-dev nginx software-properties-common ffmpeg curl\
    && cd ~\
    && wget http://nginx.org/download/nginx-1.12.2.tar.gz\
    && wget https://github.com/arut/nginx-rtmp-module/archive/master.tar.gz\
    && tar -xzvf nginx-1.12.2.tar.gz\
    && tar -xzvf master.tar.gz\
    && rm nginx-1.12.2.tar.gz\
    && rm master.tar.gz\
    && cd nginx-1.12.2\
    && ./configure --with-http_ssl_module --without-http_gzip_module --add-module=../nginx-rtmp-module-master\
    && make\
    && make install\
    && cd /usr/local/nginx\
    && ls\
    && wget https://raw.githubusercontent.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx\
    && chmod +x /etc/init.d/nginx\
    && update-rc.d nginx defaults\
    && chown -R www-data:www-data /usr/local/nginx/html