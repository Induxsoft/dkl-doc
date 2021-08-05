# Temas avanzados
## Referencias a funciones

DKL ofrece la sentencia point para asignar a una variable la referencia a una función definida por el programador.

**point variable to funcion**

Donde variable obtendrá una referencia a la función indicada en función.

La llamada a una función se realiza con la sentencia that que tiene la siguiente sintaxis

**that vf**

Llama a la función referenciada por la variable vf

**that vf(argumentos)**

Llama a la función referenciada por la variable vf con los argumentos indicados

**that vf(argumentos)->vr**

Llama a la función referenciada por la variable vf con los argumentos indicados y asigna el valor de retorno a la variable vr

## Funciones abiertas

Una función abierta en Devkron es aquella que permite la ejecución de un bloque de código externo en una parte específica de su código interno.

```DKL
#include "dkli.dkh"
#!
module "función abierta"
{
    iterar::max
    {
        expose index
        
 
        for index=0;index<max
        {
            that
        }
 
        return "Fin"
    }
    
    go iterar (index:i) with(10)->r
    {
        do print(str(i))
    }
 
    do print(r)
}
```

La sentencia that en el cuerpo de una función será reemplazada por el código de un bloque go que la llama.

Una función abierta puede exponer variables internas (locales) como de solo lectura al bloque insertado por go enumerándolas con la sentencia expose.

En el ejemplo, la función iterar, expone la variable interna index.

En el bloque go que hace la llamada, el código insertado hace uso de index con el nombre i

La sentencia go por su parte, la siguiente sintaxis:

```DKL
go funcion [(variable_expuesta:alias,...) [with (parámetros)] [->variable_resultado]
```

Entre corchetes las partes que son opcionales.

El resultado devuelto por la función, en el ejemplo se asigna a la variable r
