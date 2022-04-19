# File System Operations (FSO) API

Implementa los servicios de un Resources Directory (según el RAAM de Induxsoft) a través de una API pública (web services) y
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
* filter. Una cadena de filtro para los archivos, p.e. *.txt
* deep. Numérico que indica la profundidad de búsqueda en sub-carpetas, predeterminado 999 
* search. Una cadena que será buscada en el contenido de archivos
* mode. Numérico: 0 (predeterminado) - Devuelve archivos y carpetas, 1-Solo carpetas, 2- Solo archivos y 3-Solo resultados de búsqueda en archivos
* base_path. Una cadena con la ruta del sistema local (en el servidor) usada como base para la uri
* host. Una cadena con el nombre de un host en el servidor para tomar su ubicación de archivos como base.
* uri. Una cadena que representa un URI concatenado sobre la ruta de base (base_path) para la obtención de resultados

De manera predeterminada, los parámetros en la URL base_path y host son excluyentes entre sí y son ignorados a menos que establezca ```@dklfso_multisites=@true``` en fso.config.dkl

Si se omite el parámetro uri, se asume que la URI es la que corresponde a la invocación del servicio lst.fso.

#### Privilegios requeridos
Se requiere que el usuario esté autenticado y cuente con alguno de los siguientes:

* dkl_fso_list
* read + plus
* write
* admin

Ejemplos:

```
https://misitioweb.tld/lst.fso
https://misitioweb.tld/lst.fso?filter=*.txt
https://misitioweb.tld/lst.fso?search=guanabanas&filter=*.txt&mode=3
```

### Obtener metadatos de una carpeta o archivo

Devuelve un objeto JSON con los metadatos de un archivo o carpeta

End point: uri/get.fso

Método HTTP: GET

#### Parámetros GET admitidos (todos son opcionales):
* base_path. Una cadena con la ruta del sistema local (en el servidor) usada como base para la uri
* host. Una cadena con el nombre de un host en el servidor para tomar su ubicación de archivos como base.
* uri. Una cadena que representa un URI concatenado sobre la ruta de base (base_path) para la obtención de resultados

De manera predeterminada, los parámetros en la URL base_path y host son excluyentes entre sí y son ignorados a menos que establezca ```@dklfso_multisites=@true``` en fso.config.dkl

Si se omite el parámetro uri, se asume que la URI es la que corresponde a la invocación del servicio get.fso.

#### Privilegios requeridos
Se requiere que el usuario esté autenticado y cuente con alguno de los siguientes:

* dkl_fso_getprops
* read + plus
* write
* admin

Ejemplo:

```
https://misitioweb.tld/documento.docx/get.fso
```

### Establecer metadatos de una o varias carpetas o archivos

End point: uri/set.fso

Método HTTP: POST o PUT

Cuerpo de la solicitud (payload):
```
Content-Type: application/json;charset=utf-8
{
	"uri1":{
    "properties":{"clave":"valor",...}
    "privileges":{
      "write":[{"user":"admin",...},...]
      }
    },
	"uri2":{...},
  ...
  "uriN":{...}
}
```

Se admiten los siguientes parámetros en la URL de solicitud (todos son opcionales):

* base_path. Una cadena con la ruta del sistema local (en el servidor) usada como base para la uri
* host. Una cadena con el nombre de un host en el servidor para tomar su ubicación de archivos como base.
* uri. Una cadena que representa un URI concatenado sobre la ruta de base (base_path) para la obtención de resultados

De manera predeterminada, los parámetros en la URL base_path y host son excluyentes entre sí y son ignorados a menos que establezca ```@dklfso_multisites=@true``` en fso.config.dkl

Si se omite el parámetro uri, se asume que la URI es la que corresponde a la invocación del servicio set.fso.

Respuesta:
```
Content-Type: application/json;charset=utf-8
{
    "uri1":{"props_done":true, "privs_done":true },
    ...
}
```


### Subir uno o varios archivos
End point: uri/upl.fso

Método HTTP: POST o PUT

### Eliminar, copiar, mover o renombrar
End point: uri/do.fso

Método HTTP: POST o PUT

## Funciones disponibles en fso.dk

fso.dk requiere que previamente se incluya el archivo de configuraciones fso.config.dk y depende de functions.dkh, serialize.dkh y webauth.dkl

Ejemplo:

```
#include "dkli.dkh"
#!
program "ejemplo"
{
  #include "functions.dkh"
  #include "serialize.dkh"
  #include "webauth.dkl"

  #include "_protected/fso/fso.config.dk"
  #include "_protected/fso/fso.dk"

  //..su código
}
```
fso.dk contiene las siguientes funciones de interés para el programador del back-end:

### dklfso.isprotected::uri
Devuelve ```@true``` si la cadena uri indicada es una subcarpeta o archivo en una subcarpeta del carpeta protegida del sitio Web.

### dklfso.createObjectInfo::base_path,uri
Devuelve una referencia a una estructura de datos con toda la información de metadatos de un archivo o carpeta en el sistema local, o bien @null si no se encuentra el recurso.

* base_path - Es una cadena que representa la ruta de base del sitio Web en el sistema local
* uri - Es una cadena que representa la ruta relativa a base_path del recurso (archivo o carpeta) en el sistema local

### dklfso.list::&params
Devuelve un objeto con toda la información de carpetas y archivos, es la misma respuesta que el servicio lst.fso invocado desde el propio backend.

```params``` es una referencia a una estructura que puede tener los siguientes parámetros:

* base_path. (Requerido) Una cadena con la ruta del sistema local (en el servidor) usada como base para la uri
* uri. (Requerido) Una cadena que representa un URI concatenado sobre la ruta de base (base_path) para la obtención de resultados
* host. Una cadena con el nombre de un host en el servidor para tomar su ubicación de archivos como base, si se indica este parámetro no se ignorará base_path por lo que este último puede excluirse.
* filter. (Opcional) Una cadena de filtro para los archivos, p.e. *.txt
* deep. (Opcional) Numérico que indica la profundidad de búsqueda en sub-carpetas, predeterminado 999 
* search. (Opcional) Una cadena que será buscada en el contenido de archivos
* mode. (Opcional) Numérico: 0 (predeterminado) - Devuelve archivos y carpetas, 1-Solo carpetas, 2- Solo archivos y 3-Solo resultados de búsqueda en archivos


## Metadatos
Los metadatos asociados a una carpeta o archivo son propiedades extendidas (clave/valor) o el manifiesto de privilegios.

### Propiedades extendidas
Se almacenan en archivos en formato JSON con extensión ```._m_``` a menos que indique lo contrario en fso.config.dk

Las propiedades extendidas de una carpeta se encuentran en el archivo ```._m_``` (archivo sin nombre, solo extensión) dentro de la misma.

Para las propiedades extendidas de los archivos, se emplean archivos con el mismo nombre y extensión, más la extensión ```._m_```, p.e. para un archivo denominado ```notas.docx```, existirá un archivo de propiedades extendidas llamado ```notas.docx._m_```

Si no existe el archivo ```._m_``` de propiedades extendidas, las únicas propiedades del archivo o carpeta son las que corresponden al sistema de archivos: nombre (incluyendo extensión), fecha y hora de creación, fecha y hora de último acceso y fecha y hora de última escritura (todas las fechas y horas en formato UTC)

### Manifiesto de privilegios
Se almacenan en archivos en formato JSON con extensión ```._p_``` a menos que indique lo contrario en fso.config.dk

El manifiesto de privilegios de una carpeta se encuentran en el archivo ```._p_``` (archivo sin nombre, solo extensión) dentro de la misma.

Para el manifiesto de privilegios de los archivos, se emplean archivos con el mismo nombre y extensión, más la extensión ```._p_```, p.e. para un archivo denominado ```notas.docx```, existirá un archivo de manifiesto de privilegios llamado ```notas.docx._p_```

Si no existe un archivo de manifiesto de privilegios para un archivo o carpeta, aplica la herencia ascendente, es decir, se heredan los privilegios del manifiesto de la carpeta padre y si no existe, entonces la del padre del padre, etc.

### Importante

Ni los archivos de propiedades extendidas ni los archivos de manifiesto de privilegios se generan o existen de forma predeterminada, deberá crearlos manualmente o a través del servicio set.fso 
