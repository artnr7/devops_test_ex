## Как запустить проект?

```
docker compose up --build // foreground
docker compose up -d --build // background
```

Или make

```
make upb
```

## Как проверить результат?

```
curl http://localhost
```

Ожидаемый ответ: "Hello from Effective Mobile!"

## Как работает схема?
С помощью команды, которая приведена выше, запускается **docker compose** на основе **docker-compose.yml**. Благодаря нему запускаются последовательно два контейнера:
    1) backend – go http-сервер на порту 8080 внутри docker-сети (порт не виден снаружи), который на handler "/" отдаёт ответ "Hello from Effective Mobile!"
    2) nginx – web-сервер, работающий во внешнюю сеть на порту 80, проксирует все запросы на endpoint / сервиса backend:8080, от которого у nginx есть зависимость на health-статус 

    localhost:80 -> nginx(:80) -> go_http_server(:8080)

### Список технологий
 * docker
 * nginx
 * golang

## Как остановить работу контейнеров?

```
docker compose down
```

Или make

```
make down
```

