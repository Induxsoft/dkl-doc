# webauth.dkl

Esta biblioteca de funciones incluida en dkl-web ayuda a realizar tareas comunes relacionadas con la autenticación y autorización.

## Recuperar el identificador (token) de sesión

La estructura:
``` dkl
using @http_token_locations
{
    @"get":"ids,token"
    @"cookie":"__induxsoft_token"
    @"form":"session_id"
    @"json":""
    @"bearer":@true
    @"header":""
    @"custom_auth":@true
}
```

Permite configurar la ubicación, secuencia de búsqueda y ubicaciones donde puede encontrarse el id de una sesión al invocar a la función ```auth.token::```.

De manera predeterminada, el código siguiente:

``` dkl
#include "dkli.dkh"
#!
program
{
  #include "functions.dkh"
  #include "serialize.dkh"
  #include "cookies.dkl"
  #include "webauth.dkl"
  
  t=auth.token()
}
```

Asignará a la variable t el token de una sesión que se encuentre disponible según el siguiente orden de búsqueda:

1. Se buscará el parámetros en la url (GET) ids, luego
2. Se buscará el parámetros en la url (GET) token, luego
3. En una cooki denominada '__induxsoft_token', luego
4. En un campo en el cuerpo de la solicitud codificado como 'x-www-form-urlencoded' llamado 'session_id'
5. En el encabezado HTTP 'Authorization' según la [RFC 6750](https://datatracker.ietf.org/doc/html/rfc6750), luego
6. En el encabezado HTTP 'Authorization' todo el texto que haya, si es que lo hay

Si todas las búsquedas anteriores fallan, auth.token se devuelve una cadena vacía

El miembro 'json' de ```@http_token_locations``` puede indicar un campo de un objeto JSON recibido en el cuerpo de una solicitud, así como el miembro 'header' indica un nombre de encabezado http para buscar.

## Obtención de privilegios disponibles

La función ```auth.checkPrivs::&login, &manifest``` devuelve una lista de cadenas que representan los privilegios de la estructura de 
información de sesión de usuario (parámetro login) que coinciden con los requeridos por el Manifiesto de privilegios en el parámetro de referencia manifest.

### Buscar una cadena en una lista
```auth.findStrInList::&lista, valor ``` Devuelve @true, si la cadena indicada en valor está en la lista de cadenas (parámetro lista).

Ejemplo de uso:

``` dkl
#include "dkli.dkh"
#!
program
{
  #include "functions.dkh"
  #include "serialize.dkh"
  #include "cookies.dkl"
  #include "webauth.dkl"
  
  ref manifiesto=from.json('
  {
    "read":[{"user":"admin"}],
    "write":[{"team":"administradores"}, {"user":"juan"}]
    "other":[{"user":"pedro"}]
  }
  ')
  
  ref login=from.json('
  {
    "uid":"pedro",
    "memberships":
    {
      "teams":["administradores","gerentes"]
    }
  }
  ')
  
  ref privs=auth.checkPrivs(login, maniefiesto)
  //privs contendrá la lista de cadenas: 'write' y 'other'
  
  can_write=auth.findStrInList(privs,"write") // can_write=@true
  
}
```
