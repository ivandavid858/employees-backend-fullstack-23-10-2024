FROM ubuntu:latest AS build

# Instalar JDK y Maven
RUN apt-get update && \
    apt-get install openjdk-17-jdk maven -y

# Copiar todos los archivos del proyecto
COPY . .

# Ejecutar Maven para crear el paquete (JAR)
RUN mvn clean package -DskipTests

# Fase final del contenedor
FROM openjdk:17-jdk-slim

# Exponer el puerto 8080
EXPOSE 8080

# Copiar el archivo JAR generado desde la fase de build
COPY --from=build /target/demo-1.0.0.jar app.jar

# Configurar el comando de entrada para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]