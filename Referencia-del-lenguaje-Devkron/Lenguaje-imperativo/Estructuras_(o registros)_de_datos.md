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
