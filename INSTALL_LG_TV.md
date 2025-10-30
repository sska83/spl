# Установка приложения на LG Smart TV

## Требования
- LG Smart TV с webOS (2014 и новее)
- Компьютер в той же Wi-Fi сети, что и ТВ
- Node.js установлен на компьютере

## Шаг 1: Установка webOS CLI

```bash
npm install -g @webosose/ares-cli
```

## Шаг 2: Включение Developer Mode на ТВ

1. Откройте **LG Content Store** на ТВ
2. Найдите и установите **Developer Mode App**
3. Запустите Developer Mode App
4. Включите **Dev Mode Status**
5. Включите **Key Server** (появится IP-адрес)
6. Запомните IP-адрес ТВ

## Шаг 3: Подключение к ТВ с компьютера

```bash
ares-setup-device
```

Следуйте инструкциям:
- Добавьте новое устройство
- Введите имя (например: `myTV`)
- Введите IP-адрес ТВ
- Порт: `9922`
- Нажмите Enter для остальных настроек

## Шаг 4: Создание иконок

Создайте две иконки PNG:

1. **icon.png** - 80x80 пикселей
2. **largeIcon.png** - 130x130 пикселей

Поместите их в корневую папку проекта.

## Шаг 5: Упаковка приложения

```bash
bash package-webos.sh
```

Или вручную:

```bash
# Создайте папку для сборки
mkdir -p webos-build

# Скопируйте файлы
cp index.html webos-build/
cp appinfo.json webos-build/
cp icon.png webos-build/
cp largeIcon.png webos-build/

# Упакуйте приложение
ares-package webos-build/ -o ./
```

## Шаг 6: Установка на ТВ

```bash
ares-install com.monopoly.app_1.0.0_all.ipk -d myTV
```

Замените `myTV` на имя, которое вы дали устройству в Шаге 3.

## Шаг 7: Запуск приложения

1. Закройте Developer Mode App на ТВ
2. Приложение "Монополия" появится в списке приложений
3. Запустите его!

## Управление с пульта ДУ

Используйте:
- **Стрелки** - навигация
- **OK** - выбор/клик
- **Back** - назад

## Отладка

Для просмотра логов:

```bash
ares-launch -d myTV com.monopoly.app --inspect
```

## Удаление приложения

```bash
ares-install --remove com.monopoly.app -d myTV
```

## Известные проблемы

1. **Приложение не отображается** - Перезагрузите ТВ
2. **Не подключается по IP** - Проверьте, что Developer Mode включен
3. **Ошибка упаковки** - Убедитесь, что все файлы (особенно иконки) на месте

## Альтернативный метод (без CLI)

Если webOS CLI не работает:

1. Используйте **webOS TV IDE** от LG
2. Скачайте с официального сайта LG Developer
3. Импортируйте проект и установите через IDE

## Поддержка

- Официальная документация: https://webostv.developer.lge.com/
- Форум разработчиков: https://forum.developer.lge.com/
