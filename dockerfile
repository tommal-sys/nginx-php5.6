FROM ubuntu:latest

ENV TZ=Europe/Warsaw
# Update package list and install tools
RUN apt-get update && apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get clean

# Update package list and install basic tools
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    && apt-get update

# Install PHP 5.6 and dependencies
RUN add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y \
    php5.6 \
    php5.6-fpm \
    php5.6-mysql \
    php5.6-redis \
    php5.6-memcache \
    php5.6-memcached \
    php5.6-gd \
    php5.6-dom \
    php5.6-cli \
    php5.6-json \
    php5.6-common \
    php5.6-mbstring \
    php5.6-opcache \
    php5.6-readline \
    && apt-get clean

# Install Redis and Memcached
RUN apt-get install -y \
    redis-server \
    memcached \
    && apt-get clean

# Set working directory
WORKDIR /var/www

# Copy PHP-FPM configuration files
COPY config/php-fpm.conf /etc/php/5.6/fpm/php-fpm.conf
COPY config/www.conf /etc/php/5.6/fpm/pool.d/www.conf
COPY config/php.ini /usr/local/etc/php5/php.ini

# Set permissions for PHP-FPM socket
RUN mkdir -p /var/run/php && \
    chown -R www-data:www-data /var/run/php

EXPOSE 9000
# CMD ["service", "php5.6-fpm", "start", "&&", "tail", "-f", "/dev/null"]
# Open port 9000 where PHP-FPM runs

# Set the default command to start PHP-FPM
CMD service memcached start && php-fpm5.6 -F