# Dockerfile
FROM php:8.2-fpm

# Install needed extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set working directory inside container
WORKDIR /var/www/myphpapp

# Copy composer if you need composer later (optional)
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Expose PHP-FPM socket (port)
EXPOSE 9000

# Default command (php-fpm will run automatically in base image)