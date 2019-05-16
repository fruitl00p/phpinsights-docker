FROM php:7.3-cli
MAINTAINER Robin Speekenbrink <docker@kingsquare.nl>

ENV TZ "UTC"
ENV PHPINSIGHTS_VERSION  1.0.5
ENV COMPOSER_VERSION  1.8.5

RUN apt-get update && \
    apt-get install -qy --no-install-recommends \
        libbz2-dev \
        unzip \
        curl \
        git \
        && \
    docker-php-ext-install bz2 && \
    docker-php-ext-enable opcache && \
    printf "# composer php cli ini settings\n\
    date.timezone=${TZ}\n\
    memory_limit=-1\n\
    opcache.enable_cli=1\n\
    " > $PHP_INI_DIR/php-cli.ini && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION} && \
    php -r "unlink('composer-setup.php');"

WORKDIR /opt/phpinsights
RUN composer require nunomaduro/phpinsights:${PHPINSIGHTS_VERSION}
VOLUME /app
WORKDIR /app

ENTRYPOINT /opt/phpinsights/vendor/bin/phpinsights