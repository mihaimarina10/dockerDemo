# Etapa de build
FROM gradle:8.7-jdk21 AS build
WORKDIR /app
COPY . .
RUN gradle build -x test

# Etapa de rulare
FROM eclipse-temurin:21
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
