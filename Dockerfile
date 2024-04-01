FROM php:7.4-cli

# Install system dependencies required for PHP extensions and Composer
RUN apt-get update && apt-get install -y libzip-dev zip unzip git && \
    docker-php-ext-install zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /app

# Copy Composer definitions files and install PHP dependencies
COPY composer.json ./
RUN composer install --no-interaction --prefer-dist --no-scripts --optimize-autoloader

# Copy the rest of the application code
COPY . /app

# Make console executable
RUN chmod +x /app/bin/console
