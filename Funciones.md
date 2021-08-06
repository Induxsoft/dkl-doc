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
| **list.set**  Establece un elemento en la posición indicada  **list.set(lista, posición, elemento)**| **lista** – Referencia a una lista  **posición** – Número que indica la posición en la que se va a reemplazar el elemento  **elemento** – Cadena, número o referencia a colocar en la lista|
| **list.obj**  Devuelve una referencia al valor en la posición indicada de la lista  **list.obj(lista, posición)**| **lista** – Referencia a una lista  **posición** – Índice base cero del elemento cuya referencia va a devolverse|
| **list.str**  Devuelve como cadena el valor de la posición indicada de la lista  **list.str(lista, posición)**| **lista** – Referencia a una lista  **posición** – Índice base cero del elemento que se va a devolver como cadena|
| **list.num**  Devuelve como número el valor de la posición indicada de la lista  **list.num(lista.posición)**| **lista** – Referencia a una lista  **posición** – Índice base cero del elemento que se va a devolver como número|
| **list.del**  Elimina el elemento de la lista en la posición indicada  **list.del(lista, posición)**| **lista** – Referencia a una lista  **posición** – Índice base cero del elemento que se va a eliminar|
| **list.clear**  Elimina todos los elementos de la lista   **list.clear(lista)**| **lista** – Referencia a una lista|

## Tablas

Las tablas (en memoria) se implementan a través de las clases de System.Data.DataTables con estas funciones para crear y manipular estructura y datos.

| **table.rows**  Devuelve la cantidad de filas de una tabla  **table.rows(tabla)**| **tabla** – Referencia a una tabla|
|----------------|------------------|
| **table.cols**  Devuelve la cantidad de columnas de una tabla  **table.cols(tabla)**| **tabla** – Referencia a una tabla|
| **cell.num**  Devuelve el valor numérico de una celda ubicada en la posición de fila y columna indicada  **Si la celda es DBNull se produce una excepción**  cell.num(tabla, fila, columna)| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Número que representa el índice base cero de una columna de la tabla|
| **cell.numc**  Devuelve el valor numérico de una celda ubicada en la posición de fila y columna indicada por nombre  **Si la celda es DBNull se produce una excepción**  cell.numc(tabla, fila, columna)| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Cadena con el nombre de una columna de la tabla|
| **cell.dnum**  Devuelve el valor numérico de una celda ubicada en la posición de fila y columna indicada  **Si la celda es DBNull devuelve el valor indicado como predeterminado**  cell.dnum(tabla, fila, columna, default)| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Número que representa el índice base cero de una columna de la tabla  **default** – Valor que será devuelto si la celda indicada es DBNull|
| **cell.dnumc**  Devuelve el valor numérico de una celda ubicada en la posición de fila y columna indicada por nombre  **Si la celda es DBNull devuelve el valor indicado como predeterminado**  cell.dnumc(tabla, fila, columna, default)| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Cadena con el nombre de una columna de la tabla  **default** – Valor que será devuelto si la celda indicada es DBNull|
| **cell.str**  Devuelve el valor de cadena de una celda ubicada en la posición de fila y columna indicada  **Si la celda es DBNull se produce una excepción**  cell.str(tabla, fila, columna)| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Número que representa el índice base cero de una columna de la tabla|
| **cell.strc**  Devuelve el valor de cadena de una celda ubicada en la posición de fila y columna indicada por nombre  **Si la celda es DBNull se produce una excepción**  cell.strc(tabla, fila, columna)| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Cadena con el nombre de una columna de la tabla|
| **cell.dstr**  Devuelve el valor de cadena de una celda ubicada en la posición de fila y columna indicada  **Si la celda es DBNull devuelve el valor indicado como predeterminado**  cell.dstr(tabla, fila, columna,default)| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Número que representa el índice base cero de una columna de la tabla  **default** – Valor que será devuelto si la celda indicada es DBNull|
| **cell.dstrc**  Devuelve el valor de cadena de una celda ubicada en la posición de fila y columna indicada por nombre  **Si la celda es DBNull devuelve el valor indicado como predeterminado**  cell.dstrc(tabla, fila, columna,default)| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Cadena con el nombre de una columna de la tabla  **default** – Valor que será devuelto si la celda indicada es DBNull|
| **cell.obj**  Devuelve una referencia al valor de una celda ubicada en la posición de fila y columna indicada  **cell.obj(tabla, fila, columna)**| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Número que representa el índice base cero de una columna de la tabla|
| **cell.objc**  Devuelve una referencia al valor de una celda ubicada en la posición de fila y columna indicada por nombre.  **cell.objc(tabla, fila, columna)**| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Cadena con el nombre de una columna de la tabla|
| **col.caption**  Establece el título de la columna indicada por su índice  **col.caption(tabla, columna, titulo)**| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Número que representa el índice base cero de una columna de la tabla  **titulo** – Cadena con el título que se asignará a la columna|
| **col.captionc**  Establece el título de la columna indicada por su nombre  **col.captionc(tabla, columna, titulo)**| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Cadena con el nombre de una columna de la tabla  **titulo** – Cadena con el título que se asignará a la columna|
| **col.get**  Devuelve una referencia al objeto subyacente a la columna indicada por su índice  **col.get(tabla, columna)**| **tabla** – Referencia a una tabla  **columna** – Número que representa el índice base cero de una columna de la tabla|
| **col.getc**  Devuelve una referencia al objeto subyacente a la columna indicada por su nombre  **col.get(tabla, columna)**| **tabla** – Referencia a una tabla  **columna** – Cadena con el nombre de una columna de la tabla|
| **row.get**  Devuelve una referencia a un registro que contiene todos los datos de la fila indicada.  **row.get(tabla, fila)**| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla|
| **cell.set**  Establece el valor de una celda de la tabla por el índice de su fila y columna  **cell.set(tabla, fila, columna, valor)**| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Número que representa el índice base cero de una columna de la tabla  **valor** – Cadena, número o referencia que será asignada a la celda indicada|
| **cell.setc**  Establece el valor de una celda de la tabla en la fila y columna indicada por nombre  **cell.setc(tabla, fila, columna, valor)**| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **columna** – Cadena con el nombre de una columna de la tabla  **valor** – Cadena, número o referencia que será asignada a la celda indicada|
| **table.create**  Devuelve una referencia hacia una nueva tabla con las columnas correspondientes a los campos del registro indicado  **table.create(registro)**| **registro** – Referencia a un registro cuyos nombres y tipo de campos serán usados para definir las columnas de una tabla nueva|
| **table.new**  Devuelve una referencia hacia una tabla vacía| Sin argumentos|
| **row.del**  Elimina la fila indicada  **row.del(tabla,fila)**| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla|
| **row.add**  Agrega los datos del registro indicado como una nueva fila al final de la tabla, los nombres de los campos del registro deben coincidir con los nombres de las columnas.  **row.add(tabla, registro)**| **tabla** – Referencia a una tabla  **registro** – Referencia a un registro cuyos datos de campos se agregarán a la tabla como una nueva fila|
| **row.ins**  Inserta los datos del registro indicado como una nueva fila en la posición señalada de la tabla, los nombres de los campos del registro deben coincidir con los nombres de las columnas.  **row.ins(tabla,fila, registro)**| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **registro** – Referencia a un registro cuyos datos de campos se insertarán a la tabla como una nueva fila|
| **row.upd**  Actualiza los datos del registro indicado en la fila señalada de la tabla, los nombres de los campos del registro deben coincidir con los nombres de las columnas.  **row.upd(tabla, fila, registro)**| **tabla** – Referencia a una tabla  **fila** – Número que representa el índice base cero de una fila en la tabla  **registro** – Referencia a un registro cuyos datos de campos actualizarán los de la tabla en la fila indicada|
| **table.pivot**  Devuelve una referencia a una nueva tabla que contiene la representación transversal de otra.  **table.pivot(tabla, x, y, z, valor_nulo, sumar)**| **tabla** – Referencia a una tabla  **x,y,z** – Cadenas con los nombres de campos que serán usados como columnas de consolidación al “girar” la tabla, se requiere indicar al menos x, las demás pueden ser cadena vacía (“”)  **valor_nulo** – Cadena con el valor que será colocado en las celdas nulas, puede indicarse como cadena vacía(“”)  **sumar** – Numérico (booleano) si es @true se incluirá una fila adicional con las sumatorias de las columnas.|
| **table.from**  Deserializa una tabla a partir de una cadena y devuelve una referencia  **table.from(cadena)**| **cadena** – Cadena con código DKL que representa la tabla (generalmente obtenida con la función table.to)|
| **table.to**  Serializa una tabla y devuelve una cadena que la representa.  **table.to(tabla)**| **tabla** – Referencia a una tabla de la que se obtendrá su representación como cadena (código DKL)|

## Cadenas y textos

| **trim**  Devuelve una cadena sin los caracteres vacíos (espacio y tabulador) del inicio y final de la cadena dada  **trim(cad)**| cad – Cadena de texto|
|----------------|------------------|
| **ltrim**  Devuelve una cadena sin los caracteres vacíos (espacio y tabulador) del inicio de la cadena dada  **ltrim(cad)**| cad – Cadena de texto|
| **rtrim**  Devuelve una cadena sin los caracteres vacíos (espacio y tabulador) del final de la cadena dada  **rtrim(cad**| cad – Cadena de texto|
| left| **cad** – Cadena de texto  **omitir** – Número de caracteres|
| **right**  Devuelve una subcadena que inicia en la cantidad de caracteres indicados a partir del final de la cadena original.  **right(cad, antesfinal)** Devuelve una subcadena que omite los caracteres al inicio de la cadena original indicados.  **left(cad,omitir)**| **cad** – Cadena de texto  **antesfinal** – Número de caracteres|
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
|||
|||

## Fecha y hora

## Codificación y encriptación

## Archivos y carpetas

## Utilidades

```DKL
#include "dkli.dkh"
#!
 
program "ejemplo"
{
    #include "functions.dkh"
 
    new registro
    {
        @"nombre":"Juan"
        @"apellido1":"López"
        @"apellido2":"García"
        @"Identidad de género":"Hombre"
    }    
 
    go foreach.fstr(index:i,key:k, value:v) with(registro)
    {
        do print("Índice:"+str(i)+" clave:"+k + " valor:"+v)
    }
 
    ref lista=list.create()
 
    do list.add(lista,"Uno")
    do list.add(lista,"Dos")
    do list.add(lista,"Tres")
 
    go foreach.lstr(index:i, value:v) with(lista)
    {
        do print("Índice:"+str(i)+ " valor:"+v)
    }
 
}
```
