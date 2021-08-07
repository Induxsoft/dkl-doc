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

## Acceso a datos relacionales

| **dbr.open**  Devuelve una referencia hacia una conexión de bases de datos abierta  **dbr.open(qn)**|**qn** – Cadena con nombre cualificado de una conexión existente|
|-------------------|------------------|
| **dbr.close**  Cierra una conexión  **dbr.close(db)**|**db** – Referencia a una conexión de bases de datos|
| **dbr.begin**  Inicia una transacción de bases de datos  **dbr.begin(db)**|**db** – Referencia a una conexión de bases de datos|
| **dbr.rollback**  Aborta una transacción de bases de datos  **dbr.rollback(db)**|**db** – Referencia a una conexión de bases de datos|
| **dbr.commit**  Confirma una transacción de bases de datos  **dbr.commit(db)**|**db** – Referencia a una conexión de bases de datos|
| **dbr.in_transaction**  Devuelve @true si se está actualmente dentro de una transacción de bases de datos  **dbr.in_transaction(db)**|**db** – Referencia a una conexión de bases de datos|
| **dbr.is_open**  Devuelve @true si la referencia a una conexión de bases de datos está abierta.  **dbr.is_open(db)**|**db** – Referencia a una conexión de bases de datos|
| **dbr.full_qname**  Devuelve una cadena con el nombre cualificado completo de la referencia a una conexión de bases de datos.  **dbr.full_qname(db)**|**db** – Referencia a una conexión de bases de datos|
| **dbr.relative_qname**  Devuelve una cadena con el nombre cualificado relativo a otra conexión de la referencia a una conexión de bases de datos.  **dbr.relative_qname(db)**|**db** – Referencia a una conexión de bases de datos|
| **dbr.base_qname**  Devuelve una cadena con el nombre cualificado de base de la referencia a una conexión de bases de datos.  **dbr.base_qname(db)**|**db** – Referencia a una conexión de bases de datos|
| **dbr.sql**  Devuelve una referencia a un objeto que representa sintaxis SQL nativa.  **dbr.sql(expresión)**| **expresión** – Cadena con una expresión SQL|
| **dbr.execute**  Ejecuta una consulta SQL  **dbr.execute(db, sql, params)**| **db** – Referencia a una conexión de bases de datos  **sql** – Cadena con una consulta SQL DML o DDL  **params** – Referencia a un registro con los parámetros que se pasarán a la consulta|
| **dbr.table**  Devuelve una referencia a una tabla que contiene el resultado de una consulta SQL   **dbr.table(db, sql, params)**| **db** – Referencia a una conexión de bases de datos  **sql** – Cadena con una consulta SQL DML o DDL  **params** – Referencia a un registro con los parámetros que se pasarán a la consulta| 
| **dbr.str**  Devuelve como una cadena la primera columna y primera fila del resultado de una consulta SQL.  **dbr.str(db, sql, params)**| **db** – Referencia a una conexión de bases de datos  **sql** – Cadena con una consulta SQL DML o DDL  **params** – Referencia a un registro con los parámetros que se pasarán a la consulta|
| **dbr.num**  Devuelve como un número la primera columna y primera fila del resultado de una consulta SQL.  **dbr.num(db, sql, params)**| **db** – Referencia a una conexión de bases de datos  **sql** – Cadena con una consulta SQL DML o DDL  **params** – Referencia a un registro con los parámetros que se pasarán a la consulta|
| **dbr.scalar**  Devuelve como una referencia al valor de la primera columna y primera fila del resultado de una consulta SQL.  **dbr.scalar(db, sql, params)**| **db** – Referencia a una conexión de bases de datos  **sql** – Cadena con una consulta SQL DML o DDL  **params** – Referencia a un registro con los parámetros que se pasarán a la consulta|
| **dbr.rec**  Devuelve como una referencia a un registro que contiene todas las columnas (con sus valores) de la primera fila del resultado de una consulta SQL.  **dbr.rec(db, sql, params)**| **db** – Referencia a una conexión de bases de datos  **sql** – Cadena con una consulta SQL DML o DDL  **params** – Referencia a un registro con los parámetros que se pasarán a la consulta|
| **dbr.update**  Ejecuta la actualización de filas de una tabla.  **dbr.update(db, tabla, registro, expresión, params)**| **db** – Referencia a una conexión de bases de datos  **tabla** – Cadena con el nombre de la tabla cuyas filas se actualizarán  **registro** – Referencia a un registro que contiene los datos a asignar a los campos  **expresión** – Cadena de filtro (SQL) válido para identificar las filas a actualizar  **params** – Referencia a un registro con los parámetros que se pasarán a la expresión de filtro|
| **dbr.insert**  Ejecuta la inserción de una fila en una tabla.  **dbr.insert(db, tabla, registro)**| **db** – Referencia a una conexión de bases de datos  **tabla** – Cadena con el nombre de la tabla en la cual se insertará  **registro** – Referencia a un registro con los datos de la nueva fila|
| **dbr.delete**  Eliminar una fila de una tabla.  **dbr.delete(db, tabla, expresión, params)**| **db** – Referencia a una conexión de bases de datos  **tabla** – Cadena con el nombre de la tabla  **expresión** – Cadena de filtro (SQL) válido para identificar las filas a eliminar  **params** – Referencia a un registro con los parámetros que se pasarán a la expresión de filtro|

## Acceso a datos relacionales con el modelo de Devkron

El modelo de datos de una aplicación es una abstracción del conjunto de elementos del mundo real que le son relevantes.

Ésta información se preservará en una base de datos relacional subyacente y será manipulada a través de servicios.

## Objetivos de diseño

### Confiabilidad

Información confiable que pueda usarse para tomar decisiones es una prioridad y objetivo de diseño, para alcanzarla es necesario que se prevengan la mayor cantidad de posibles situaciones de riesgo a la veracidad y precisión de los datos.

La utilización correcta de claves primarias, foráneas, restricciones y el uso de transacciones son obligatorias y fundamentales.

En el mismo sentido, manejar la concurrencia es vital para asegurar que los datos no sean sobrescritos inadvertidamente.

### Escalabilidad

La posibilidad de migrar fácilmente los datos a plataformas más robustas con nulos o mínimos cambios al código fuente es un objetivo clave.

Las tareas de respaldo, integración y replicación de datos deben ser consideradas desde el diseño de estructuras y la implementación de su gestión desde el código fuente.

### Adaptabilidad

Es importante permitir el crecimiento y evolución de los sistemas con el mínimo esfuerzo en cuanto a la gestión del acceso a datos.

También es necesario adoptar prácticas adecuadas para el control de los cambios y la documentación de los mismos.

1.Facilitar el aprendizaje de las técnicas de manejo de datos a programadores con poca experiencia utilizando una misma API para diferentes plataformas y lenguajes de desarrollo.

2.Limitar la intervención humana en la gestión del acceso a datos y disminuir la necesidad de que tomen previsiones a la hora de implementar aplicaciones y permitirles centrarse en la funcionalidad. 

## Patrón de diseño 

Para conseguir los objetivos de diseño hemos previsto la utilización de un patrón de diseño en la estructura relacional con las siguientes características:

1.Un conjunto de elementos estructurales de control con nombres y propósitos específicos que faciliten la adopción de mejores diseños y su interpretación, así como el trabajo de manipulación de los datos.

2.Prever problemas de concurrencia desde la capa más baja de los programas de aplicación mediante técnicas desarrolladas en base a la experiencia propia y de mejores prácticas de la industria.

### Campos de control

| Campo | Tipo | Descripción |
|----------------|-----------------|---------------------|
| sys_pk | Entero | Clave primaria para la tabla (alcance local)|
| sys_guid | Texto(32) | GUID que puede usarse como clave primaria de alcance global |
| sys_dtcreated | Fecha/Hora | Fecha y hora de creación del registro |
| sys_timestamp | Fecha/Hora | Fecha y hora de la última actualización del registro (marca de tiempo con precisión hasta segundos) |
| sys_exported | Cierto/falso | Indica si el registro ha sido exportado por las utilidades de transporte de datos |
| sys_dtexported | Fecha/Hora | Indica la fecha en que se exportó por última vez |
|sys_recver | Entero |Número de versión de instancia de registro|
|sys_lock | Entero | Clave foránea que indica si se ha establecido un bloqueo pesimista sobre la fila. |
|||Este campo admite valores Nulos que significan que el registro no está bloqueado. | 
||| No se admiten duplicados |
|sys_deleted | bool | Indica si la fila está marcada como eliminada
