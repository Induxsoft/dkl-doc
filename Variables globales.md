# Variables globales

Estas variables globales mejoran la seguridad de tipos y facilitan la lectura de los programas.

## Constantes

| @true | Use estas variables globales como constantes para comparaciones en expresiones como: valor==@true, valor==@false|
|-------------|-----------|
|@false|

## Plantillas de variables

| @bool | Use estas variables para establecer atributos al momento de declarar variables en la forma (ejemplos): **mivariable[@bool] // Declara una variable que solo admite 1 o 0 **  minumero  [@int] =10 /* Declara una variable que solo admite números enteros y la inicializa con el valor 10*/|
|-----------------|------------|
| @int |
| @number |
| @positive |
| @negative |
| @string |

Vea cómo se han declarado estas variables en el archivo functions.dkh

## Variables de configuración

| @exec_timeout | Contiene el tiempo en milisegundos que espera el intérprete por la respuesta de un proceso invocado con la función exec definida más adelante. |
|-----------------|----------------|
