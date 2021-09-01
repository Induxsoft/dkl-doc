## Nginx + Devkron a través de FastCGI

Devkron cuenta con una implementación del protocolo FastCGI para interacturar con servidores Web.

Podrás usar Devkron detrás de cualquier servidor (Windows o Linux) que admita este protocolo, como por ejemplo: Apache, Nginx e incluso IIS

En el caso de Nginx sigue los siguientes pasos:

1. Instalar Nginx
  
2. Habilita el paso de cookies de Nginx a FastCGI editando el archivo 'fastcgi_params' y agregándole la siguiente línea: 
  ```
  fastcgi_param HTTP_COOKIE $http_cookie;
  ```

3. Habilita la FastCGI de Devkron en el archivo nginx.conf en la sección http/server/location agregando las líneas:
  ```
include /nginx/conf/fastcgi_params;
fastcgi_pass 127.0.0.1:9090;
  ```
  En el ejemplo, el servicio FastCGI de Devkron estará escuchando en la IP local (127.0.0.1) y el puerto 9090 (el valor predeterminado en Devrkon).
  
4. Inicie el servicio de Nginx
```
service nginx start
```
5. Inicie el servicio de FastCGI de Devkron 
    ```
    ./dkl -fastcgi
    ```

### Notas 

El servicio FastCGI de Devkron solo está disponible en las distribuciones autocontenidas para Windows y Linux, vea las siguientes guías:
Instalación de Devkron autocontenido
* [Guía de instalación Windows x64](Windows/Instalar-dkl-winx64.md) 
* [Guía instalación Linux](Linux/Instalar-dkl-Linux.md)

Instalación de Nginx en Windows: https://nginx.org/en/docs/windows.html

Instalación en Linux (yum o dnf):
```
    yum install nginx
```

Ubicación de configuraciones de Nginx
* En Linux: /etc/nginx
* En Windows: Carpeta conf dentro de la carpeta de instalación

### IMPORTANTE 
En Linux generalmente el servicio httpd no tiene permisos para acceder a la red, por lo que deberá ejecutar el siguiente comando (o su equivalente) para permitir que Nginx se comunique con la FastCGI de Devkron:

``` bash
setsebool -P httpd_can_network_connect 1
```

#### Ejemplo de un archivo de configuración de Nginx 
```
worker_processes  1;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;
    server {
        listen       80;
        server_name  localhost;
        location / {
            include /nginx/conf/fastcgi_params;			
	    fastcgi_pass 127.0.0.1:9090;
        }
        
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
   }
}
```

#### Ejemplo del archivo de configuración  fastcgi_params
```

fastcgi_param  QUERY_STRING       $query_string;
fastcgi_param  REQUEST_METHOD     $request_method;
fastcgi_param  CONTENT_TYPE       $content_type;
fastcgi_param  CONTENT_LENGTH     $content_length;

fastcgi_param  SCRIPT_NAME        $fastcgi_script_name;
fastcgi_param  REQUEST_URI        $request_uri;
fastcgi_param  DOCUMENT_URI       $document_uri;
fastcgi_param  DOCUMENT_ROOT      $document_root;
fastcgi_param  SERVER_PROTOCOL    $server_protocol;
fastcgi_param  REQUEST_SCHEME     $scheme;
fastcgi_param  HTTPS              $https if_not_empty;

fastcgi_param  GATEWAY_INTERFACE  CGI/1.1;
fastcgi_param  SERVER_SOFTWARE    nginx/$nginx_version;

fastcgi_param  REMOTE_ADDR        $remote_addr;
fastcgi_param  REMOTE_PORT        $remote_port;
fastcgi_param  SERVER_ADDR        $server_addr;
fastcgi_param  SERVER_PORT        $server_port;
fastcgi_param  SERVER_NAME        $server_name;
fastcgi_param  HTTP_COOKIE		  $http_cookie;

fastcgi_param  REDIRECT_STATUS    200;
```
