## Ayudantes de interfaz de usuario HTML y bases de datos

Cuando se construyen sitios Web que interactúan con bases de datos, existen tareas repetitivas que pueden añadir complejidad innecesaria al código.

El archivo de biblioteca uielements.dkl que forma parte del marco de trabajo [dkl-web](https://github.com/Induxsoft/dkl-web) ofrece las siguientes:

### Funciones en uielements.dkl

#### uie.dbSelect
Genera el HTML de un campo de entrada (input) Select con los datos de una consulta SQL.

``` Devkron
do uie.dbSelect(params)
```
params - Es una estructura con los siguientes campos:

```
using params
{
  //Miembros requeridos (deben establecerse)
  @"db*":objDB            // Referencia a un objeto de conexión a bases de datos abierto
  @"source":"Select ..."  // Consulta SQL que devolverá una tabla
  @"parameters*":obj      // Referencia a un registro que contiene los parámetros a pasar a la consulta
  @"value_field":""       // Nombre del campo (columna) de la tabla resultante de la consulta SQL que se usará como valor para los elementos
  @"text_field":""        // Nombre del campo (columna) de la tabla resultante de la consulta SQL que se usará como texto visible para los elementos
  
  //Miembros opcionales y sus valores predeterminados (no necesita establecerlos)
  @"selected":""          // El valor del elemento que aparecerá como seleccionado al renderizar
                             el control.
  
  @"datatable*": objTabla /* Si se establece esta referencia antes de la llamada a uie.dbSelect
                             como un objeto de tabla no nulo, no se ejecutará la consulta y se 
                             utilizarán los datos contenidos.
                             
                             Tras la llamada a uie.dbSelect, este miembro siempre contendrá la
                             tabla de datos usada.*/
                             
  @"first_value":"" //Indica el valor que corresponderá a un primer elemento de la lista de opciones, adicional a los que se obtienen de la base de datos
  @"first_text":"" //Indica el texto que mostrará el primer elemento de la lista de opciones, adicional a los que se obtienen de la base de datos
  
  member @"attributes"
  {
    @"class":"claseCSS" //Por ejemplo indicar una clase CSS
    //Cada campo dentro de este miembro será añadido como atributo al elemento raíz del control
  }
  
  @"element":"select" // Nombre de elemento HTML
  
}
```

#### uie.iterator

Itera las filas de una tabla (obtenida a través de una consulta a una base de datos generalmente), permitiendo generar elementos HTML y manteniendo totalizaciones por agrupaciones y en general.

``` DKL
do uie.iterator(params)
```

params - Es una estructura con los siguientes campos:

```
using params
{
  //Miembros requeridos (deben establecerse)
  @"db*":objDB            // Referencia a un objeto de conexión a bases de datos abierto
  @"source":"Select ..."  // Consulta SQL que devolverá una tabla
  @"parameters*":obj      // Referencia a un registro que contiene los parámetros a pasar a la consulta
 
  //Miembros opcionales y sus valores predeterminados (no necesita establecerlos)
  
  @"group_by":""          //Indica el nombre de la columna por la que se agruparán los datos
  
  //Este miembro contiene la configuración de columnas
  member @columns
  {
    member @"nombre_columna" 
    {
        @"summary":""     //Es una de las siguientes cadenas: sum max min avg count    
    }
  }
   
  @"build_array": @false  // Si se establece en @true guardará una lista de filas que puede 
                          // serializarse a JSON desde el miembro array_data
                          
  @"array_data":@null     // Después de la ejecución de uie.iterator contiene una referencia a 
                          // un array de filas si build_array==@true
  
  @"datatable*": objTabla /* Si se establece esta referencia antes de la llamada a uie.iterator
                             como un objeto de tabla no nulo, no se ejecutará la consulta y se 
                             utilizarán los datos contenidos.
                             
                             Tras la llamada a uie.iterator, este miembro siempre contendrá la
                             tabla de datos usada.*/
                             
  @"summaries*":@null     // Después de la ejecución de uie.iterator, si se han indicado totalizaciones,
                          // contiene una referencia a una estructura con los totales generales y por agrupación
                          
  // Los siguientes miembros son referencias a funciones definidas por el programador 
  // que serán invocadas para generar el contenido
  
  @"head*":func           // func - Es una referencia a una función que se invoca 
                          // al empezar la iteración
                          
  @"begin_group*":func    // func - Es una referencia a una función que se invoca 
                          // al empezar una agrupación                        
  
  @"each_row*":func       // func - Es una referencia a una función que se invoca 
                          // por cada fila de la tabla de datos
                          
  @"summary_group*":func  // func - Es una referencia a una función que se invoca 
                          // al terminar una agrupación

  @"summary*":func        // func - Es una referencia a una función que se invoca 
                          // al terminar toda la iteración
}
```

### Funciones en uielements.dbtable.dkl

El archivo de biblioteca uielements.dbtable.dkl que forma parte del marco de trabajo [dkl-web](https://github.com/Induxsoft/dkl-web) ofrece las siguientes funciones:

#### uie.dbTable

