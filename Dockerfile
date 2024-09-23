# Используем образ с JDK 17 для сборки приложения
FROM gradle:7.5.1-jdk17 AS build

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем только файлы конфигурации Gradle
COPY build.gradle settings.gradle ./

# Копируем исходный код
COPY src ./src

# Собираем приложение
RUN gradle build --no-daemon

# Используем минимальный образ JRE для выполнения приложения
FROM openjdk:17-jdk-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем скомпилированный JAR файл из предыдущего этапа сборки
COPY --from=build /app/build/libs/*.jar app.jar

# Открываем порт, на котором будет слушать приложение
EXPOSE 8080

# Запускаем приложение
ENTRYPOINT ["java", "-Duser.timezone=Asia/Tashkent", "-jar", "/app/app.jar"]