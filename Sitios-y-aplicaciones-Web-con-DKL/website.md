## Plantillas e inclusiones automáticas

El marco de trabajo [dkl-web](https://github.com/Induxsoft/dkl-web) ofrece un mecanismo sencillo para:

* Usar plantillas escritas en HTML o DKL para formar las páginas
* Cargar automáticamente archivos de bibliotecas o configuraciones escritos en DKL

Deberá incluir el archivo website.dkl y además functions.dkh (del que depende).

### Carga automática de archivos

#### Plantillas
Consideraciones:

* Las plantillas son archivos llamados 'template' con extensión .dkt (si es código DKL) o .htt (si es HTML).
* Solo se permite un archivo de plantilla por carpeta del sitio Web
* La carga de las plantillas sigue un orden específico: Primero se busca en la carpeta del recurso que se está solicitando y de no encontrarse, se continúa buscando en las carpetas padre.

#### Código DKL

Consideraciones:

* De manera predeterminada, se intentarán cargar en orde jerárquico todos los archivos config.dk y lib.dk que se encuentren desde la raíz y hasta la carpeta del recurso solicitado.


#### Estructura de archivos del sitio Web

Para explicar mejor la manera como se emplean las plantillas y los archivos de bibliotecas, suponga la siguiente estructura de sitio Web:

``` TEXT
/
|- index.dkl                  (/index.dkl)
|- config.dk                  (/config.dk)
|- lib.dk                     (/lib.dk)
|- template.htt               (/template.htt)
|- seccion-1/       
|        |- index.dkl         (/seccion1/index.dkl)
|- seccion-2/
         |- index.dkl         (/seccion2/index.dkl)
         |- template.dkt      (/seccion2/template.dkt)
         |- lib.dk            (/seccion2/lib.dk)
         |- sub-seccion2-1/   
                  |-index.dkl (/seccion2/sub-seccion2-1/index.dkl)
                  |-lib.dk    (/seccion2/sub-seccion2-1/lib.dk)

```
Los recursos (URL) que expone el sitio son:

(Asumiendo protocolo http y un dominio o nombre de host de ejemplo 'sunombrededominio.tld')

* http://sunombrededominio.tld/             ---> Responde: /index.dkl
* http://sunombrededominio.tld/seccion-1/   ---> Responde: /seccion1/index.dkl
* http://sunombrededominio.tld/seccion-2/   ---> Responde: /seccion2/index.dkl
* http://sunombrededominio.tld/seccion-2/sub-seccion2-1/  ---> Responde: /seccion2/sub-seccion2-1/index.dkl

Si TODOS los archivos index.dkl del sitio Web tienen el siguiente código únicamente:

``` DKL
#include "dkli.dkh"
#!
module "index.dkl"
{
  #include "functions.dkh"
  #include "website.dkl"

  do render_page()
}
```
La siguiente sería la carga de archivos adicionales para cada uno de ellos:

/index.dkl

Usaría la plantilla: /template.htt

Y carga los archivos de código:

  * /config.dk
  * /lib.dk
 
/seccion1/index.dkl

Usaría la plantilla: /template.htt (no hay una definida en su carpeta, por lo que toma la del padre)

Y carga los archivos de código (del padre):

  * /config.dk
  * /lib.dk

/seccion2/index.dkl

Usaría la plantilla: /seccion2/template.dkt (Carga su propia plantilla)

Y carga los archivos de código (del padre y de su propia carpeta):

  * /config.dk
  * /lib.dk
  * /seccion2/lib.dk

/seccion2/sub-seccion2-1/index.dkl

Usaría la plantilla: /seccion2/template.dkt (De su carpeta padre)

Y carga los archivos de código (de sus padres y de su propia carpeta):

  * /config.dk
  * /lib.dk
  * /seccion2/lib.dk
  * /seccion2/sub-seccion2-1/lib.dk

## Renderización de páginas con plantillas

website.dkl define la función 'render' que permite incluir contenido (mediante funciones definidas por el programador) en las ubicaciones donde se le invoque dentro de las plantillas.

#### Ejemplo de plantillas HTML (template.htt)

Ejemplo de plantilla template.htt:
``` HTML
<!DOCTYPE html>

<html lang="es">
	<head>
		#<render('head')>
	</head>
	<body>
		#<render('body')>
	</body>
</html>
```

#### Ejemplo de plantillas DKL (template.dkt)
Ejemplo de plantilla template.dkt

``` DKL
#include "dkli.dkh"

#$
html(lang="es")
{
	head
	{
		$"#<render('head')>"
	}
	body
	{
		$"#<render('body')>"
	}
}

```
### Ejemplo de página de contenido (index.dkl)

``` DKL
#include "dkli.dkh"
#!
module "index.dkl"
{
    #include "functions.dkh"
    #include "serialize.dkh"
    #include "website.dkl"

    head::
    {
        ##
        title{$"Mi sitio Web con Devkron"}
        ##
    }

    body::
    {
        ##
        h1{$"Hola Mundo"}
        ##
    }

    do render_page()
}
```
### Comentarios
Al solicitar a través de HTTP el recurso index.dkl, se devolverá la página resultante del uso de la plantilla (template.dkt o template.htt).

Usar una plantilla en HTML o DKL tiene diferentes ventajas, por una parte el empleo de plantillas HTML facilita la reutilización de código de maquetado existente, mientras que el uso de las plantillas en DKL permite mayor control y dinamismo al momento de generar las páginas.

Puede probar el código de los ejemplos guardando en una carpeta del sitio Web los archivos index.dkl y template.dkt y en otra carpeta el mismo archivo index.dkl pero con el archivo template.htt.

Observe que la inclusión de la plantilla se realiza en la invocación de la función 'render_page()' de index.dkl.

Las funciones 'body()' y 'head()' son llamadas por la función 'render()' utilizada en las plantillas.

Si desea llamar a funciones a través de render que usan parámetros, simplemente use una sintaxis como: render('funcion(parametro1,...)')
