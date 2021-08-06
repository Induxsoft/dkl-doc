## Sistema

|**runscript**   Ejecuta un programa DKL y devuelve el árbol de resultados como una cadena.   **runscript(programa, nombre_variable, referencia)**| **programa** – Cadena con la ruta y nombre del archivo dkl a ejecutal  **nombre_variable** – Cadena con el nombre de la variable global (sin incluir el carácter @) que apuntará a la referencia indicada.  **referencia** – Referencia a un objeto que será pasado al programa que se ejecutará con el nombre de variable indicado|
|-----------|-----------|
| **eval**  Evalúa la expresión DKL válida y devuelve el resultado   **eval(expresión)**| expresión – Es una cadena que contiene una expresión a ser evaluada.|
| **fxml**   Devuelve la salida XML del árbol de resultados al momento de la llamada como una cadena de texto y limpia el buffer interno del intérprete.  **fxml()**  fxml(argumentos)| argumentos – Es una lista de argumentos variable cuyas expresiones serán evaluadas antes de devolver el resultado. |
| **ftext**  Devuelve el texto con las marcas de inyección de expresiones evaluadas.  **ftext(texto)**| texto – Cadena que contiene inyecciones de expresiones.|
| **isset**  Devuelve cierto si la variable indicada ha sido declarada.  **isset(nombre_variable)**| nombre_variable – Es una cadena con el nombre de una variable.|
| **isnull**   Devuelve cierto si la referencia indicada apunta hacia un objeto null.  **isnull(referencia)**| referencia – Referencia a un objeto|
| **ifnull**  Devuelve el segundo argumento si el primero es una referencia null o el mismo primero si no lo es.  **ifnull(referencia, ref_default)**| **referencia** – Es una referencia a un objeto que será evaluada  **ref_default** – Es una referencia a un objeto que será devuelto en cado de que referencia sea null|
| **_null**  Devuelve una nueva referencia hacia un objeto null.  **_null()** | Sin argumentos|
| **_free**  Libera los recursos asociados a una referencia  **_free(referencia)**| referencia – Una variable de referencia que apunta a un objeto|

