<h1>Proyecto de Virtualización y Contenedores </h1>
<h2>1. Vagrant: Creación de 3 Máquinas Virtuales Ubuntu/Trusty64 </h2>
Este proyecto configura tres máquinas virtuales utilizando Vagrant con Ubuntu Trusty64 y las siguientes especificaciones:

Máquina 1: BBDD
Nombre de la máquina: BBDD
Nombre del host: servidorBBDD
Memoria: 2048 MB
CPUs: 2
Red: Redirección del puerto 3306 a 33060
IP privada: 192.168.56.31
Paquete instalado: python-pip
Máquina 2: WEB0
Nombre de la máquina: WEB0
Nombre del host: servidorWeb
Memoria: 1024 MB
CPUs: 2
Red: Redirección del puerto 80 a 8080
IP privada: 192.168.56.32
Paquete instalado: default-jre
Máquina 3: WEB1
Nombre de la máquina: WEB1
Nombre del host: servidorWeb2
Memoria: 2048 MB
CPUs: 2
Red: Redirección del puerto 80 a 9090
IP privada: 192.168.56.33
Acciones: Actualización de todos los paquetes
Pantallazos:
Muestra los pantallazos donde se vean las 3 máquinas creadas y configuradas correctamente.

<h2>2. Terraform: Creación de Máquinas Virtuales en AWS/Proxmox </h2>
Usando Terraform, crea tres máquinas virtuales Linux con las siguientes características:

Máquina 1: BBDD
Nombre de la máquina: BBDD
Nombre del host: servidorBBDD
Memoria: 2048 MB
CPUs: 2
Paquete instalado: python-pip
Máquina 2: WEB2
Nombre de la máquina: WEB2
Nombre del host: servidorWeb
Memoria: 2048 MB
CPUs: 2
Paquete instalado: nginx
Máquina 3: WEB3
Nombre de la máquina: WEB3
Nombre del host: servidorWeb2
Memoria: 2048 MB
CPUs: 2
Acciones: Actualización de paquetes e instalación de apache2
Pantallazos:
Muestra los pantallazos donde se vean las 3 máquinas creadas.

<h2>3. Ansible Playbook: Configuración de WEB2 y WEB3</h2>
Crea un playbook que realice las siguientes tareas en las máquinas WEB2 y WEB3:

Crear el usuario XXXXX (donde XXXXX es tu nombre).
Instalar y comprobar que el servicio nginx funcione.
Crear el directorio /usr/share/nginx/html/app (para Ubuntu Trusty64) o /var/www/html/app (para versiones más nuevas).
Copiar el archivo ejemplo.html en el directorio creado.
Mostrar la página en los navegadores:
http://localhost:8080/app/ejemplo.html
http://localhost:9090/app/ejemplo.html
Pantallazos:
Muestra pantallazos de la ejecución de las tareas y los accesos web.

<h2>4. Docker-Compose: Balanceador y Servidores Web </h2>
Configura un archivo docker-compose y los Dockerfile necesarios para arrancar tres contenedores:

Contenedor 1: Balanceador de Carga
Basado en: nginx
Función: Balancea las peticiones entre los servidores web.
Contenedor 2: XXXXX1 (Apache)
Nombre: XXXXX1 (donde XXXXX es tu nombre)
Servidor: apache
Página: Una index.html con tu nombre.
Contenedor 3: XXXXX2 (Nginx)
Nombre: XXXXX2 (donde XXXXX es tu nombre)
Servidor: nginx
Página: Una index.html con tu nombre.
Pantallazos:
Captura pantallas del balanceador de carga mostrando los accesos a los servidores web.

<h2>5. Docker-Compose: Aplicación con Postgresql, Adminer, y Fluentd </h2>
Configura un archivo docker-compose y los Dockerfile necesarios para arrancar siete contenedores:

Contenedor 1: PostgreSQL
Base de datos: Tu nombre
Clave de root: clave1
Volúmenes:
./Productos.sql:/docker-entrypoint-initdb.d/Productos.sql
$HOME/datos-postgressql
Contenedor 2: Adminer
Conexión: PostgreSQL
Puerto: 9091
Contenedor 3: Servidor Web Apache
Puerto: 9092
Redirección: Envía logs a Fluentd y las peticiones PHP al contenedor de PHP.
Contenedor 4: PHP
Conexión: PostgreSQL
Sin acceso público: Aplicación conectada a PostgreSQL.
Contenedor 5: Fluentd
Función: Recibe los logs del servidor Apache y los envía a ElasticSearch.
Contenedor 6: ElasticSearch
Función: Almacena los logs.
Contenedor 7: Kibana
Puerto: 5601
Conexión: ElasticSearch.
Pantallazos:

<h2>6. Crea un archivo Kubernetes para arrancar los 7 contenedores anteriores (ten en cuenta que deberás generar previamente las imágenes del servidor PHP y el servidor web), utilizando volúmenes persistentes y secretos para los datos sensibles :</h2>
Además debes:
Abrir un navegador y capturar pantallas de la app de php
