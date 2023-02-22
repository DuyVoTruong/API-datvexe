FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests



FROM openjdk:17-slim
COPY --from=build target/dat-ve-xe-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080
ENTRYPOINT exec java -jar app.jar