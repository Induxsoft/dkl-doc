# Organización y estructura del programa

## Ámbitos

Todos los programas en DKL tienen 3 ámbitos:

- Global. Las variables declaradas como globales están disponibles en cualquier ámbito
- Principal. El ámbito principal del programa consiste en el código fuera de las funciones definidas por el programador.
- De función. El correspondiente al bloque de código de una función definida por el programador en particular.

![Texto alternativo]( "Título de la imagen")

```DKL
#include “dkli.dkh”
#!
program
{
	funcion1::
{
	//Ámbito de función
	a=3 //Variable local al ámbito de la función
}
	//Ámbito principal
	@a=1 //Variable global
	a =2 //Variable local al ámbito principal
}
```
## Módulos

Todo archivo DKL es un árbol y debe tener un por tanto un elemento raíz.

Si se escribe un programa imperativo deberá incluirse el cuerpo de código dentro de un elemento program o module.

Los elementos program y module no tienen más propósito que servir de nodo raíz y contenedor del ámbito principal y son totalmente equivalentes.

```DKL
program “mi programa”
{
	//Código aquí
}
```

Es equivalente a:

```DKL
module “mi programa”
{
	//Código aquí
}
```

También es válido:

```DKL
module “modulo raíz”
{
	funcion1::
{
	//Este es el ámbito de una función
}
	//Ámbito principal
	module “modulo interno”
{
	//También aquí es el ámbito principal
}
}
```

La cadena de texto que sique a la declaración de module o program es opcional.

Cuando se realizan inclusiones (#include o include) el código se inserta en la ubicación de la sentencia o directiva.

El código de un bloque module o program pertenece al ámbito en que se encuentra, DKL no tiene ámbitos aislados para estos tipos de bloques.

## Funciones definidas por el programador

La declaración de funciones se realiza de la siguiente manera:

```DKL
nombre_funcion :: arg1, arg2, ...argn	
{
...
}
```

Ejemplos:

```DKL
sumaAyB :: a, b
{
	return a+b
}
```

funcion_sin_argumentos::

**{       }**

Las funciones definidas por el programador tienen su propio ámbito cada una, por lo que las variables locales declaradas existen únicamente durante la ejecución de la función a la que pertenecen.

No se permite declarar funciones dentro de funciones.

Todas las funciones devuelven un valor, si no se especifica con la sentencia return, la función devuelve cero.

El número de parámetros definidos para la función es fijo.

Los parámetros que deben ser tratados como tipos referencia, deben ser indicados con el carácter & precediendo al nombre:

```DKL
funcion1:: parámetro_valor, &parametro_referencia
{
}
```

Las funciones deben ser declaradas antes del código que las llame, por lo que el siguiente código producirá un error de “función no encontrada”:

```DKL
a=f1()+5
f1::
{
	return 3
}
```

El código debería ser como sigue:

```DKL
f1::
{
	return 3
}
a=f1()+5
```
