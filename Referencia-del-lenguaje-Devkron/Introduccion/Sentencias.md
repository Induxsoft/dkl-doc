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
**{**

**case ExpresiónOp1**

```DKL
{
	//Este código se ejecuta si el resultado de ExpresiónOp1==Expresión
}
```

**case ExpresiónOp2**

```DKL
{
	//Este código se ejecuta si el resultado de ExpresiónOp2==Expresión
	return //Esta sentencia obliga a salir del bloque switch completo
}
```
**default**

```DKL

```
