# Sentencias

Las sentencias son por línea y no requieren marcador de terminación, en otras palabras: No se utiliza el ; ni ningún otro carácter de delimitación.

Las sentencias son sensibles a mayúsculas y minúsculas.

Todas las palabras reservadas de DKL como sentencias están en minúsculas.

## Control de flujo

Permiten la ejecución condicional de secciones de código.

### if -else if – else

La sentencia if de Devkron es similar a la del lenguaje C, con la excepción de que no requiere paréntesis para delimitar la expresión a evaluar. 

```DKL
if  Expresión
{
	//Código a ejecutar si Expresión es verdadera
}
else if Expresión2
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

```DKL
funcion1::
{
	return 10
}

funcion2::
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

```DKL
do funcion1("hola") //Llama a la función indicada
```

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
# Inclusión
## include

Inserta el código de un archivo DKL indicado en la posición de la sentencia include si la ejecución pasa por ella.

A diferencia de la directiva #include; que siempre realiza la inclusión del código; la sentencia include solo lo hace si es ejecutada.

Ejemplo:
```DKL
#include "archivo1.dkl"
if expresión
{
	#include "arhivoX.dkl"
	include "archivo2.dkl"
}
```

archivo1.dkl y archivoX.dkl siempre serán insertados en donde se encuentran sus respectivas directivas, no obstante archivo2.dkl solo se incluirá si expresión es verdadera.

 # Asignación
 ## Asignación de variables de tipo valor
 
La asignación de variables de tipo valor (numéricas o de cadena) se realiza con la siguiente sintaxis:

```DKL
variable = valor
```
**El carácter = es el operador de asignación, no debe confundirse con el operador de igualdad ==**

## Asignación de texto a variables

Para clarificar mejor la asignación de grandes cantidades de texto a variables, puede usarse la sentencia text con la siguiente sintaxis:

```DKL
text variable
{
"texto a asignar a la variable"
}
```

## Asignación de variables de referencia

Las variables de referencia siempre deben asignarse con la sentencia ref

La sintaxis es:

```DKL
ref variable=expresión_que_devuelve_una_referencia
ref variable: expresión_que_devuelve_una_referencia
```
**El operador = en una sentencia ref liberará la variable a asignar si ya estaba asignada y creará una nueva entrada en la tabla interna del intérprete de referencias de objetos, los recursos asociados al objeto serán limpiados automáticamente si no hay otra variable que contenga la misma referencia.**

**El operador : en la sentencia ref forzará la reutilización de los mismos recursos de la tabla de objetos de DKL para alojar ahí la nueva referencia, lo que ocasiona que si otras variables apuntan a la misma referencia también se verán afectadas.**

**Si la variable no estaba siendo usada con anterioridad, es indistinto el uso de = o : en ref.**

# Estructuras (o registros) de datos

Una estructura o registro de DKL es un tipo referencia que apunta hacia un objeto de datos complejo.

La sentencia new crea un registro y lo referencia a una variable.

(Internamente instancia la clase System.Collections.Generic.Dictionary<string,object> insensible a mayúsculas o minúsculas, por lo que cualquier objeto de .Net puede ser tratado como registro si implementa la interfaz System.Collections.Generic.IDictionary<string,object>.)

Por su parte, la sentencia using crea si no existe o reutiliza uno previamente creado.

```DKL
new r
{
	@”campo1”:”datos del campo1”
}
using r
{
	@”campo2”:”datos del campo2”
}
```

El bloque de código anterior crea y luego complementa una estructura referenciada por la variable r que expresada en JSON sería así:

```DKL
{ “campo1”:”datos del campo1”, “campo2”:”datos del campo2” }
```

Miembros (campos) de las estructuras (o registros)

Los miembros siempre se indican empezando con el carácter @, seguido de una cadena entre comillas (dobles o simples) que corresponde al nombre.

Los miembros que contienen datos de tipo valor (números o cadenas) se asignan con la sintaxis:

- **@”nombre del campo” : “valor de cadena”**
- **@”nombre del campo” : 9651 //Valor numérico**
- **@”nombre del campo” : 8+f() // Expresión**

En el caso de que los miembros hagan referencia a un objeto, se utiliza el carácter * al final del nombre como indicador.

**@”miembro referencia de objeto*”: variable_referencia**

## Miembros que son estructuras

Una campo puede contener a su vez una estructura completa, declaración que se realiza con las sentencias new member o member, que crean o bien crean o re-usan una estructura miembro.

```DKL
new r
{
	new member @”r.1”
{
	@”campo_r.1.1” : ”valor”
}
}
using r
{
	member @”r.1”
{
	@”campo_r.1.1” : ”valor11”
	@”campo_r.1.2” : ”valor12”
}
	new member @”r.2”
{
	@”campo_r.2.1” : ”valor”
}
}
```

Esto sería representado en JSON como: 

```JSON
{
   "r.1":{
      "campo_r.1.1":"valor11",
      "campo_r.1.2":"valor12"
   },
   "r.2":{
      "campo_r.2.1":"valor"
   }
}
```

## Asignación de campos de registros a variables y viceversa

Asignar valores a un campo de un registro (o estructura), al igual que obtener su valor y asignarlo a una variable, se realiza con la siguiente sintaxis:

```DKL
using cliente 
{
	@”nombre”: “Juan”
	member @”conyuge”
{
	@”nombre”:”Lupita”
}
}
```

**n : cliente<”nombre”>	// n es asignada con el valor “juan”**
**nc : cliente<” conyuge/nombre”> // nc es asignada con el valor “lupita”**
**cliente<”nombre”>:”pedro” //Ahora el miembro nombre de cliente contiene “pedro”**
**cliente<”conyuge/nombre”>:”sandra” //Ahora el miembro nombre del miembro conyuge de cliente contiene “sandra”**

Esta sintaxis de asignación permite que la expresión de ruta de los miembros sea formada dinámicamente, por ejemplo:

```DKL
campo=”conyuge/nombre”
cliente<campo>:”maria ” //Asigna “maria” al campo nombre del miembro conyuge de cliente
```

Puede asignar variables de referencia a campos usando el carácter * al final de la ruta del miembro:

```DKL
ref objeto=algun_objeto
registro<”campo*”>:objeto
```

Así también, puede obtener una referencia desde un registro con la sintaxis precediendo la ruta del campo con el carácter &:

```DKL
objeto2:registro<”&campo_referencia”>
```

Observe que aunque se está asignando una variable de tipo referencia, no se requiere la sentencia ref en este caso.

## Excepciones

La sentencia exception permite establecer un bloque de código al cuál se conducirá la ejecución del programa en caso de ocurrir una condición de excepción (error).

El bloque exception que recibe la ejecución es siempre el más cercano a donde se produce el error.

```DKL
exception
{
//Código a ejecutar en caso de error
}
```
