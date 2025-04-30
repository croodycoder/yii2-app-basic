FROM php:7.4-apache

# Install PHP extensions for Yii2
RUN docker-php-ext-install pdo pdo_mysql

# Enable mod_rewrite for Yii2
RUN a2enmod rewrite

# Set DocumentRoot to Yii2's web directory
ENV APACHE_DOCUMENT_ROOT /var/www/html/web

# Update Apache configuration
RUN sed -ri 's|/var/www/html|${APACHE_DOCUMENT_ROOT}|g' /etc/apache2/sites-available/000-default.conf \
    && sed -ri 's|/var/www/|${APACHE_DOCUMENT_ROOT}|g' /etc/apache2/apache2.conf

# Set permissions for the Yii2 app
WORKDIR /var/www/html
COPY . /var/www/html
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

