## Nginx + Devkron a través de FastCGI

Devkron cuenta con una implementación del protocolo FastCGI para interacturar con servidores Web.

Podrás usar Devkron detrás de cualquier servidor (Windows o Linux) que admita este protocolo, como por ejemplo: Apache, Nginx e incluso IIS

En el caso de Nginx sigue los siguientes pasos:

1. Instalar Nginx
  - En Windows sigue las instrucciones en: https://nginx.org/en/docs/windows.html
  - En Linux usa yum o dnf:
    ```bash
    yum install nginx
    ```
2. Habilita el paso de cookies de Nginx a FastCGI editando el archivo 'fastcgi_params' y agregándole la siguiente línea: 
  ```
  fastcgi_param HTTP_COOKIE $http_cookie;
  ```

4. Habilita la FastCGI de Devkron en el archivo nginx.conf
  ```
  
  ```
  
