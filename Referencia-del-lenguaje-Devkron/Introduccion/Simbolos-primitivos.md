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
| \\ | \ |
| \' | ' |
| \" | " |
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
