## Fecha y hora

DKL ofrece un mecanismo sencillo para manejar valores de fecha y hora que consiste en tratar los valores como números decimales, en los que la parte entera representa a la fecha y la parte decimal a la hora. No hay representación de zona horaria.

Por ejemplo: 

La fecha 23 de Noviembre del año 2023 se representa como el número **20231123**

La fecha y hora 5 de Septiembre de 2007 a las 20:35:23 sería **20070905.203523**

| **ndatetime.fromstr**  Devuelve el número que corresponde a la fecha indicada como cadena con el formato señalado.  **ndatetime.fromstr(fecha, formato)**|**fecha** – Una cadena que representa una fecha **formato** – Un formato de fecha con la sintaxis usada por C#|
|-----------|-----------|
| **ndatetime.tostr**  Devuelve una cadena que representa la fecha representada por un número con el formato indicado  **ndatetime.tostr(fecha, formato)**| **fecha** – Un número que representa una fecha  **formato** – El formato con el que se representará la cadena de fecha (sintaxis de C#)|
| **datetime.diff**  Devuelve la diferencia (días, semanas, meses o años) entre dos fechas expresadas como números.  **ndatetime.diff(fecha1, fecha2, intervalo)**| **fecha1**- Número que representa una fecha  **fecha2**- Número que representa una fecha  **intervalo** – Cadena con alguno de los siguientes caracteres: d w m y (días, semanas, meses, años)|
| **ndatetime.add**  Devuelve un número que representa una fecha a la que se ha adicionado el intervalo indicado.  **ndatetime.add(fecha, num, intervalo)**| **fecha** – Un número que representa una fecha  **num** – Número que indica la cantidad a sumar en el intervalo indicado  **intervalo** – Cadena con alguno de los siguientes caracteres: d w m y (días, semanas, meses, años) |
| **ndatetime.now**  Devuelve un número que representa la fecha y hora actual del sistema  **ndatetime.now()**| Sin argumentos|
| **ndatetime.year**  Devuelve el año de una fecha representada como número  **ndatetime.year(fecha)**| **fecha** – Un número que representa una fecha|
| **ndatetime.month**  Devuelve el mes de una fecha representada como número  **ndatetime.month(fecha)**| **fecha** – Un número que representa una fecha|
| **ndatetime.day**  Devuelve el día de una fecha representada como número  **ndatetime.day(fecha)**| **fecha** – Un número que representa una fecha|
