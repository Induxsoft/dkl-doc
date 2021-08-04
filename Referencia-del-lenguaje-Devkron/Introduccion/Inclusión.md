# Inclusión
## include

Inserta el código de un archivo DKL indicado en la posición de la sentencia include si la ejecución pasa por ella.

A diferencia de la directiva #include; que siempre realiza la inclusión del código; la sentencia include solo lo hace si es ejecutada.

Ejemplo:
```DKL
#include “archivo1.dkl”
if expresión
{
	#include “arhivoX.dkl”
	include “archivo2.dkl”
}
```

archivo1.dkl y archivoX.dkl siempre serán insertados en donde se encuentran sus respectivas directivas, no obstante archivo2.dkl solo se incluirá si expresión es verdadera.
