# Funciones

## Registros (estructuras)

|**field.remove**  Elimina el campo indicado del registro y devuelve @true si tuvo éxito.  **field.remove(registro,campo)** | **registro** – Referencia a un registro (estructura)  **campo** – Cadena que identifica el nombre del campo a eliminar, se admite la notación de rutas “campo/campo/campo” para acceder a miembros dentro de otros miembros.|
|------------|-----------|
| **field.exist**  Devuelve @true si el campo indicado existe en el registro.  **field.exist(registro,campo)**| **registro** – Referencia a un registro (estructura)  **campo** – Cadena que identifica el nombre del campo a buscar, se admite la notación de rutas “campo/campo/campo” para acceder a miembros dentro de otros miembros.|
| **field.typeof**  Devuelve un valor numérico que indica el tipo del campo especificado. Los posibles valores de retorno son:  **1 – El campo es de tipo cadena, **  2- El campo es de tipo numérico,**  3- El campo es una referencia o   **0 – El campo no existe.**  field.typeof(registro,campo)| **registro** – Referencia a un registro (estructura)  **campo** – Cadena que identifica el nombre del campo a buscar, se admite la notación de rutas “campo/campo/campo” para acceder a miembros dentro de otros miembros.|
| **field.num**  Devuelve el valor numérico de un campo, si no existe se produce un error, si el campo no es de tipo numérico se intenta realizar la conversión automáticamente.  **field.num(registro,campo)**| **registro** – Referencia a un registro (estructura)  **campo** – Cadena que identifica el nombre del campo a devolver, se admite la notación de rutas “campo/campo/campo” para acceder a miembros dentro de otros miembros.|
| **field.str**  Devuelve el valor de cadena de un campo, si no existe se produce un error, si el campo no es de tipo cadena se intenta realizar la conversión automáticamente.  **field.str(registro,campo)**| **registro** – Referencia a un registro (estructura)  **campo** – Cadena que identifica el nombre del campo a devolver, se admite la notación de rutas “campo/campo/campo” para acceder a miembros dentro de otros miembros.|
| **field.obj**  Devuelve una referencia al valor del campo indicado, si no existe se produce un error.  **field.obj(registro,campo)**| **registro** – Referencia a un registro (estructura)  **campo** – Cadena que identifica el nombre del campo a devolver, se admite la notación de rutas “campo/campo/campo” para acceder a miembros dentro de otros miembros.|
| **field.dnum**  Devuelve el valor numérico de un campo, si el campo no es de tipo numérico se intenta realizar la conversión automáticamente, si no existe devuelve el valor predeterminado por defaul.  **field.dnum(registro,campo,default)**| **Registro** – Referencia a un registro (estructura)  **campo** – Cadena que identifica el nombre del campo a devolver, se admite la notación de rutas “campo/campo/campo” para acceder a miembros dentro de otros miembros.  **default** – Número que será devuelto si el campo no existe.|
| **field.dstr**  Devuelve el valor de cadena de un campo, si el campo no es de tipo cadena se intenta realizar la conversión automáticamente, si no existe devuelve el valor predeterminado por defaul.  **field.dstr(registro,campo,default)**| **registro** – Referencia a un registro (estructura)  **campo** – Cadena que identifica el nombre del campo a devolver, se admite la notación de rutas “campo/campo/campo” para acceder a miembros dentro de otros miembros.  **default** – Cadena que será devuelta si el campo no existe.|
| **field.dobj**  Devuelve una referencia al valor  de un campo, si no existe el campo devuelve la referencia predeterminada por defaul.  **field.dstr(registro,campo,default)**| **registro** – Referencia a un registro (estructura)  **campo** – Cadena que identifica el nombre del campo a devolver, se admite la notación de rutas “campo/campo/campo” para acceder a miembros dentro de otros miembros. **default – Referencia que será devuelta si el campo no existe.**|
| **record.create** Devuelve una referencia a  un nuevo registro.  **record.create()**| Sin argumentos|
| **record.clear**  Elimina todos los campos de una estructura.  **record.clear(registro)**| **registro** – Referencia a un registro (estructura)|
| **record.copy**  Devuelve un nuevo registro con una copia de los campos indicados.  **record.copy(origen,campos)**| **origen** – Referencia a un registro  **campos** – Cadena con la lista de nombres de campos a copiar al nuevo registro delimitados por comas, si se establece únicamente el carácter * se copian todos los campos.|
| **record.copyex**  Devuelve un nuevo registro con una copia de los campos indicados renombrados.  **record.copyex(origen, campos, delimitador, alias, delimitadoralias)**| **origen** – Referencia a un registro  **campos** – Cadena con la lista de nombres de campos a copiar al nuevo registro delimitados por el carácter indicado por delimitador.  **delimitador** – Cadena con el carácter que usa el parámetro anterior para delimitar los campos a copiar  **alias** – Cadena con la lista de nombres de campos que tendrán los campos enumerados por campos en el registro copiado.  **delimitadoralias** - Cadena con el carácter que usa el parámetro anterior para delimitar los alias  **La lista de campos de campos y alias deben tener el mismo número de elementos.**|
| **record.caseinsensitive**  Devuelve una referencia a una copia del registro pero con insensibilidad a mayúsculas o minúsculas para los nombres de campos.  **record.caseinsensitive(registro)**| **registro** – Referencia a un registro  **En DKL los registros son de manera predeterminada insensibles a mayúsculas/minúsculas en sus campos, esta función no es usada generalmente.**|

## Listas

Las listas no son una estructura nativa del lenguaje Devkron, por lo que se implementan a través de objetos que implementan System.Collections.Generic.IList con estas funciones.

Las listas tienen índice base cero.

| **list.create**  Devuelve una referencia a una nueva instancia de un objeto de lista.  **list.create ()**| Sin argumentos|
|----------------|----------------|
| **list.create_from_fields**  Devuelve una referencia a una nueva lista formada por los nombres de todos los campos de un registro.  **list.create_from_fields(registro)**| registro – Referencia a un registro (estructura)|
| **list.count**  Devuelve la cantidad de elementos de una lista.  **list.count(lista)**| lista – Referencia a una lista|
| **list.add**  Agrega un elemento a la lista  **list.add(lista, elemento)**| **lista** – Referencia a una lista  **elemento** – Cadena, número o referencia a agregar a la lista|
| **list.ins**  Inserta un elemento en la posición especificada de la lista  **list.ins(lista, posición, elemento)**| **lista** – Referencia a una lista  **posición** – Número que indica la posición en la que se va a insertar el elemento  **elemento** – Cadena, número o referencia a insertar a la lista|
|||
|||
|||
|||
|||
|||


|||
|------------------|----------------|
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
