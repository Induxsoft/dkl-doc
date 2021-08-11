## Biblioteca cookies.dkl

La biblioteca cookies.dkl (parte del marco de trabajo [dkl-web](https://github.com/Induxsoft/dkl-web)) simplifica el manejo de cookies a través de las siguientes funciones:

### cookie.set
Establece el valor de una cookie con ámbito a todo el sitio Web y con expiración de un año.
``` DKL
do cookie.set(n, v)
```

Parámetros
* n - Es una cadena con el nombre de la cookie
* v - Es una cadena con el valor a establecer

Valor de retorno: Numérico (cero)

### cookie.setw
Establece el valor de una cookie con el valor y parámetros indicados.
``` DKL
do cookie.setw(n,v)
```

Parámetros
* n - Es una cadena con el nombre de la cookie
* v - Es una cadena con el valor a establecer, puede incluir parámetros adicionales delimitados por el caracter ;

Valor de retorno: Numérico (cero)

### cookie.get
Obtiene el valor de cadena de una cookie, si no existe devuelve una cadena vacía
``` DKL
v=cookie.get(n)
```

Parámetros
* n - Es una cadena con el nombre de la cookie a obtener

Valor de retorno: Cadena con el valor de la cookie

### cookie.dget
Obtiene el valor de una cokie, si no existe devuelve el valor de cadena indicado como predeterminado.
``` DKL
cockie.dget(v,d)
```

Parámetros
* n - Es una cadena con el nombre de la cookie a obtener
* d - Es una cadena que será devuelta si la cookie indicada no está establecida

Valor de retorno: Cadena con el valor de la cookie o el predeterminado
