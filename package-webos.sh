#!/bin/bash

# Скрипт для упаковки приложения webOS
#
# Инструкция:
# 1. Установите webOS TV CLI: npm install -g @webosose/ares-cli
# 2. Запустите этот скрипт: bash package-webos.sh
# 3. Установите .ipk файл на ТВ через Developer Mode App

echo "Упаковка приложения для webOS..."

# Создаём временную директорию для упаковки
mkdir -p webos-build

# Копируем необходимые файлы
cp index.html webos-build/
cp appinfo.json webos-build/

# Создаём простую иконку (текстовый файл, потом замените на настоящую PNG)
echo "Создайте icon.png (80x80) и largeIcon.png (130x130) в папке webos-build/"

# Упаковываем приложение
ares-package webos-build/ -o ./

echo "Готово! Файл .ipk создан в текущей директории"
echo ""
echo "Для установки на ТВ:"
echo "1. Включите Developer Mode на ТВ (LG Content Store > Developer Mode App)"
echo "2. Подключите ТВ: ares-setup-device"
echo "3. Установите: ares-install com.monopoly.app_1.0.0_all.ipk -d YOUR_TV_NAME"
