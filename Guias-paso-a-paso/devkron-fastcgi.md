## Devkron FastCGI

### Iniciar el servicio

Iniciar el servicio en Linux con la configuración predeterminada
```
./dkl -fastcgi
```

Iniciar el servicio en Linux indicando un archivo de configuración
```
./dkl -fastcgi /etc/devkron/fastcgi.json
```
En la línea de comando anterior se especifica un archivo de configuración en una ubicación predeterminada.

### Estructura del archivo fastcgi.json
De manera predeterminada, el archivo fastcgi.json se encuentra en el directorio donde están los binarios de Devkron.

```
{
    "controller":"fastcgi/http.dkl",
    "address":"0.0.0.0",
    "port":9090,
    "max_concurrent_requests":128,
    "connection_timeout":10000,
    "max_header_size":16384
}

Campos:
```
* controller - Indica el program Devkron que controlará las solicitudes y respuestas HTTP, este se encuentra la carpeta 'fastcgi' del directorio de binarios de Devkron.

* address - Indica la dirección IP del equipo en donde escuchará el servicio:
  *   0.0.0.0 - Escuchar en todas
  *   127.0.0.1 - Escuchar en la loopback (local)

* port - Puerto de escucha (predeterminado el 9090)

* max_concurrent_requests - Máximo de conexiones concurrentes soportadas

* connection_timeout - Tiempo de espera máximo para cerrar una conexión que no responde

* max_header_size - Tamaño máximo de encabezado fastcgi

### Ubicación de los archivos de sitios Web

De manera predeterminada, Devkron responderá con el contenido de la carpeta 'web' que se encuentra en el directorio de los binarios.

Puede crear carpetas con los nombres de host específicos para separar el contenido correspondiente a diferentes sitios Web.

Por ejemplo:

Si crea un árbol de carpetas dentro de web como el siguiente:
```
./web
|----figura.png
|----/host1.midominio.com
       |----figura.png
```
Las solicitudes:
* cualquierotrohost.com/figura.png - devolverán el recurso 'web/figura.png'
* host1.midominio.com/figura.png - devolverá el recurso 'web/host1.midominio.com/figura.png'

### Tipos MIME
El archivo mime.dkl en la carpeta fastcgi de la instalación de Devkron contiene la manera como deberán tratarse los diferentes tipos de archivos.

### Enrutamiento
El archivo routing.dkl en la carpeta fastcgi permite programar la manera como serán canalizadas las solicicitudes de recursos, incluso cuando los URI no correspondan diractamente con archivos físicos.

### Ejecución de Scripts
Todos los archivos con extensión .dkl se consideran programas de Devkron y ejecutados. Cualquier otra extensión es considerada contenido estático y devuelta con los encabezados HTTP del tipo MIME correspondiente.

