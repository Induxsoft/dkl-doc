# Capítulo II – Lenguaje imperativo
## Tipos de datos
### Tipos valor

DKL es un lenguaje de tipado estático, es decir que si una variable se declara de un tipo no podrá cambiarlo durante toda la vida del programa.

Formalmente existen únicamente dos tipos valor: numéricos y cadenas.

Internamente los valores numéricos se almacenan en tipos System.Decimal de Net Framework o Net Core.

Los resultados de evaluaciones lógicas se consideran numéricos también, siendo 1 para resultados verdaderos y 0 para resultados falsos.

Los tipos de cadena internamente se almacenan como System.String de Net Framework o Net Core.

### Tipos referencia

Las referencias son el mecanismo para acceder a objetos, internamente son el índice de una tabla de objetos que persiste durante todo el tiempo de ejecución del programa.

DKL utiliza el método de conteo de referencias para administrar la memoria asignada.

Las variables de referencia deben declararse con la palabra reservada ref.

Una variable de referencia es una variable numérica marcada como tal, por lo tanto, es posible asignar el contenido de variables de referencia a variables numéricas y viceversa sin que ocurra un error de tipos en tiempo de ejecución, sin embargo esto no debe hacerse bajo ninguna circunstancia.

Es importante considerar que, si no existe ninguna referencia apuntando a un objeto en la tabla de objetos interna, se eliminará de la memoria.

Siempre que utilice objetos, use variables de referencia.

Ejemplo:
