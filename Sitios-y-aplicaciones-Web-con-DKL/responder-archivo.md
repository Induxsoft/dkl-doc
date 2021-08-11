## Responder con un archivo (binario)

Para devolver un archivo, debe establecer el campo output del miembro response de @http_context y los encabezados HTTP como se muestra:

``` DKL
#include "dkli.dkh"
#! //Conmutación a contexto IMPERATIVO

program "ejemplo-BINARIO"
{
    #include "functions.dkh" // Biblioteca de funciones de propósito general

    archivo="C:\\pruebas\\dkl_manual.pdf" //Archivo a enviar

    //Establecer encabezado de respuesta http
    @http_context<"response/headers/content-type">:"application/octet-stream"

    //Indicar que se trata de un archivo adjunto y su nombre
    //Más información en: https://developer.mozilla.org/es/docs/Web/HTTP/Headers/Content-Disposition
    @http_context<"response/headers/content-disposition">: 'attachment; filename="manual_dkl.pdf"'

    //Indicar tipo de respuesta
    @http_context<"response/output">:"binary"

    //Asignar la respuesa de salida
    @http_context<"response/binary*">: file.rbytes(archivo) //Lee y devuelve el array de bytes del archivo
}
```
