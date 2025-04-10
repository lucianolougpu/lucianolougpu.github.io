# Usar una imagen base de Ubuntu
FROM ubuntu:latest

# Evitar prompts interactivos durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instalar Apache, MySQL, PHP y git
RUN apt-get update && apt-get install -y \
    apache2 \
    mysql-server \
    php \
    libapache2-mod-php \
    php-mysql \
    git

# Clonar el repositorio de GitHub (reemplaza con tu URL)
RUN git clone https://github.com/lucianolougpu/lucianolougpu.github.io /tmp/repo

# Limpiar el directorio de Apache y mover los archivos HTML
RUN rm -rf /var/www/html/* && cp -r /tmp/repo/* /var/www/html/ && rm -rf /tmp/repo


# Exponer el puerto 80
EXPOSE 80

# Iniciar Apache y MySQL al arrancar el contenedor
CMD service mysql start && apache2ctl -D FOREGROUND