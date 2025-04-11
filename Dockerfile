FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/*.jar final.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "final.jar"]

