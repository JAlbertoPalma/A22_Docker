#Us una imagen base de python oficial. Esto ya "compila" Python
FROM python:3.10-slim

#Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

#Copia el archivo requerimientos.txt e instala las dependencias
#Se hace en dos pasos para aprovechar el caché de Docker (mejora de rendimiento)
COPY requerimientos.txt .
RUN pip install --no-cache-dir -r requerimientos.txt

#Copia el código fuente de la aplicacion
COPY . .

#Expone el puerto en el que la aplicaciónFlask se ejecuta
EXPOSE 5000

#Define el comando para ejecutar la aplicación cuando el contenedor inicie
CMD ["python", "app.py"]