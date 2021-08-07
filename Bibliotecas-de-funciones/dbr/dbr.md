# dbr.dkh
## Funciones para administración de bases de datos relacionales

La gestión de bases de datos relacionales en Devkron se realiza a través de bibliotecas especializadas. Esta biblioteca (dbr.dkh) se basa en induxsoft.API.DB que utiliza los mecanismos de conexión, patrones y prestaciones de induxsoft.Connections e induxsoft.DMA.

## Conexiones

### Administrador de conexiones

La información de conexión (credenciales y configuraciones) a múltiples orígenes de datos se gestiona (y almacena) a través del: Administrador de conexiones.

La organización de las conexiones se realiza con base en las aplicaciones que las utilizan.

Por lo tanto, el primer paso es definir una o más aplicaciones y para cada una de ellas las conexiones a bases de datos relacionales que sean necesarias.

Para obtener la mayor independencia de la plataforma subyacente a la base de datos, se emplean Adaptadores de acceso a datos.

Se incluyen los adaptadores para MySQL, MS SQL Server y PostgreSQL.

Cada adaptador requiere los conectores ADO.Net provistos por el fabricante.

### Nombre cualificado de conexión

Las conexiones pueden utilizarse mediante el nombre cualificado que está formado por el nombre de la aplicación y la conexión siguiendo la siguiente convención: conexión@aplicación.

También es posible indicar una conexión que está alojada en una base de datos con la sintaxis: conexión_almacen_conexiones@app_almacen_conexiones/conexión@aplicación.

Si se omite el nombre de la conexión se utilizará la predeterminada.

Ejemplos:

- miconexion_empresa1@sistemaempresarial
- miconexion_empresa2@sistemaempresarial
- @sistemaempresarial
- conexiones@miempresa/conexion1587@sistema_empresa

Las conexiones se alojan de manera predeterminada en el archivo **%ProgramData%\induxsoft\machine\winshell\v10\connections.xml**

Use el Administrador de conexiones provisto con Devkron para gestionar esta información a través de una interfaz de usuario o las funciones de esta biblioteca.

### Funciones de administración de conexiones

| **dba.newconnection**  Crea una nueva conexión a una base de datos existente con la información indicada  **dba.newconnection(qn, info)**| **qn** – Cadena con el nombre cualificado de la nueva conexión  **info** – Referencia a un registro que contiene todos los datos necesarios para establecer la conexión (host, puerto, usuario, password, etc.)|
|-------------------|--------------------|
| **dba.createconnection**  Crea una nueva conexión a una base de datos existente con la información indicada  **dba.createconnection(qn, info, default, sqldic)**| **qn** – Cadena con el nombre cualificado de la nueva conexión  **info** – Referencia a un registro que contiene todos los datos necesarios para establecer la conexión (host, puerto, usuario, password, etc.)  **default** – Número (booleano) que indica si se establecerá la conexión como la predeterminada para el grupo de conexión de la aplicación indicada.  **sqldic** – Cadena con la ruta a un archivo de diccionario de consultas sql|
| **dba.createdb**  Crea una nueva base de datos y agrega la información de conexión al administrador de conexiones.  **dba.createdb(qn, info)**| **qn** – Cadena con el nombre cualificado de la nueva conexión  **info** – Referencia a un registro que contiene todos los datos necesarios para establecer la conexión (host, puerto, usuario, password, etc.)|
| **dba.createschema**  Crea una nueva base de datos y agrega la información de conexión al administrador de conexiones.  **dba.createschema(qn, info, default,sqldic)**| **qn** – Cadena con el nombre cualificado de la nueva conexión  **info** – Referencia a un registro que contiene todos los datos necesarios para establecer la conexión (host, puerto, usuario, password, etc.)  **default** – Número (booleano) que indica si se establecerá la conexión como la predeterminada para el grupo de conexión de la aplicación indicada.  **sqldic** – Cadena con la ruta a un archivo de diccionario de consultas sql|
| **dba.getconnectionset** Devuelve una referencia a un almacén de conexiones en una base de datos.  **dba.getconnectionset(qn)** | **qn**-Cadena con el nombre cualificado de una conexión a una base de datos que contiene un almacén de conexiones.|
| **dba.getconnection** Devuelve una referencia a un registro con la información de conexión del nombre cualificado indicado| **qn**-Cadena con el nombre cualificado de una conexión existente.|
| **dba.delconnection**  Elimina la conexión indicada  **dba.getconnection(qn)**| **qn**-Cadena con el nombre cualificado de una conexión existente.|
| **dba.cnnexists**  Devuelve @true si la conexión indicada existe  **dba.cnnexists(qn)** | **qn**-Cadena con el nombre cualificado de una conexión.|
| **dba.addapp**  Agrega un nombre de aplicación al almacén de conexiones  **dba.addapp(app)**| **app** – Cadena con el nombre de aplicación a agregar|
| **dba.delapp**  Elimina un nombre de aplicación del repositorio de conexiones  **dba.delapp(app)**| **app** – Cadena con el nombre de aplicación a eliminar|
| **dba.apps**  Devuelve una referencia a una lista de cadenas que contienen todos los nombres de aplicación del repositorio de conexiones.  **dba.apps(qn)** | **qn**-Cadena que puede ser un nombre cualificado de conexión si el repositorio de conexiones está en una base de datos o una cadena vacía para referirse al repositorio local de conexiones.|
| **dba.cnns**  Devuelve una referencia a una lista de cadenas que contienen todos los nombres de conexión del repositorio de conexiones que corresponden a la aplicación indicada.  **dba.cnns(qn)**| **qn**-Cadena con el nombre de una aplicación para listas las conexiones del repositorio local o una cadena que incluye un nombre cualificado de conexión a una base de datos que contiene las conexiónes|
## Estructuras de información de conexión

### MySQL

```MySQL
using cnnInfo
        {
            @"Engine":"MY_SQL"
            @"Host":"Nombre o dirección IP"
            @"UserName":"Usuario"
            @"Password":"Contraseña"
            @"Port":3306
            @"DefaultSchema":"Nombre de la base de datos"
        }
```

### SQL Server

```SQL Server
using cnnInfo
    {
        @"Engine":"SQL_SERVER"
        @"Host":"Nombre o dirección IP"
        @"UserName":"Usuario"
        @"Password":"Contraseña"
        @"DefaultSchema":"Nombre de la base de datos"
        @"WindowsAuthMode":@true //@true or @false
    }
```

### PostgreSQL

```PostgreSQL
using cnnInfo
    {
        @"Engine":"POSTGRE_SQL"
        @"Host":"Nombre o dirección IP"
        @"UserName":"Usuario"
        @"Password":"Contraseña"
        @"Port":5432
        @"DefaultSchema":"Nombre de la base de datos"
        @"NameSpaceSchema":"Nombre del espacio de nombres del esquema"
    }
```
