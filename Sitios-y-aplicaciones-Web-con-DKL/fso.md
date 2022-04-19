# File System Operations (FSO) API

Implementa los servicios de un Resource Directory (según el RAAM de Induxsoft) a través de una API pública (web services) y
privada (biblioteca de funciones).

## Enrutamiento público
La extensión .fso está dirigida hacia los programas de la API FSO que exponen servicios, revise el ```ext.map``` de la BWL.

## Servicios Web

### Listar carpetas y/o archivos
End point: uri/lst.fso

Método HTTP: GET

Devuelve un objeto JSON con información del contenido de la URI desde la que se invocó o bien,
la que se haya especificado en los parámetros de la URL (GET) si están admitidos.

#### Parámetros GET admitidos (todos son opcionales):
* filer. Una cadena de filtro para los archivos, p.e. *.txt
* deep. Numérico que indica la profundidad de búsqueda en sub-carpetas, predeterminado 999 
* search. Una cadena que será buscada en el contenido de archivos
* mode. Numérico: 0 (predeterminado) - Devuelve archivos y carpetas, 1-Solo carpetas, 2- Solo archivos y 3-Solo resultados de búsqueda en archivos
* base_path. Una cadena con la ruta del sistema local (en el servidor) usada como base para la uri
* uri. Una cadena que representa un URI concatenado sobre la ruta de base (base_path) para la obtención de resultados

De manera predeterminada, el parámetro base_path en la URL es ignorado a menos que establezca ```@dklfso_multisites=@true``` en fso.config.dkl

Si se omite el parámetro uri, se asume que la URI es la que corresponde a la invocación del servicio lst.fso.

#### Privilegios requeridos
Se requiere que el usuario esté autenticado y cuente con alguno de los siguientes:

* dkl_fso_list
* read + plus
* admin


Ejemplo:
https://misitioweb.tld/lst.fso

### Obtener metadatos de una carpeta o archivo
End point: uri/get.fso

Método HTTP: GET

### Establecer metadatos de una o varias carpetas o archivos
End point: uri/set.fso

Método HTTP: POST o PUT

### Subir uno o varios archivos
End point: uri/upl.fso

Método HTTP: POST o PUT

### Eliminar, copiar, mover o renombrar
End point: uri/do.fso

Método HTTP: POST o PUT