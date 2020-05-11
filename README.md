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
