# Sentencias

Las sentencias son por línea y no requieren marcador de terminación, en otras palabras: No se utiliza el ; ni ningún otro carácter de delimitación.

Las sentencias son sensibles a mayúsculas y minúsculas.

Todas las palabras reservadas de DKL como sentencias están en minúsculas.

## Control de flujo

Permiten la ejecución condicional de secciones de código.

### if -else if – else

La sentencia if de Devkron es similar a la del lenguaje C, con la excepción de que no requiere paréntesis para delimitar la expresión a evaluar. 

**if  Expresión**

```DKL
{
//Código a ejecutar si Expresión es verdadera
}
```

**else if Expresión2**

```DKL
{
	//Código a ejecutar si Expresión es falsa, pero Expresión2 verdadera
}
else 
{
	//Código a ejecutar si ninguna expresión es verdadera
}
```

### switch – case

Permite ejecutar secciones de código con base en valores que coinciden con una expresión principal, su estructura es la siguiente:

```DKL
switch Expresión
{
	case ExpresiónOp1
{
	//Este código se ejecuta si el resultado de ExpresiónOp1==Expresión
}
case ExpresiónOp2
{
	//Este código se ejecuta si el resultado de ExpresiónOp2==Expresión
	return //Esta sentencia obliga a salir del bloque switch completo
}
default
{
/*Este código se ejecuta si Expresión no coincide con ExpresiónOp1 ni con ExpresiónOp2*/
return
}
/*Este código se ejecuta si Expresión==ExpresiónOp1 o a cualquier otro case que no contenga una sentencia break en su bloque */
}
```
### return

La sentencia return en el ámbito principal de ejecución termina el programa.

La sentencia return en el ámbito del cuerpo de una función definida por el programador retorna el valor indicado (si se ha especificado) a la expresión que la ha llamado.

funcion1:

```DKL
{
	return 10
}
```
funcion2:

```DKL
{
	return
}

program
{
	a=funcion1() //La variable a será asignada con el valor 10
	return //Termina el programa
}
```

Si se ejecuta return dentro del cuerpo de una función sin especificar el valor de retorno, la función devolverá cero (numérico).

### break	

Aborta un ciclo o la ejecución de un bloque switch

### do y call

Permiten llamar a una función sin asignar su valor a ninguna variable.

Do y call son equivalentes (de hecho call es un ‘alias’ de do).

Ejemplo:

**do funcion1(“hola”) //Llama a la función indicada**

En DKL no se puede llamar a las funciones más que dentro de expresiones, sentencias de asignación o mediante sentencias do/call.

## Ciclos
### while

Itera el bloque de código asociado mientras la Expresión sea verdadera.

```DKL
while Expresión
{
//Código
}
```

## repeat

Repite el bloque de código asociado las veces que la expresión indique

```DKL
veces=5
repeat veces+2
{
	//Este código se repita 7 veces
}
```

### for

Realiza la iteración de un bloque de código asociado conforme se haya especificado, su sintaxis es muy similar a la del lenguaje C, pero no igual.

Su estructura es la siguiente:

**for asignación_inicial; condición; incremento**

**asignación_inicial y condición son requeridos, el incremento es opcional y en caso de no indicarse se asumirá de uno en uno.**

```DKL
for a=1; a<10; a=a+2
{
	//Este código se ejecutará 4 veces, siendo los valores de a=1, 3, 7 y 9
}
```
