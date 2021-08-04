# Expresiones
Las expresiones en DKL siguen la convención:

**Término Operador Término**

En donde Término es una constante numérica, una constante de cadena, una variable, una llamada a función o una expresión encerrada entre paréntesis.

Por su parte, el operador puede ser aritmético o lógico según se explica más adelante.

**A+5** es una expresión válida

**a<b || c>d también es una expresión válida.**

## Constantes numéricas

Inician con un número, un signo menos (negativo) o un punto, los caracteres subsecuentes pueden ser solo números, el punto decimal (carácter punto) es flotante. 

- 10 
- 10.58 
- 0.58
- .69
- -5
- -.25
- -0.58

## Constantes de cadena 

Están delimitadas por comillas dobles y pueden contener cualquier carácter imprimible (no se admiten secuencias de control o escape). 

- “Hola mundo” 
- “Esto es una cadena de caracteres”

## Llamadas a funciones

Siguen las mismas reglas para las variables, pero deben ser seguidas de una pareja de paréntesis que encierre los parámetros existan o no. Si hubiese parámetros, deberán delimitarse con una coma

- F()
- Funcion(10,25.5,”hola”)

Los identificadores (nombres) de funciones no distinguen entre mayúsculas y minúsculas.

**funcion1(10) es la misma función que FunCION(10).**
