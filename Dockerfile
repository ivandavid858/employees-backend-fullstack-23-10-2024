FROM eclipse-temurin:19-jdk-alpine
VOLUME /tmp
COPY jarfiles/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]