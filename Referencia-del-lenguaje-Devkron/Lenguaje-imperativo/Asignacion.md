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
“texto a asignar a la variable”
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
