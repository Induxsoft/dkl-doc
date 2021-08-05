# Capítulo III – Funciones incorporadas

Las funciones incorporadas en el lenguaje no requieren que se incluya ninguna biblioteca porque están programadas en el núcleo del intérprete devkron.exe.

A diferencia de las funciones definidas por el programador o las que se definen en bibliotecas, las funciones incorporadas son las únicas que tienen en algunos casos, parámetros variables.

## Interoperabilidad .Net

Permiten extender las características del lenguaje mediante la interoperabilidad con la plataforma .Net (.Net Framework o .Net Core)

| **_import_library**  Carga un ensamblado y devuelve una referencia que apunta hacia él y que puede ser usada por otras funciones de interoperabilidad.  **_import_library(nombre_ensamblado)** | nombre_ensamblado – Cadena con el nombre cualificado o de archivo de un ensamblado .Net |
|-----------|-----------|
| **_new**  Devuelve una referencia a una instancia de un objeto de una clase de .Net **_new(tipo)**  _new(ensamblado, tipo)  **_new(tipo, argumentos)**  _new(ensamblado, tipo, argumentos) | **tipo – Cadena con el nombre completo de una clase de .Net**  ensamblado – Referencia a un ensamblado .Net cargado a través de la función _import_library. Si se omite, se asume que la clase pertenece a un ensamblado cargado intrínsecamente con el intérprete. argumentos – Es una lista de parámetros que serán pasados al constructor de la clase. |
| **_map_function**  Mapea un nombre de función disponible en Devkron hacia un método estático de una clase en un ensamblado .Net  **_map_function(ensamblado,  tipo,método, función, argumentos, retorno)** | **ensamblado – Referencia a un ensamblado .Net cargado a través de la función _import_library. Si es -1 se asume que el ensamblado está intrínsecamente cargado por el intérprete.**  tipo – Cadena con el nombre completo de una clase de .Net que pertenece al ensamblado indicado.  **método – Cadena con el nombre del método estático de la clase indicada por tipo.**  función – Cadena con el nombre que tendrá la función mapeada al método.  **argumentos – Cadena que indica los tipos de .Net que corresponden a la firma del método, deben delimitarse con comas.**  retorno – Cadena que indica el tipo del resultado, se admiten los siguientes: void– El método no devuelve nada, $-El método devuelve una cadena, #-El método devuelve un valor numérico o *-El método devuelve un objeto y se tratará como referencia. |
| **_set**  Establece el valor de una propiedad de un objeto.  **_set(referencia, propiedad, valor)** | **Referencia – Una referencia al objeto al que pertenece la propiedad**  propiedad – Una cadena con el nombre de la propiedad a establecer. Si termina con el carácter * se asume que el parámetro valor es una referencia a otro objeto.  **valor-Una cadena, número o referencia que será asignada a la propiedad.**|
| **_get**  Obtiene el valor de una propiedad de un objeto.  **_get(referencia, propiedad)** |**Referencia – Una referencia al objeto al que pertenece la propiedad**  propiedad – Una cadena con el nombre de la propiedad a establecer. El nombre de la propiedad debe estar precedido por alguno de los siguientes caracteres de especificación de tipo: $ - El retorno se asume una cadena, #- El retorno se asume un número o & - El retorno se asume una referencia a un objeto.|
| **_invoke**  Invoca a un método de instancia que haya sido mapeado por _map_function y devuelve lo que corresponda.  **_invoke(referencia, función_mapeada, argumentos...)**| **Referencia – Es una referencia al objeto (instancia de clase) al que se invocará el método.**  función_mapeada – Es una cadena con el nombre de la función que previamente se mapeo con _map_function.  **argumentos – Es una lista de argumentos que coinciden con los de la función mapeada.**|
| **_gettype**  Devuelve una referencia a un objeto System.Type que corresponde al tipo indicado.  **_gettype(tipo)**  _gettype(ensamblado, tipo)| **Ensamblado – Referencia a un ensamblado cargado con _load_library, si se omite se asume un ensamblado cargado intrínsecamente por el intérprete.**  Tipo – Cadena con el nombre completo del tipo (clase) del cual se desea obtener una referencia a su tipo|

## Depuración

Permiten conocer el estado interno del intérprete en tiempo de ejecución
| **dump_vars**  Devuelve una cadena con la lista de variables locales inicializadas.  **dump_vars()**| Sin argumentos|
|-----------|-----------|
| **dump_gvars**  Devuelve una cadena con la lista de variables globales inicializadas.| Sin argumentos|
| **dump_objects**  Devuelve una cadena con información de la tabla de referencias a objetos.  **dump_objects()**|Sin argumentos|

## Manejo de errores

Permiten obtener información acerca de errores o excepciones ocurridas en tiempo de ejecución.

| **last_error**  Devuelve una cadena con el último mensaje de error ocurrido.  **last_error()** |Sin argumentos|
|-----------|-----------|
| **last_error_code**  Devuelve el número (código numérico) del último error ocurrido.  **last_error_code()**|Sin argumentos|
| **rise_error**  Desencadena una excepción (error)  **rise_error(código, mensaje)**| código – Número (código) del error
mensaje – Cadena con el mensaje de error|
| **clear_exceptions**  Limpia la pila de excepciones del intérprete  **clear_exceptions()**| Sin argumentos|
| **pop_exception**  Devuelve una referencia a la última excepción y la saca de la pila del intérprete.  **pop_exception()**| Sin argumentos|

## Sistema

|**runscript**   Ejecuta un programa DKL y devuelve el árbol de resultados como una cadena.   **runscript(programa, nombre_variable, referencia)**| **programa** – Cadena con la ruta y nombre del archivo dkl a ejecutal  **nombre_variable** – Cadena con el nombre de la variable global (sin incluir el carácter @) que apuntará a la referencia indicada.  **referencia** – Referencia a un objeto que será pasado al programa que se ejecutará con el nombre de variable indicado|
|-----------|-----------|
| **eval**  Evalúa la expresión DKL válida y devuelve el resultado   **eval(expresión)**| expresión – Es una cadena que contiene una expresión a ser evaluada.|
| **fxml**   Devuelve la salida XML del árbol de resultados al momento de la llamada como una cadena de texto y limpia el buffer interno del intérprete.  **fxml()**  fxml(argumentos)| argumentos – Es una lista de argumentos variable cuyas expresiones serán evaluadas antes de devolver el resultado. |
| **ftext**  Devuelve el texto con las marcas de inyección de expresiones evaluadas.  **ftext(texto)**| texto – Cadena que contiene inyecciones de expresiones.|
| **isset**  Devuelve cierto si la variable indicada ha sido declarada.  **isset(nombre_variable)**| nombre_variable – Es una cadena con el nombre de una variable.|
| **isnull**   Devuelve cierto si la referencia indicada apunta hacia un objeto null.  **isnull(referencia)**| referencia – Referencia a un objeto|
| **ifnull**  Devuelve el segundo argumento si el primero es una referencia null o el mismo primero si no lo es.  **ifnull(referencia, ref_default)**| **referencia** – Es una referencia a un objeto que será evaluada  **ref_default** – Es una referencia a un objeto que será devuelto en cado de que referencia sea null|
| **_null**  Devuelve una nueva referencia hacia un objeto null.  **_null()** | Sin argumentos|
| **_free**  Libera los recursos asociados a una referencia  **_free(referencia)**| referencia – Una variable de referencia que apunta a un objeto|

## Consola

| **print**  Imprime en la consola un texto y agrega una secuencia de fin de línea  **print(texto)**| texto – Cadena de texto a imprimir en la consola|
|-----------|-----------|
| **input**  Lee una secuencia de caracteres de la consola hasta que se recibe un Enter y la devuelve como una cadena  **input()**  input(texto)| texto – Cadena que se imprime antes de esperar por la entrada de consola|
| **stdin**  Lee toda la entrada de consola (hasta el final del buffer) y la devuelve como una cadena.  **stdin()**| Sin argumentos|
| **write**  Escribe una cadena de texto en la consola sin la secuencia de fin de línea.  **write(texto)**| texto – Cadena de texto a imprimir|
| **write_utf8**  Escribe una cadena de texto en la consola con codificación utf8 independientemente de la establecida en la configuración del sistema.  **write_utf8(texto)**| texto – Cadena de texto a imprimir|
| **write_bytes**  Escribe los bytes directamente a la consola.  **write_bytes(bytes)**| bytes – Referencia a un array de bytes de .Net|

## Matemáticas 

| **sqr**  Devuelve la raíz cuadrada de un número  **sqr(número)**| número – Número|
|-----------|-----------|
| **abs**  Devuelve el valor absoluto de un número  **abs(número)**| número – Número|
| **round**  Devuelve un número redondeado a la cantidad de decimales indicado  **round(número, decimales)**| **número** – Número a redondear **decimales** – Número que indica la cantidad de decimales a los que se redondeará.|
| **rnd**  Devuelve un número aleatorio  **rnd(min, max)**| **min** – Número límite inferior del rango de números aleatorios  **max** – Número límite superior del rango de números aleatorios|
| **exp**  Devuelve un número elevado a una potencia  **exp(número, potencia)**| **número** – Número que será elevado  **potencia** – Número de la potencia a la cual elevar|
| **sen**  Devuelve el seno de un ángulo expresado en radianes  **sen(ángulo)**| **ángulo** – Número que expresa un ángulo en radianes|
| **cos**  Devuelve el coseno de un ángulo expresado en radianes  **cos(ángulo)**| **ángulo** – Número que expresa un ángulo en radianes|
| **tan**  Devuelve la tangente de un ángulo expresado en radianes  **tan(ángulo)**| **ángulo** – Número que expresa un ángulo en radianes|
| **mod**  Devuelve el residuo de una división  **mod(número, denominador)**| **número** – Número a dividir **denominador** – Número denominador de la división|
| **div**  Devuelve el resultado de una división o cero si el dividendo o el divisor son cero sin generar un error de división por cero.  **div(número, denominador)**| **número** – Número a dividir  **denominador** – Número denominador de la división|
| **divlng**  Devuelve la parte entera de una división considerando al dividendo y divisor como enteros  **cociente(número, denominador)**| **número** – Número a dividir  **denominador** – Número denominador de la división|
| **log**  Devuelve el logaritmo de un número  **log(número, base)**| **número** - Valor numérico del que se calculara el logaritmo  **base** - Valor numérico base al cual se elevará el logaritmo|
| **trun**  Devuelve la parte entera de un número  **trun(número)**| número – Número|
| **dec**  Devuelve la parte fraccionaria de un número  **dec(número)**| número – Número|

## Lógicas

| **not**  Devuelve el resultado de la operación lógica NOT sobre el valor booleano indicado  **not(número)**| **número** – Número que se considera cierto si es diferente de cero y falso en cualquier otro caso.|
|-----------|-----------|
| **or**  Devuelve el resultado de la operación lógica OR sobre dos valores booleanos dados  **or (valor1, valor2)**| **valor1** – Número que se considera cierto si es diferente de cero y falso en cualquier otro caso.  **valor2** – Número que se considera cierto si es diferente de cero y falso en cualquier otro caso.|
| **and**  Devuelve el resultado de la operación lógica AND sobre dos valores booleanos dados  **and(valor1,valor2)**| **valor1** – Número que se considera cierto si es diferente de cero y falso en cualquier otro caso.**valor2** – Número que se considera cierto si es diferente de cero y falso en cualquier otro caso.|
| **if**  Devuelve el valor numérico del segundo argumento de la función si el resultado de la evaluación del primer argumento es cierto o el valor numérico del tercer argumento en caso contrario.  **if(expresión, cierto, falso)**| **expresión** – Número que será evaluado  **cierto** – Número  **falso** – Número|
| **ifstr**  Devuelve el valor de cadena del segundo argumento de la función si el resultado de la evaluación del primer argumento es cierto o el valor de cadena del tercer argumento en caso contrario.  **ifstr(expresión, cierto, falso)**| **expresión** – Número que será evaluado  **cierto** – Cadena  **falso** – Cadena|

## Conversiones

| **str**  Devuelve una cadena que representa al número dado.  **str(número)**| **número** – Número que será convertido en cadena|
|-----------|-----------|
| **val**  Devuelve un número que equivale al expresado como cadena dada.  **val(cadena)**| **cadena**- Cadena que será convertida a número|

## Fecha y hora

DKL ofrece un mecanismo sencillo para manejar valores de fecha y hora que consiste en tratar los valores como números decimales, en los que la parte entera representa a la fecha y la parte decimal a la hora. No hay representación de zona horaria.

Por ejemplo: 

La fecha 23 de Noviembre del año 2023 se representa como el número **20231123**

La fecha y hora 5 de Septiembre de 2007 a las 20:35:23 sería **20070905.203523**

|||
|-----------|-----------|
|||
|||
|||
|||
|||
|||
|||
