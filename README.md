# Documentación de Devkron [DKL]

## Referencia del lenguaje y bibliotecas principales

### Capítulo I - Lenguaje declarativo

* [Introducción y primeros pasos](Referencia-del-lenguaje-Devkron/Introduccion/Primeros-pasos.md)	

* [Símbolos primitivos](Referencia-del-lenguaje-Devkron/Introduccion/Simbolos-primitivos.md)
  
* [Elementos y atributos](Referencia-del-lenguaje-Devkron/Introduccion/Elementos-y-atributos.md)
  
* [Directivas](Referencia-del-lenguaje-Devkron/Introduccion/Directivas.md)
      
### Capítulo II - Lenguaje imperativo

* [Variables](Referencia-del-lenguaje-Devkron/Lenguaje-imperativo/Variables.md)

* [Expresiones](Referencia-del-lenguaje-Devkron/Lenguaje-imperativo/Expresiones.md)

* [Operadores](Referencia-del-lenguaje-Devkron/Lenguaje-imperativo/Operadores.md)

* [Sentencias](Referencia-del-lenguaje-Devkron/Lenguaje-imperativo/Sentencias.md)

* [Organización y estructura del programa](Referencia-del-lenguaje-Devkron/Lenguaje-imperativo/Organizacion_y_estructura_del_programa.md)

* [Temas avanzados](Referencia-del-lenguaje-Devkron/Lenguaje-imperativo/Temas_avanzados.md)

### Capítulo III - Funciones incorporadas

* [Acerca de las funciones incorporadas](Referencia-del-lenguaje-Devkron/Funciones-incorporadas/acerca-de-las-funciones-incorporadas.md)

* [Interoperabilidad .Net](Referencia-del-lenguaje-Devkron/Funciones-incorporadas/Interoperabilidad-dotNet.md)

* [Depuración](Referencia-del-lenguaje-Devkron/Funciones-incorporadas/depuracion.md)

* [Manejo de errores](Referencia-del-lenguaje-Devkron/Funciones-incorporadas/Manejo-de-errores.md)

* [Sistema](Referencia-del-lenguaje-Devkron/Funciones-incorporadas/Sistema.md)

* [Consola](Referencia-del-lenguaje-Devkron/Funciones-incorporadas/Consola.md)

* [Matemáticas](Referencia-del-lenguaje-Devkron/Funciones-incorporadas/Matematicas.md)

* [Lógicas](Referencia-del-lenguaje-Devkron/Funciones-incorporadas/Logicas.md)

* [Conversiones](Referencia-del-lenguaje-Devkron/Funciones-incorporadas/Conversiones.md)

* [Fecha y hora](Referencia-del-lenguaje-Devkron/Funciones-incorporadas/Fecha-y-hora.md)

### Capítulo IV - Bibliotecas de funciones

* [Funciones de propósito general (functions.dkh)](Bibliotecas-de-funciones/functions/functions.md)

* [Serialización (serialize.dkh)](Bibliotecas-de-funciones/serialize/serialize.md)

* [Base de datos relacionales (dbr.dkh)](Bibliotecas-de-funciones/dbr/dbr.md)

* [Cliente HTTP y SMTP (webcl.dkh)](Bibliotecas-de-funciones/webcl/webcl.md)

### Capítulo V - Sitios y aplicaciones Web con Devkron

* [La estructura @http_context](Sitios-y-aplicaciones-Web-con-DKL/Como-funciona.md)

* [Responder HTML o XML](Sitios-y-aplicaciones-Web-con-DKL/responder-html-xml.md)

* [Responder JSON o texto plano](Sitios-y-aplicaciones-Web-con-DKL/responder-json-text.md)

* [Responder con un archivo](Sitios-y-aplicaciones-Web-con-DKL/responder-archivo.md)

* Marco de trabajo DKL-Web
  * [Cookies](Sitios-y-aplicaciones-Web-con-DKL/cookies.md)
  * [Plantillas e inclusiones automáticas](Sitios-y-aplicaciones-Web-con-DKL/website.md)
  * [Utilidades de generación de interfaz de usuario HTML enlazada a datos](Sitios-y-aplicaciones-Web-con-DKL/uielements.md)

## Guías paso a paso
### Devkron en Windows con .Net Framework 4.5
* [Instalar Devkron en Windows con IIS a través de IWA](Guias-paso-a-paso/Windows/Instalar-DKL-Win-IWA.md)
* [Ejecutar programas (de consola) de Devkron](Guias-paso-a-paso/Windows/ejecutar-consola-dkl.md)
* [Crear bases de datos, configurar y usar su conexión en Devkron](Guias-paso-a-paso/Windows/crear-db-y-conexion.md)

### Devkron autocontenido en Windows-x64
[Devkron en Windows](Guias-paso-a-paso/Windows/Instalar-dkl-winx64.md)

Esta guía aborda los siguientes temas:
  * Instalación en Windows sin IWA
  * Ejecutar programas de consola
  * Iniciar el servicio FastCGI

### Devkron autocontenido en Linux-x64
[Devkron en Linux](Guias-paso-a-paso/Linux/Instalar-dkl-Linux.md)

Esta guía aborda los siguientes temas:
  * Instalación en Linux
  * Ejecutar programas de consola
  * Iniciar el servicio FastCGI

### Devkron FastCGI
* [Usar Nginx como servidor Web (Windows y Linux)](Guias-paso-a-paso/nginx-fastcgi.md)
* [Configuración de la FastCGI de Devkron (Windows y Linux)](Guias-paso-a-paso/devkron-fastcgi.md)

### Acceso a bases de datos relacionales
[Configurar conexiones](Guias-paso-a-paso/configurar-connections.md)

Esta guía explica cómo configurar conexiones en Devkron autocontenido en Linux y Windows
