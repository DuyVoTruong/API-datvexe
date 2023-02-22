FROM maven:3.8.5-openjdk-11 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests



FROM openjdk:11-slim
COPY --from=build /target/dat-ve-xe-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]