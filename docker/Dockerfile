FROM php:7.4-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    git zip unzip curl \
    && docker-php-ext-install pdo pdo_mysql

# Copy app code
COPY . /var/www/html

# Set permissions
RUN chown -R www-data:www-data /va/www/html

EXPOSE 80

CMD ["apache2-foreground"]