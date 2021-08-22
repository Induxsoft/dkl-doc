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

#### Agregar espacios de nombres XML predeterminados
En ocasiones es posible que el contenido XML que intenta deserializar no incluya las declaraciones de prefijos y sus espacios de nombres (generalmente porque está trabajando con una porción de un documento).

Para evitar que el parser (basado en System.Xml.XmlDocument) falle, puede agregar los prefijos en la estructura de configuración @parseSettings de la siguiente manera antes de llamar a parse.XmlStr o parse.XmlFile:

``` DKL
using @parseSettings
{
    member @"xml_prefixes"
    {
        @"prefijo":"https://espacio_de_nombres_del_prefijo"
    }
}
```


### Funciones de deserialización

| **parse.xmlFile** Devuelve una referencia a un registro que corresponde al XML contenido en el archivo indicado.  **parse.xmlFile(archivo)** | **archivo** – Cadena que contiene el nombre y ruta de un archivo XML|
|-----------|-----------|
| **parse.xmlStr** Devuelve una referencia a un registro que corresponde al XML de la cadena dada.
parse.xmlStr(cadena)| **cadena** – Cadena que contiene código XML|
| **parse.dklFile** Devuelve una referencia a un registro que corresponde al código DKL contenido en el archivo indicado.  **parse.dklFile(archivo)** | **archivo** – Cadena que contiene el nombre y ruta de un archivo DKL|
| **parse.dklStr** Devuelve una referencia a un registro que corresponde al código DKL de la cadena dada. **parse.dklStr(cadena)** | **cadena** – Cadena que contiene código DKL|

### Generar XML a partir de una estructura de deserialización
Si ha obtenido una estructura que representa un árbol XML o DKL, puede formar el Xml usando la función to.Xml

#### to.Xml

``` DKL
cad=to.Xml(data)
```
Donde:

* cad - Es la cadena que contendrá el XML resultante
* data - Es una referencia a un registro con la estructura que representa el árbol en la forma como parse.XmlStr, parse.XmlFile, parse.dklFile y parse.dklStr deserializan el contenido XML o DKL


