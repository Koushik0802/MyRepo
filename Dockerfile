FROM openjdk:17-jdk-slim

WORKDIR /app

COPY /var/lib/jenkins/workspace/Jenkins/target/calculator-app.jar final.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "final.jar"]

