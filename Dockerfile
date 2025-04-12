FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/calculator-app.jar final.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "final.jar"]
