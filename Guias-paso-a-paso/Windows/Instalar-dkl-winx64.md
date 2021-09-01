## Instalar Devkron en Windows x64

1. Descarga los binarios de Devkron para Windows x64 desde: https://devkron.org/descargas/devkron-win-x64.zip
2. Crea una carpeta en el disco duro de tu equipo y descomprime el contenido del archivo devrkon-win-x64.zip en ella

### Ejecutar programas de consola

1. Abre una consola (CMD o PowerShell) y ve a la carpeta donde se encuentran los binarios de Devkron
2. Usa el comando dkl.exe
```CMD
dkl miprograma.dkl
```

### Iniciar el servicio FastCGI
1. Abre una consola (CMD o PowerShell) y ve a la carpeta donde se encuentran los binarios de Devkron
2. Usa el comando dkl.exe con el argumento -fastcgi
```CMD
dkl -fastcgi
```

### Guías IMPORTANTES para usar Devkron con FastCGI

* [Guía de configuración Nginx + Devkron en Linux y Windows](../nginx-fastcgi.md)

* [Guía de configuración de sitios Web con FastCGI de Devkron](../devkron-fastcgi.md)
