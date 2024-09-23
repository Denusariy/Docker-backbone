# Первый этап: сборка приложения
FROM gradle:7.5-jdk17 AS builder

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы Gradle и проект
COPY ./gradlew ./gradlew
COPY ./gradle ./gradle
COPY ./build.gradle ./build.gradle
COPY ./settings.gradle ./settings.gradle
COPY ./src ./src

# Устанавливаем права на выполнение для gradlew
RUN chmod +x ./gradlew

# Сборка приложения с помощью Gradle
RUN ./gradlew clean build -x test

# Второй этап: запуск приложения
FROM openjdk:17-jdk-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем собранное приложение из образа сборки
COPY --from=builder /app/build/libs/*.jar app.jar

# Открываем порт
EXPOSE 8080

# Указываем команду для запуска приложения
ENTRYPOINT ["java", "-jar", "app.jar"]