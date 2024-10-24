#FROM maven:eclipse-temurin:19-jdk-alpine
#VOLUME /tmp
#COPY jarfiles/*.jar app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]

FROM maven:3.8.5-openjdk-17 as build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar employees-backend.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "employees-backend.jar"]
