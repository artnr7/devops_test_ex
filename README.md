## Как запустить проект?

```
docker compose up // foreground
docker compose -d up // background
```

## Как проверить результат?

```
curl http://localhost
```

## Как работает схема?
С помощью команды, которая приведена выше, запускается **docker compose** на основе **docker-compose.yml**. Благодаря нему запускаются последовательно два контейнера:
    1) backend – go http-сервер на порту 8080 внутри docker-сети (порт не виден снаружи), который на handler "/" отдаёт ответ "Hello from Effective Mobile!"
    2) nginx – web-сервер, работающий во внешнюю сеть на порту 80, проксирует все запросы на endpoint / сервиса backend:8080, от которого у nginx есть зависимость 

    localhost:80 -> nginx(:80) -> go_http_server(:8080)

### Список технологий
 * docker
 * nginx
 * golang

## Как остановить работу контейнеров?

```
docker compose down
```
