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
| Mascota ("nombre"="Firulais" "prefijo:"Propietario"="Juan López") | `<Mascota nombre = "Firulais" prefijo:Propietario = "Juan López" />` |
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
