## Utilidades de generación de interfaz de usuario HTML enlazada a datos

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
  @"id":""                // Atributo id de HTML (si se omite se usará una GUID)
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

``` DKL
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
        @"summary":""     //Es una de las siguientes cadenas: sum max min avg count    (opcional)
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
La función uie.dbTable se basa en uie.iterator, por lo que deberá incluir también la biblioteca uielements.dkl en su programa.

uie.dbTable permite producir el HTML de una tabla con los datos resultantes de una consulta SQL.

``` DKL
do uie.dbTable(params)
```

params - Es una estructura de parámetros igual a la que se emplea en uie.iterator más algunos miembros específicos.

``` DKL
using params
{
  //Miembros requeridos (deben establecerse)
  @"db*":objDB            // Referencia a un objeto de conexión a bases de datos abierto
  @"source":"Select ..."  // Consulta SQL que devolverá una tabla
  @"parameters*":obj      // Referencia a un registro que contiene los parámetros a pasar a la consulta
 
  //Miembros opcionales y sus valores predeterminados (no necesita establecerlos)
  
  @"id":""                // Atributo id de HTML (si se omite se usará una GUID)
  @"group_by":""          //Indica el nombre de la columna por la que se agruparán los datos
  
  //Este miembro contiene la configuración de columnas, 
  //si se omite se muestran todas las columnas de la consulta
  member @columns
  {
    member @"nombre_columna" // Un miembro por cada columna
    {
        @"caption":""     // Título de la columna (opcional)
        @"field": ""      // Nombre del campo (opcional) si el nombre de la columna es diferente
        @"summary":""     // Es una de las siguientes cadenas: sum max min avg count    (opcional)
        @"format":""      // Una cadena de formato al estilo de C# para la representación de números ( p.e. #,#.00 ) (opcional)
        
        member @"attributes"  // Atributos para todas las celdas de la columna (opcional)
        {
          @"class": "clase CSS" // Aquí se definen como campos de cadena (par/valor)
        }
    }
  }
  
  @"show_summary_group":@true    // Si es @false, no se genera el total de grupos
  @"show_summary":@true          // Si es @false, no se genera el total general de la tabla 
  
  // Atributos para los diferentes tipos de filas
  member @"rows_attributes"
  {
      // Atributos para la fila de encabezados de la tabla
      member @"header"
      {
          @"class":"claseCSS" //Ejemplo
      }
      
      // Atributos para la fila de inicio de grupo
      member @"begin_group"
      {
          @"class":"claseCSS" //Ejemplo
      }
      
      // Atributos para cada fila de datos
      member @"detail"
      {
          @"class":"claseCSS" //Ejemplo
      }
      
      // Atributos para la fila de fin de grupo
      member @"summary_group"
      {
          @"class":"claseCSS" //Ejemplo
      }
      
      // Atributos para la fila de totales generales
      member @"summary"
      {
          @"class":"claseCSS" //Ejemplo
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
                          
  // Eventos - Los siguientes miembros si se establecen con referencias a funciones,
  // permiten manejar los eventos que ocurren durante la generación del HTML
  
  @"before_row*": func    // Una referencia a una función del programador que se inocará
                          // antes de generar cada fila
  
  @"before_cell*": func   // Una referencia a una función del programador que se inocará
                          // antes de generar cada celda  
                          
  @"after_cell*": func    // Una referencia a una función del programador que se inocará
                          // después de generar cada fila
  
  @"after_row*": func     // Una referencia a una función del programador que se inocará
                          // después de generar cada fila
  
}
```

#### Eventos manejables al generar tablas
Las funciones que se utilicen como manejadores de los eventos before_row y after_row deben tener el siguiente prototipo:

``` DKL
manejador_evento:: &params, &row
{

}

```
Donde:
* params - Es una referencia al objeto de parámetros recibido en uie.dbTable
* row - Es una referencia a una estructura que contiene información de la fila

``` DKL
using row
{
  // Estos miembros los establece la función uie.dbTable antes de llamar a los manejadores de eventos
  
  @"_row_type":"" // Una cadena que indica el tipo de fila: 
                  // 'header' 'header_group' 'summary_group' 'header_group' 'detail' 'summary'
  @"_row_index:0  // El índice base cero de la fila que se está procesando 
  
  //Todos as columnas de datos de la fila que se está procesando se incluyen también
  
  @"_abort":@false  // Si dentro del manejador de eventos se establece en @true, 
                    // se aborta el procesamiento de la fila (solo tiene sentido en before_row).
  
}
```

Las funciones que se utilicen como manejadores de los eventos before_cell y after_cell deben tener el siguiente prototipo:

``` DKL
manejador_evento:: &params, &row, &cell
{

}

```
Donde:
* params - Es una referencia al objeto de parámetros recibido en uie.dbTable
* row - Es una referencia a una estructura que contiene información de la fila
* cell - Es una referencia a una estructura que contiene información de la celda

``` DKL
using cell
{
  // Estos miembros los establece la función uie.dbTable antes de llamar a los manejadores de eventos
  
  @"text":""      // La cadena de texto (o html) que se imprimirá dentro de la celda
                  
  @"field:""        // Nombre del campo de la consulta que se está procesando
  @"column:""       // Nombre del campo de la columna que se está procesando
  @"cell_type":""   // Alguno de los siguientes tipos de celdas: 'header' 'header_group' 'data' 'summary_group' 'summary'
  
  @"element":""     // Elemento HTML de la celda, automáticamente para los encabezados se usa th 
                    // y para el resto td o lo que se pudiera establecer en before_cell
                     
  @"_abort":@false  // Si dentro del manejador de eventos se establece en @true, 
                    // se aborta el procesamiento de la celda (solo tiene sentido en before_cell).
  
}
```


