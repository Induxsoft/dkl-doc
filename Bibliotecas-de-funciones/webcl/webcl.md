# webcl.dkh

## HTTP

| **http.get**  Devuelva la respuesta del servidor como una cadena tras realizar una solicitud GET a la url indicada.  **http.get(url)** | **url**  - Cadena con un URI |
|-----------|-----------|
| **http.upload**  Devuelva la respuesta del servidor como una cadena tras enviar el archivo especificado a la url indicada a través de una solicitud POST con la codificación multipart/form-data.  **http.upload(archivo, url, nombre)** | **archivo** – Cadena con la ruta y nombre de un archivo  **url**  - Cadena con un URI  a la que se enviará el archivo  **nombre** – Nombre con el que se identifica al archivo|
| **http.upf**  Devuelva la respuesta del servidor como una cadena tras enviar el archivo especificado a la url indicada a través de una solicitud POST con la codificación multipart/form-data  y permite especificar encabezados de solicitud.  **http.upf(archivo, url, nombre, encabezados)** | **archivo** – Cadena con la ruta y nombre de un archivo  **url**  - Cadena con un URI  a la que se enviará el archivo  **nombre** – Nombre con el que se identifica al archivo  **encabezados** – Referencia a un registro con los encabezados personalizados a enviar (puede ser @null)|
| **http.download**  Descarga un archivo desde la url indicada y lo almacena en el sistema local en la ruta y nombre especificado.  **http.download(url, archivo)**| **url**  - Cadena con un URI  de la que se descargará el archivo  **archivo** – Cadena con la ruta y nombre del archivo con que se alojará en el sistema local|
| **http.request**  Devuelve como una cadena la respuesta del servidor tras la solicitud http especificada.  **http.request(url, método, encabezados, cuerpo)**| **url**  - Cadena con un URI  a la que se enviará la solicitud  **método** – Cadena con alguno de los siguientes valores: GET, POST, PUT, DELETE  **encabezados** – Referencia a un registro con los datos de los encabezados que se enviarán (puede ser @null)  **cuerpo** – Cadena con el contenido del cuerpo de la solicitud|
| **http.post**  Devuelva la respuesta del servidor como una cadena tras realizar una solicitud POST codificada como application/x-www-form-urlencoded con los datos del registro indicado.  **http.post(url, datos)**| **url**  - Cadena con un URI  a la que se enviará la solicitud POST  **datos** – Referencia a un registro que contiene los datos que se enviarán|

## SMTP

### Funciones

| **smtp.send**  Envía un mensaje de correo electrónico a través de un servidor SMTP  **smtp.send(msg)** | **msg** – Referencia a un registro con los campos que se requieran|
|-----------|-----------|

### Campos del registro de mensaje SMTP

```DKL
new mail
    {
        @"server":"servidor SMTP"
        @"protocol":"ssl" //ssl  - Habilita el cifrado, omita si no lo requiere
        @"port":"587"   //Número de puerto
        @"user":"usuario" //Usuario del servidor SMTP
        @"password":""      //Contraseña del usuario SMTP
        @"from":"Nombre <correo@remitente>" //Remitente del mensaje con el formato: nombre a mostrar <direccion@correo>
        @"to":"destinatario@correo.com" //Destinatario de correo
        @"repply":"copiara@correo.com"  //Dirección a copiar el mensaje (opcional)
        @"cco":"copia_oculta@correo.com"//Dirección de copia oculta
        @"subject":"Asunto del mensaje" 
        @"body":"Cuerpo html del mensaje"
    }
```
