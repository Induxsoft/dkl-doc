# Elementos y atributos
Para describir la sintaxis de esta sección se utiliza la siguiente convención:

**opción1 | opción2  El carácter pipe,  indica que se usa la opción1 o la opción2, pero obligatoriamente alguna de ellas.**
**[Sintaxis opcional] Las sintaxis indicadas entre corchetes [] indica que puede incluirse o no (es absolutamente opcional).**
### Elemento
**cadena | identificador [ (atributos)] [ {declaraciones o sentencias}]**
### Atributos
Lista clave y valor separado por un espacio en blanco en la siguiente forma:
**cadena | identificador = cadena | Identificador**
Los elementos vacíos (que no tienen atributos ni elementos internos) deben declararse con las dos llaves {}. 
Los elementos que tienen atributos, pero no contienen otros elementos no necesitan las dos llaves.
Ejemplos:
| DKL | XML |
|-----|-----|
| v { } //Elemento vacío | ```<v/>``` |
| E (a1="valor1" a2="valor2") | ```<E a1 = "valor1" a2 = "valor2"``` /> |
| P {  h1(a1="valor1") } | ```<P ><h1 a1 = "valor1" />   </P>``` |
| v | INCORRECTO |
| v() | INCORRECTO |
| v() {  h1(a1="valor1") } | INCORRECTO |

En DKL se pueden usar identificadores sin declarar o cadenas como nombres de elementos o atributos. La regla es que, si el identificador no ha sido declarado previamente con una sentencia #def, se traducirá tal cual en XML.
| DKL | XML |
|-----|-----|
| "prefijo:Persona" ( nombre="Juan" "prefijo:apellido"="López" ) | <prefijo:Persona nombre = "Juan" prefijo:apellido = "López" /> |
| Mascota ("nombre"="Firulais" "prefijo:"Propietario"="Juan López") | <Mascota nombre = "Firulais" prefijo:Propietario = "Juan López" /> |
| Personas(cantidad="5")   {    Persona(nombre="Juan")     Persona(nombre="Pedro")    Persona(nombre="Camila")   } | <Personas cantidad = "5" >   <Persona nombre = "Juan" /    <Persona nombre = "Pedro" />   <Persona nombre = "Camila" />    </Personas> |

### Bloques de texto
Un elemento puede contener además de otros elementos, texto o bloques CDATA.

Puede incluir texto entre comillas dentro del cuerpo de los elementos, en cuyo caso al convertirse a XML se realizará el “escapado” de caracteres.
Por ejemplo:
```DKL
Datos { "Algún texto > que otro texto" }
```
Produce
```DKL
<Datos> Algún texto &gt; que otro texto </Datos>
```
Recuerde que puede usar las secuencias de escape de C (\n\r,...) en las cadenas y estas se traducirán en la salida XML según corresponda.
En algunos casos puede que necesite evitar el escapado de caracteres de XML, por lo que tiene dos alternativas: declara el texto como bloque CDATA o bien explícitamente evitar el escapado.
El carácter! al inicio de una cadena indica que se produzca un CDATA
```DKL
Datos {!"Algún texto > que otro texto"}
```
Produce
```DKL
<Datos> <![CDATA[Algún texto > que otro texto]]> </Datos>
```
Por su parte, el carácter $ precediendo a la cadena coloca el texto sin escapado.
```DKL
Datos {$"Algún texto > que otro texto" }
```
Produce
```DKL
<Datos> Algún texto > que otro texto</Datos>
```
La omisión del escapado XML puede resultar útil si está produciendo HTML, por ejemplo.
### Meta atributos
Los meta-atributos son la única información que no se puede mapear a o desde XML.
Se utilizan para asociar información a un nodo (elemento) en particular que sea usada por los motores en tiempo de ejecución de Devkron.
Meta-atributos predefinidos
| dkl/perform | Indica que el elemento debe ser interpretado imperativamente |
|------------------------|------------------------|
| dkl/hide-element | Indica al generador de la salida XML que el nodo y todos sus hijos deben omitirse (ocultarse) |
| dkli/default-root-type | Nombre predeterminado del nodo raíz en caso que tras la ejecución imperativa no se pueda determinar un solo nodo raíz. |
| meta-xml-declaration | Establece una cadena de texto que se inserta justo antes de la declaración del nodo raíz. |
## Directivas
### Inclusión de archivos de código
**#include**
- **#include "archivo"**
- **#include "archivo" build**
- **#include "archivo" with "plantilla"**
- **#include UTF8 "archivo"**
- **#include UTF8 "archivo" build**
- **#include UTF8 "archivo" with "plantilla"**

Archivo es la ubicación local o remota de un archivo que va a incorporarse en la posición donde se encuentre la sentencia.

Debido a que el parámetro archivo de la sentencia es una cadena y se usa la sintaxis de C, deberá usar doble \\ para indicar una \. 

Ejemplos:
- **#include "c:\\archivo.dkl" //Correcto**
- **#include "c:\archivo.dkl" //Incorrecto**
- **#include "archivo.dkl" /*Correcto, el archivo se busca en la misma ubicación que el programa que lo requiere o en las ubicaciones predeterminadas del entorno.*/**
- **#include "https://dev.induxsoft.net/archivo.dkl" //Correcto**
### Definición de meta-atributos
**#set**
```DKL
# set "meta-atributo" "valor"
```
Asignación de meta atributos al elemento (nodo) inmediato siguiente a la sentencia.
```DKL
# set "AtributoAsociado" "valor"
E(a="5") { }
```
El elemento E tiene asociado un meta-atributo denominado AtributoAsociado.
### Definición de plantillas de elementos
**#def**

**#def identificador [(atributos por orden)] "valor" [(atributos predeterminados)**

Asignación de cadena a identificador

Es la forma más simple de uso de la palabra #def y funciona asignando un valor de cadena que es reemplazado durante la formación del XML. (Casi como una variable o macro)

**DKL**
- #def J "Juan"
- #def P "Pedro"
- #def C "Camila"
- #def n "nombre"

**Personas(cantidad="5")
{
	Persona(n=J)
	Persona(n=P)
	Persona(n=C)**
  
**XML**

- `<Personas cantidad = "5" >`
	- `<Persona nombre = "Juan" />`
	- `<Persona nombre = "Pedro" />`
	- `<Persona nombre = "Camila" />`
- `</Personas>`

Combinando el uso de #def e #include

**archivo1.dkl*

```DKL
# def J "Juan"
# def P "Pedro"
# def C "Camila"
# def n "nombre"
```
**archivo2.dkl**

```DKL
#include "archivo1.dkl"

Personas(cantidad="5")
{
	Persona(n=J)
	Persona(n=P)
	Persona(n=C)
}

```
**XML**
```XML
<Personas cantidad = "5" >
	<Persona nombre = "Juan" />
	<Persona nombre = "Pedro" />
	<Persona nombre = "Camila" />
</Personas>
```
Si la sentencia #def sólo relaciona una cadena con un identificador puede usarse indistintamente como nombre de elemento, atributo y valor.

**DKL**
```DKL
# def n "nombre"
n(n=n)
```
**XML**
```XML
<nombre nombre = "nombre" />
```
Atributos por orden. Es una lista de identificadores o cadenas separadas por comas que simplifican la asignación de valores de atributos en una declaración de elemento.
### #redef
La sentencia #redef cambia la cadena asociada a una declaración #def previa.

El efecto de #redef es al código que le sigue únicamente.

### Definición de patrones de sintaxis
**#pattern**

#pattern Identificador cadena_de_patrón

Identificador es cualquiera definido previamente por una sentencia #def.

cadena_de_patron es una cadena que contiene los símbolos válidos para esa sintaxis en particular.
```DKL
#def color (nombre) "prefijoXml:Color"
#pattern color "COLOR '$nombre'"

```
Permitiría el siguiente código:

**COLOR azul**

Que sería formado como:

```DKL
<prefijoXml:Color nombre="azul"/>
```
Tabla de prefijos para símbolos en patrones:
| $ | Identificador (los admitidos en el lenguaje C) |
|--|----------|
| & | Expresión (Expresión válida según sintaxis de C)|
| % | Macro o uso del definidor (reemplaza el nombre por lo que corresponda en una sentencia #def previa) |
| @ | Cadena (Cadena válida de C [Entre comillas dobles o simples])|
| # | Número (Sintaxis de C para valores numéricos)|
| * | Mezcla (Número, cadena o Identificador)|

(Si no se especifica un prefijo, se asume que es una expresión)

En la sintaxis de un patrón no se permiten las siguientes secuencias:

- Expresión Expresión
- Identificador Expresión
- PalabraReservada Expresión

###Contexto declarativo e imperativo
El contexto se refiere al modo como son procesados los elementos del árbol del programa DKL y son dos:

- Contexto declarativo. Significa que los elementos son transformados a su equivalente XML tal como han sido expresados.

- Contexto imperativo. Significa que los elementos serán considerados sentencias sujetas de interpretación al estilo de cualquier lenguaje imperativo, es decir se realizarán asignaciones de variables, llamadas a funciones, ciclos, etc.

Las directivas de selección de contexto sirven para establecerlos en el código del programa.

###Conmutación de contexto

La directiva:

**##**

Conmuta entre contextos, si la secuencia de ejecución está en modo declarativo cambia a imperativo y viceversa.

###Contexto imperativo	

La directiva:

**#!** 

Pasa a modo imperativo el contexto de ejecución para las líneas siguientes.

###Contexto declarativo

La directiva:

**#$**

Pasa a modo declarativo el contexto de ejecución para las líneas siguientes.

###Inyección de expresiones

En ocasiones requerirá que el valor o nombre de elementos o atributos, así como partes del texto contenido dentro de elementos, se genere dinámicamente por el programa.

Para hacerlo, use la siguiente sintaxis:

**#<expresión : formato> Inserción de expresiones**

Por ejemplo:

**a(href="#<url>"){"Hipervínculo"} // coloca el valor de una variable denominada url en la posición de la marca.**

Dentro de las marcas de inyección pueden escribirse expresiones completas.

  Adicionalmente, el carácter : se utiliza para que al resultado de la expresión se le proporcione un formato específico (solo aplica cuando el resultado es numérico).

  **nodo {" El valor monetario es:#<monto * 1.16 : $ #,#.00>"}**
  
Genera un nodo con formato.

  La marca de inyección únicamente puede usarse en:

- El nombre o el valor de atributos
- El nombre de elementos
- Bloques de texto dentro de elementos
