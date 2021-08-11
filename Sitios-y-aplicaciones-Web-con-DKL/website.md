## Plantillas de páginas

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
