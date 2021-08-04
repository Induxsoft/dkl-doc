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

**ref objeto=_new(“System.StringBuilder”) // Instancia y aloja la referencia a un StringBuilder de Net Framework o Net core.**

## Declaración de variables

Las variables numéricas y de cadena para declararse únicamente deben asignarse por primera vez.

Ejemplos:

- **a=1 //declara una variable numérica con valor inicial**
- **b="hola mundo" // declara una variable de cadena con valor inicial**

Adicionalmente, las variables pueden tener atributos de validación que permiten controlar y prevenir los datos que almacenan.

## Atributos de variables

Para variables numéricas puede establecer los atributos: min, max indican los valores de Frontera de la variable numérica, round la cantidad de decimales a la que se redondea automáticamente y format la presentación con que se muestra como cadena, se usan los mismos caracteres de control de C#.

Para variables de cadena puede establecer los atributos: min y max (que sirven para controlar la cantidad de caracteres que puede contener la variable únicamente).

Ejemplos:

**a=1 //Declaración de variable numérica con todos los atributos.**

```DKL
{
	set min:0
	set max:100
set round: 2
set format "$ #,#.00"
}
```
La declaración anterior indica que la variable no puede almacenar valores por debajo de cero ni por encima de 100 y que todos serán redondeados a dos decimales, adicionalmente en el contexto declarativo se insertarán con el formato de dinero.

**b="hola mundo" //Declaración de variable de cadena con atributos**

```DKL
{
	set min: 1
	set max:40
}

```
La declaración anterior define que la variable no puede contener cadenas con menos de 1 carácter ni con más de 40 de extensión.

## Plantillas de variables

Los atributos de una variable pueden heredarse a otra en su declaración.

**b=1**

```DKL
{
	set min: 100
}

```

**a[b] //Declara una variable a que hereda de b un valor inicial de 1 y un mínimo de 100.**
**a[b] =50 // Igual que la declaración anterior, salvo porque el valor inicial es establecido a 50**
**a[b] //Hereda los atributos de b y adiciona un máximo de 200**

```DKL
{
	set max:200
}
```
## Ámbito de las variables

Durante la ejecución de un programa Devkron las variables pueden ser globales o locales.

Las variables globales están disponibles en todos los ámbitos, mientras que las locales únicamente están disponibles dentro del ámbito que las declaró.

Las variables globales se declaran igual que las locales, la única diferencia es que el nombre de las variables globales siempre debe iniciar con el carácter @.

Ejemplos:

```DKL
@variable_global=0
variable_local=0
```


