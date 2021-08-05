# Capítulo III – Funciones incorporadas

Las funciones incorporadas en el lenguaje no requieren que se incluya ninguna biblioteca porque están programadas en el núcleo del intérprete devkron.exe.

A diferencia de las funciones definidas por el programador o las que se definen en bibliotecas, las funciones incorporadas son las únicas que tienen en algunos casos, parámetros variables.

## Interoperabilidad .Net

Permiten extender las características del lenguaje mediante la interoperabilidad con la plataforma .Net (.Net Framework o .Net Core)

| **_import_library**         Carga un ensamblado y devuelve una referencia que apunta hacia él y que puede ser usada por otras funciones de interoperabilidad.               **_import_library(nombre_ensamblado)** | nombre_ensamblado – Cadena con el nombre cualificado o de archivo de un ensamblado .Net |
|-----------|-----------|
| **_new**   
Devuelve una referencia a una instancia de un objeto de una clase de .Net
_new(tipo)
_new(ensamblado, tipo)
_new(tipo, argumentos)
_new(ensamblado, tipo, argumentos)
_new(ensamblado, tipo, argumentos) | tipo – Cadena con el nombre completo de una clase de .Net  ensamblado – Referencia a un ensamblado .Net cargado a través de la función _import_library. Si se omite, se asume que la clase pertenece a un ensamblado cargado intrínsecamente con el intérprete. argumentos – Es una lista de parámetros que serán pasados al constructor de la clase. |
|||
