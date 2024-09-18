FROM openjdk:17-alpine
WORKDIR /app
COPY ./build/libs/docker-backbone-v1.0.0.jar .
ENTRYPOINT ["java", "-jar", "docker-backbone-v1.0.0.jar"]