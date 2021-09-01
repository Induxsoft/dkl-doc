## Instalar Devkron en Linux

1. Crea un directorio (de preferencia /usr/devkron) y accede al mismo
```bash
mkdir /usr/devkron
cd /usr/devkron
```
2. Descarga los binarios de Devrkon para Linux desde: http://devkron.org/descargas/devkron-linux-x64.zip 
```bash
wget http://devkron.org/descargas/devkron-linux-x64.zip 
```
3. Descomprime todo el contenido del archivo devkron-linux-x64.zip
```bash
unzip devkron-linux-x64.zip
```
4. Otorga permisos al ejecutable
```bash
chmod 777 ./dkl
```

Nota: Deberás tener permisos suficientes para realizar estas acciones.

### Ejecutar programas de consola

1. Abre una consola y ve al directorio donde se encuentran los binarios de Devkron
```bash
cd /usr/devkron
```
2. Usa el comando dkl
```bash
./dkl miprograma.dkl
```

### Iniciar el servicio FastCGI
1. Abre una consola y ve al directorio donde se encuentran los binarios de Devkron
```bash
cd /usr/devkron
```
2. Usa el comando dkl con el argumento -fastcgi
```bash
./dkl -fastcgi
```
