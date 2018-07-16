FROM php:7.2.7-cli-alpine3.7

WORKDIR /root

# packages for gd extension
RUN apk add --no-cache curl \
        freetype libpng libjpeg-turbo freetype-dev \
        libpng-dev libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NPROC} gd \
    && docker-php-ext-install zip \
    && apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev

# composer
RUN curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/bin --filename=composer

# startup script
COPY ./dev.sh /root/
RUN chmod 755 /root/dev.sh
