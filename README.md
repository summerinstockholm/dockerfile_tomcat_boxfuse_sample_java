Итак допустим мы хотим запустить вот это приложение https://github.com/boxfuse/boxfuse-sample-java-war-hello в контейнере.
Для этого понадобятся: 
- Git
- Docker

Запускать его будем через Dockerfile. Возьмем базовый образ убунты, в него установим и запустим Tomcat, затем в самом докерфайле опишем сборку и деплой приложения. Итого план такой, карлики:

1. Через Git скачать репозиторий с кодом приложения
2. Описать докерфайл в котором будут следующие этапы:
    a) Базовый образ убунты
    б) Обновим пакеты и установим open-jdk и maven
    в) Хитрым образом установим и запустим томкат (подсмотрим в официальном докерфайле томката)
    г) Соберем приложение через мавен
    д) Скормим томкату наше приложение в спец папку


Порядок действий:
1. Выполняем следующие команды для обновления пакетов и установки гита:
