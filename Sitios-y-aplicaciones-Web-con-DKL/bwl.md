# Devkron Basic Web Layer (BWL)

Habilita un modelo coherente de acceso a los recursos del sitio Web.

Se basa en el Resourse Access Authorization Model (RAAM) de Induxsoft

##Componentes

* Proveedor de identidades (IDP). Verifica la validez de un identificador (token) de sesión y recupera información del usuario.
* API de Operaciones del Sistema de Archivos (FSO API). Proporciona un mecanismo para gestionar privilegios y metadatos, así como realizar operaciones sobre los archivos y carpetas del sitio Web.
* Controlador de autorizaciones (auth.dk). Autoriza el acceso a los recursos y reúne información de sesión apoyándose en el IDP y la API de FSO.

##Flujo de autorización
Aprovechando el modelo del flujo de la solicitud HTTP de Devkron, el programa auth.dk provisto en la BWL agrega el miembro ```session``` al objeto ```@http_context``` con información del usuario y el recurso solicitado.

auth.dk cargará el programa del IDP que deberá agregar al miembro ```session``` el campo ```user``` si es posible recuperar un token de sesión válido.

De manera predeterminada, auth.dk buscará el programa del IDP en ```/_protected/idp/default.dk```

Luego, auth.dk con el apoyo de FSO recuperará información del archivo o carpeta indicada (por el URI) y la pondrá a disposición a través del campo ```resource``` de ```session```

Si no hay un token de sesión disponible en la solicitud o éste no es válido, no existirá el campo ```user``` en ```session```.

Si el token recibido ha podido comprobarse, además del miembro ```user``` en session, se agregará el campo ```authforuser``` al miembro ```resource``` de ```session``` con la lista de privilegios del recurso que han podido verificarse que tiene disponibles el usuario sobre el recurso.

El siguiente bloque en JSON ilustra el contenido del objeto ```@http_context``` con el miembro ```session``` anexado:

```
{
  "request":{...},
  "response":{...},
  "session": {
        "user": {
            "ids": "ce59246a401441af8d1735bbb2764ec6",
            "uid": "C248E9BAF92411E5AA35C04A000418D7",
            "name": "ADMIN",
            "multifactor": 0,
            "verified_email": 0,
            "verified_mobile": 1,
            "memberships": {
                "workspaces": [
                    "0f251c4fa95c4a579ed1c2f8e75e1a4c"
                ],
                "teams": [
                    "87b65838ecde4ce4b88c5328d27ad4e5"
                ],
                "roles": [
                    "a200c6efd6654d7d91c545400e9f4267"
                ]
            }
        },
        "resource": {
            "type": "folder",
            "fullpath": "/",
            "path": null,
            "name": "",
            "creation": "2022-04-01T06:06:03",
            "lastaccess": "2022-04-16T08:56:17",
            "lastwrite": "2022-04-16T08:56:17",
            "privileges": {
                "admin": [
                    {
                        "user": "C248E9BAF92411E5AA35C04A000418D7"
                    }
                ]
            },
            "priv_inherited": 0,
            "authforuser": [
                "admin"
            ]
        }
    }
}
```
