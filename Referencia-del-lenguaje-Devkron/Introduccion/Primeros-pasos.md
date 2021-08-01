# Ejecución de programas
Devkron.exe es el ejecutable por línea de comando del intérprete del lenguaje.  
Suponga que tiene el siguiente código en c:\mis programas\hola.dkl


```DKL
#include "dkli.dkh"
#!
program "hola"
{
    do print ("Hola mundo")    
}
```
Para ejecutarlo deberá escribir:
```CMD
devkron.exe "c:\mis programas\hola.dkl"

```
