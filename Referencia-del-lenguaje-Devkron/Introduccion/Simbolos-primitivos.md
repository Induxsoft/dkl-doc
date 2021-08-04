# Símbolos primitivos
### Identificadores
Letras (a...z | A...Z), números (0...9), el carácter @, el _ (guion bajo) y el. punto.
Deben iniciar con una letra, el carácter @ o el carácter _, pueden contener puntos a partir del segundo carácter.
Los siguientes son ejemplos de identificadores válidos:

- Identificador12
- _Identificdor12
- @identificador1.1_1a
- @_identi.ficad.o1r
### Cadenas
Las cadenas deben estar encerradas entre comillas simples o dobles, además se admiten las siguientes secuencias de escape (al estilo del lenguaje C):
| Secuencia de escape | Carácter |
|---------------------|----------|
| ```\\``` | \ |
| ```\'``` | ' |
| ```\"``` | " |
| \r | Retorno de carro [13] |
| \n | Avance de línea [10] |
| \t | Tabulador [9] |

Ejemplos de cadenas válidas:
```DKL
"Algún 'texto' 1"
'Algún texto\r\n"entre comillado dentro de comillas simples"'
}
```
### Agrupadores
Permiten delimitar un bloque o una parte de las declaraciones
- ( ) Declaración de atributos
- { } Cuerpo de la declaración
### Comentarios
Se utiliza la misma sintaxis que en el lenguaje C.
```DKL
//Comentario hasta el final de la línea

/* Texto de comentario que puede 
incluir varias líneas */
```
### Elementos y atributos
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
| P {  h1(a1="valor1") } | ```<P >   <h1 a1 = "valor1" />   </P>``` |
| v | INCORRECTO |
| v() | INCORRECTO |
| v() {  h1(a1="valor1") } | INCORRECTO |
