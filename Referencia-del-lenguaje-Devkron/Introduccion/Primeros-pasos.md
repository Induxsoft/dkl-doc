# Capítulo I – Introducción
El lenguaje Devkron, o simplemente DKL [Devkron Language] es declarativo; completamente traducible a XML; pero también imperativo y procedural.
DKL es un lenguaje interpretado cuya sintaxis se asemeja mucho al lenguaje C, por lo que el código es familiar para prácticamente cualquier programador, haciendo su aprendizaje y utilización más sencilla y natural. 
Además, incluye directivas de auto-definición de sintaxis que facilitan la codificación y elevan la productividad del desarrollador al permitirle ir adaptando el lenguaje a sus necesidades y preferencias.
DKL es multi-propósito y generalmente se emplea para construir sitios y servicios Web, programar procesos por lotes, generar documentos XML a partir de bases de datos relacionales, etc. 

## Ejecución de programas
Devkron.exe es el ejecutable por línea de comando del intérprete del lenguaje.  
Suponga que tiene el siguiente código en c:\mis programas\hola.dkl
```DKL
#include "dkli.dkh"
#!
program "hola"
{
    do print ("Hola mundo")    
}
```
Para ejecutarlo deberá escribir (Windows a través de IWA con .Net Framework):
```CMD
devkron.exe "c:\mis programas\hola.dkl"

```

En Windows desde distribución autocontenida
```CMD
dkl.exe "c:\mis programas\hola.dkl"

```
En Linux desde distribución autocontenida

```BASH
./dkl "c:\mis programas\hola.dkl"
```

Hágalo y vea el resultado
### Parámetros de línea de comando 
Todos son opcionales, el único requerido es el primer argumento que debe ser la ruta y nombre de un programa DKL.

Si instalaste Devkron a través de IWA en un equipo Windows
```CMD
devkron.exe archivo.dkl [parámetros]

```
Si instalaste Devkron en un equipo Windows desde la distribución autocontenida.
```BASH
dkl archivo.dkl [parámetros]

```

Si instalaste Devkron en un equipo Linux desde la distribución autocontenida.
```BASH
./dkl archivo.dkl [parámetros]
```

archivo.dkl es la ruta y nombre de archivo del programa a ejecutar.

| Parámetro | Observación |
|-------|-------------|
| -id:valor | Establece un identificador para la ejecución, si no se indica, Devkron genera un GUID automáticamente |
| -stepbystep | Realiza una ejecución paso a paso del código, puede ser útil para depurar |
| -debugfile:archivo |Indica el archivo sobre el que únicamente se aplicará la ejecución paso a paso, si no se establece, se aplicará a todos. Este parámetro trabaja junto con –stepbystep |
| -parse | Indica al intérprete que omita la ejecución imperativa, proporcionando únicamente la salida XML del archivo DKL |
| -output:archivo | Indica el archivo de salida para el resultado del árbol XML producido por el programa DKL |
| -hide-log | Oculta la información de ejecución de la salida de consola |
| -hide-critical | Oculta los errores de la salida de consola |
| -hide-output | Oculta la salida por consola del árbol XML resultante de la ejecución del programa DKL |
| -ninja | Oculta toda salida por consola |
| -encoding: codificacion | Establece la codificación de la salida, toma alguno de los siguientes valores: default, utf8,utf8bom, utf7, utf32, Unicode, ascii, not-set. Si no se indica, se asume la el valor ‘default’ que toma la codificación configurada para la consola y utf8bom para la salida de archivo. |

Ejemplo:
```DKL
devkron.exe "c:\mis programas\programa.dkl" "–output:c:\mis salida\programa.xml" –ninja
```
Guarda la salida XML del programa.dkl en el archivo programa.xml sin mostrar ningún dato por consola.
### Archivo dkli.dkh
El archivo dkli.dkh contiene los patrones de sintaxis para el contexto imperativo, por eso es necesario que se incluya siempre al principio de los programas que harán uso de este contexto.
### Inclusión de bibliotecas de funciones
Existen varias bibliotecas de funciones que pueden usarse en programas imperativos de DKL.
Las inclusiones de bibliotecas deben realizarse dentro del nodo raíz del árbol, como en el ejemplo siguiente:
```DKL
#include "dkli.dkh"
#!
program "ejemplo"
{
    #include "functions.dkh"
    #include "serialize.dkh"
```
Por convención, se usa la extensión dkh para los archivos de las bibliotecas de funciones aunque son código dkl también.
### Generar XML
Como ya se ha mencionado, DKL puede generar XML, pruebe el siguiente código también y observe los resultados, más adelante comprenderá mejor la razón.
(Guarde el código en un archivo .dkl y ejecútelo a través de devkron.exe)
```DKL
Personas(cantidad="5")
{
    Persona(nombre="Juan")
    Persona(nombre="Pedro")
    Persona(nombre="Camila")
}
```
