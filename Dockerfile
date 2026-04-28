FROM eclipse-temurin:21-jre-alpine
LABEL authors="dazai"
WORKDIR /app
COPY target/spring-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
EXPOSE 8081