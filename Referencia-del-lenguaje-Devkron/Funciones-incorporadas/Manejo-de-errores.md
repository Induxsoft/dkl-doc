## Manejo de errores

Permiten obtener información acerca de errores o excepciones ocurridas en tiempo de ejecución.

| **last_error**  Devuelve una cadena con el último mensaje de error ocurrido.  **last_error()** |Sin argumentos|
|-----------|-----------|
| **last_error_code**  Devuelve el número (código numérico) del último error ocurrido.  **last_error_code()**|Sin argumentos|
| **rise_error**  Desencadena una excepción (error)  **rise_error(código, mensaje)**| código – Número (código) del error
mensaje – Cadena con el mensaje de error|
| **clear_exceptions**  Limpia la pila de excepciones del intérprete  **clear_exceptions()**| Sin argumentos|
| **pop_exception**  Devuelve una referencia a la última excepción y la saca de la pila del intérprete.  **pop_exception()**| Sin argumentos|

