## Nginx + Devkron a través de FastCGI

Devkron cuenta con una implementación del protocolo FastCGI para interacturar con servidores Web.

Podrás usar Devkron detrás de cualquier servidor (para Windows o Linux) como por ejemplo: Apache, Nginx e incluso IIS

En el caso de Nginx sigue los siguientes pasos:

1. Instalar Nginx
  a. En Windows sigue las instrucciones en: https://nginx.org/en/docs/windows.html
  b. En Linux usa yum o dnf:
  ```bash
  yum install nginx
  ```
2. Edita el archivo nginx.conf que 
