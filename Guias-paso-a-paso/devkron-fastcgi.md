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
```
* controller - Indica el program Devkron que controlará las solicitudes y respuestas HTTP, este se encuentra la carpeta 'fastcgi' del directorio de binarios de Devkron.
* address - Indica la dirección IP del equipo en donde escuchará el servicio:
  *   0.0.0.0 - Escuchar en todas
  *   127.0.0.1 - Escuchar en la loopback (local)
* port - Puerto de escucha (predeterminado el 9090)
* max_concurrent_requests - Máximo de conexiones concurrentes soportadas
* connection_timeout - Tiempo de espera máximo para cerrar una conexión que no responde
* max_header_size - Tamaño máximo de encabezado fastcgi
