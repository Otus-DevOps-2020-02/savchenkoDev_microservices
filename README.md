# savchenkoDev_microservices
savchenkoDev microservices repository

### HW 12: Docker контейнеры. Docker под капотом***

***Основное ДЗ***
- Установил docker + docker-machine + docker-compose
- запустил VM с установленным Docker Engine при помощи Docker Machine
- написал Dockerfile
- собрал образ с тестовым приложением
- сохранил образ на DockerHub.

***Задание со звездочкой***
- написал плэйбук `ansible` для установки `docker`
- сделал создание образа с установленным докером с помощью `packer`
- добавил создание инстансов `terraform`


### HW 13: Docker отбразы. Микросервисы

***Основное ДЗ***
- скачал исходники приложения
- установил линтер для докерфайлов hadolint
- создал докерфайлы для микросервисов
- собрал образы из созданных докерфайлов
- создал bridge network для контейнеров, запустил их и проверил работоспособность сервиса
- создал образ ui v2.0 исользуя другой базовый образ, чтобы уменьшить размер образа
- подключили volume для сохранения данных после перезапуска контейнеров.

***Задание со звездочкой 1***

Чтобы обеспечить работу сервиса с новыми сетевыми алиасами не пересоздавая образы, надо передать переменные окружения в команде запуска контейнера (`-e`, `--env`, `--env-file`)
```
docker run -d --network=reddit --network-alias=post_db_1 --network-alias=comment_db1 mongo:latest
docker run -d --network=reddit \
            --env POST_DATABASE_HOST=post_db_1 \
            --network-alias=post_1 <login>/post:1.0
docker run -d --network=reddit \
            --env COMMENT_DATABASE_HOST=comment_db_1 \
            --network-alias=comment_1 <login>/comment:1.0
docker run -d --network=reddit \
            --env POST_SERVICE_HOST=post_1 \
            --env COMMENT_SERVICE_HOST=comment_1 \
            -p 9292:9292 <login>/ui:2.0
```

### HW 14: docker-compose.

***Основное ДЗ***
- чтобы реализовать кейс с множеством сетей в `docker-compose.yml` в секции `networks` надо объявить эти сети
```
networks:
  front_net:
  back_net:
```
и в секциях сервисов назначить к каким сетям принадлежит это сервис
- про параметризацию сказать особо нечего, в `docker-compose.yml` меняем значения на `${VAR_NAME}`, например чтобы параметризировать порт надо в `docker-compose.yml` изменить секцию описывающую порты для сервиса ui
```
9292:9292/tcp -> ${UI_SERVICE_PORT}:9292/tcp
```
- базовое имя проекта можно задать
 1. при запуске dcoker-compose в опции `-p`: `docker-compose -p "reddit" up`
 2. в переменной окружения `COMPOSE_PROJECT_NAME`
 ```
 > $ export COMPOSE_PROJECT_NAME=reddit
 > $ docker-compose up
 ```
 3. в файле переменных окружения `.env`
 ```
 COMPOSE_PROJECT_NAME=reddit
 ```

***Задание со звездочкой***
- для запуска сервисов `ruby` в режиме 'debug' и с двумя воркерами надо передать опции команде `puma`: `puma --debug -w 2`
- сервис `python` можно запустить командой с помощью нового скрипта `post_app_v2.py`
