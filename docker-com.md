version: '3.8'
services:
  backend:
    build: .                    # Ваш Go Dockerfile
    # ❌ НЕТ ports: - "8080:8080"
    # expose: - "8080"          # Только документация (не публикует)

  nginx:
    image: nginx:latest
    ports:
      - "80:80"                 # ✅ ЕДИНСТВЕННЫЙ порт наружу!
    volumes:
      - ./nginx.conf:/etc/nginx/conf.d/default.conf
    depends_on:
      - backend
