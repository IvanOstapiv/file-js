FROM node:18

# Встановлюємо директорію контейнера, в якій буде розміщений наш додаток
WORKDIR /home/ostapiv333/app

# # Копіюємо весь вихідний код додатку у контейнер
COPY . .

# Команда для запуску додатку
CMD node app.js