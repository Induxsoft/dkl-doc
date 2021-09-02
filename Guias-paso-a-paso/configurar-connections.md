## Configurar conexiones a bases de datos
En las distribuciones de Devkron autocontenidas (para Linux o Windows) no hay soporte de interfaz de usuario basado en ventanas, por lo que el Administrador de conexiones no está disponible.

Para configurar conexiones deberá hacerlo a través de sus propios programas en Devkron o editando el archivo: 'connections.xml' que debe existir en el directorio de binarios de Devkron.

De manera predeterminada se incluye el archivo 'connections.xml.example' que puede copiar con el nombre 'connections.xml' a manera de plantilla.

```XML
<?xml version="1.0" encoding="utf-8"?>
<!--
Use este archivo como ejemplo para crear un repositorio de conexiones locales.

Cambie el nombre de este archivo a: connections.xml y déjelo en el directorio de programas de Devkron.
-->
<Repository xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Applications>
    <AppItem>
      <Name>MyApp</Name>
      <SQLDictionaries />
      <Connections>
        <CnnItem>
          <Name>connection1</Name>
          <EngineType>MY_SQL</EngineType>
          <XmlSettings>
		  <!--
		  La información de conexión puede estar encriptada y codificada en base 64 
		  o como XML dentro de un bloque CDATA.
		  
		  Si no está cifrada (como en este caso) establezca los valores 
		  correspondientes a los elementos:
		  Host, UserName, Password, DefaultSchema, Port.
		  
		  Podrá conectarse a esta base de datos con la siguiente sintaxis:
		  
		  ref db=dbr.open("connection1@MyApp")
		  
		  -->
		  <![CDATA[
			<Engine>
			  <Name>MY_SQL</Name>
			  <Host>ip_or_hostname</Host>
			  <UserName>username</UserName>
			  <Password>password</Password>
			  <DefaultSchema>database_name</DefaultSchema>
			  <Port>3306</Port>
			</Engine>
		  ]]>
		  </XmlSettings>
          <SQLDic>connections.sqldic</SQLDic>
          <Default>false</Default>
        </CnnItem>
      </Connections>
    </AppItem>
  </Applications>
</Repository>
```
