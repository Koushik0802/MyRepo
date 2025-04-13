FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/calculator-app-1.0.jar final.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "final.jar"]
