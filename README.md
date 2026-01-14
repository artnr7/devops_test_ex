## Как запустить проект?

docker compose up // foreground
dockde compose -d up // background

## Как проверить результат?

```
curl http://localhost
```

## Как работает схема?
С помощью команды, которая приведена выше, запускается **docker compose** на основе **docker-compose.yml**. Благодаря нему запускаются последовательно два контейнера:
    1) backend – с http-сервером на порту 8080 внутри docker-сети (порт не виден снаружи), который на handler "/" отдаёт ответ "Hello from Effective Mobile!"
    2) nginx – web-сервер, работающий вовне на порту 80, проксирует все запросы на endpoint / на группу backend_group, в которой указан контейнер backend:8080, зависит от контейнера backend
