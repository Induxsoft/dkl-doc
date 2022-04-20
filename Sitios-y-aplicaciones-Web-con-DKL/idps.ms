# Proveedores de Identidades

El programa ```_protected/idp/default.dk``` incluido en dkl-web como parte de la BWL, utiliza la API de Induxsoft 
para recuperar información de sesión de usuario.

Almacena el token de la sesión como texto plano en la cookie '__induxsoft_token'

El programa reconocerá el Id de sesión tomando en consideración la configuración de webauth.dkl, por lo que de manera predeterminada puede introducir el token en cualquiera de las siguientes formas:

Método HTTP GET
```
uri?token=TOKEN_DE_SESION

uri?ids=TOKEN_DE_SESION
```

Encabezado 'Authorization' de HTTP
```
Authotization: bearer TOKEN_DE_SESION

Authotization: TOKEN_DE_SESION
```

En el cuerpo de una solicitud en JSON en los campos 'ids' o 'token'

```
Método POST o PUT
Content-Type:application/json
{
  ids:"TOKEN_DE_SESION"
}

Método POST o PUT
Content-Type:application/json
{
  token:"TOKEN_DE_SESION"
}
```
