# serialize.dkh

## Serialización y deserialización JSON

| **to.json**  Devuelve una cadena que representa al objeto dado (serializado) en formato JSON.  **to.json(referencia)** | **referencia** – Referencia a un objeto serializable|
|------------|-------------|
| **from.json** Devuelve una referencia a un objeto deserializado a partir de una cadena en formato JSON dada.  **from.json(cadena)** | **cadena** – Cadena en formato JSON|
| **to.jsonNet** Devuelve una cadena que representa al objeto dado (serializado) en formato JSON con información de tipos de .Net.  **to.jsonNet(referencia)** | **referencia** – Referencia a un objeto serializable|

## Deserialización XML y DKL
### Estructura global de configuración
La estructura (registro) @parseSettings definida en serialize.dkh permite configurar los nombres de los campos del registro resultante de la deserialización de código XML o DKL que puede ser manipulado en el modo imperativo de Devkron.

No modifique la estructura @parseSettings en el archivo serialize.dkh, en su lugar, realice los cambios en su propio programa para mantener la compatibilidad con versiones futuras.

### Funciones de deserialización

| **parse.xmlFile** Devuelve una referencia a un registro que corresponde al XML contenido en el archivo indicado.  **parse.xmlFile(archivo)** | **archivo** – Cadena que contiene el nombre y ruta de un archivo XML|
|-----------|-----------|
| **parse.xmlStr** Devuelve una referencia a un registro que corresponde al XML de la cadena dada.
parse.xmlStr(cadena)| **cadena** – Cadena que contiene código XML|
| **parse.dklFile** Devuelve una referencia a un registro que corresponde al código DKL contenido en el archivo indicado.  **parse.dklFile(archivo)** | **archivo** – Cadena que contiene el nombre y ruta de un archivo DKL|
| **parse.dklStr** Devuelve una referencia a un registro que corresponde al código DKL de la cadena dada. **parse.dklStr(cadena)** | **cadena** – Cadena que contiene código DKL|
