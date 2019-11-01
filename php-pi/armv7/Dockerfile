FROM balenalib/raspberrypi3-debian:latest

ENV PHPIZE_DEPS \
		autoconf \
		file \
		g++ \
		gcc \
		libc-dev \
		make \
		pkg-config

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install -y $PHPIZE_DEPS wget --no-install-recommends

RUN apt-get install -y re2c zlib1g-dev libssl-dev libxml2-dev bison libssl-dev libcurl4-openssl-dev \
libpng-dev libjpeg-dev libfreetype6-dev libmcrypt-dev libzip-dev

ENV PHP_VERSION '7.3.11'

RUN mkdir -p /usr/src \
&& cd /usr/src/ \
&& wget https://www.php.net/distributions/php-$PHP_VERSION.tar.gz \
&& tar -zxvf php-$PHP_VERSION.tar.gz

RUN cd /usr/src/php-$PHP_VERSION \
&& ./buildconf --force

RUN cd /usr/src/php-$PHP_VERSION \
&& ./configure \
--with-openssl=/usr \
--with-curl=/usr \
--with-gd \
--with-mcrypt \
--with-curl \
--with-openssl \
--disable-cgi \
--enable-zip \
--enable-mbstring \
--enable-sockets \
--enable-sysvmsg \
--enable-sysvsem

RUN cd /usr/src/php-$PHP_VERSION \
&& make && make install


RUN [ "cross-build-end" ]
