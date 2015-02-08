# Dockerfile to Build PHPMyAdmin on Apache
FROM php:5.6-apache
MAINTAINER John Gratton <jgratton@gmail.com>

# Set Date of Refresh if you need to rebuild the image
# Format: YYYY-MM-DD
ENV REFRESHED_AT 2015-02-08

# Install Git
RUN apt-get update && \
    apt-get install -y git zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

# Install mod_rewrite for Apache
RUN a2enmod rewrite

# Install PHP Extensions
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install zip

# Remove html directory
RUN rm -rf /var/www/html

# Set Working Directory
WORKDIR /tmp

# Download Latest STABLE PHPMyAdmin
RUN git clone -v -b STABLE --depth 1 --single-branch https://github.com/phpmyadmin/phpmyadmin.git

# Install config file of latest STABLE Branch of the PHPMyAdmin
ADD defaults/phpmyadmin/config.inc.php /tmp/phpmyadmin/config.inc.php

# Install Custom 000-Default.conf file
ADD defaults/apache/000-default.conf /etc/apache2/sites-enabled/000-default.conf

# Add the phpmyadmin initialization script
ADD defaults/start.bash /initialize-phpmyadmin

# Set Mountable Volume
VOLUME ["/var/www"]

# Run the initialization script upon container creation
CMD ["bash", "/initialize-phpmyadmin"]