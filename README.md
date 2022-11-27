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
1. Выполняем следующие команды для обновления пакетов, установки гита и docker:
apt update

apt install git

apt install docker.io

2. Клонируем репозиторий с java приложением

git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

3. Переходим в директорию с приложением и создаем Dockerfile

cd boxfuse-sample-java-war-hello

nano Dockerfile

4. Содержимое докерфайла взять, скопировать и сохранить отсюда:

https://github.com/summerinstockholm/dockerfile_tomcat_boxfuse_sample_java/blob/main/Dockerfile

5. Выполнить билд образа:

docker build -t tomcat_boxfuse_sample_java .

6. Запустить контейнер

docker run -d -p 8080:8080 tomcat_boxfuse_sample_java

7. Проставить образу тег, залогинится в докер-хаб и запушить получившийся образ:

docker image tag tomcat_boxfuse_sample_java:latest mnest/tomcat_boxfuse_sample_java

docker login

docker push mnest/tomcat_boxfuse_sample_java

