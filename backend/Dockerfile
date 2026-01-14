FROM golang:1.25 AS app_builder

WORKDIR /app_build

COPY ./http_go/ .

RUN CGO_ENABLED=0 go build -o main .

# --- #

FROM alpine:latest AS backend

WORKDIR /backend

COPY --from=app_builder /app_build/main .


RUN addgroup -g 1001 -S rootless_group && \
  adduser -S rootless_user -u 1001 -G rootless_group && \
  chown -R rootless_user:rootless_group /backend

USER rootless_user

EXPOSE 8080

ENTRYPOINT ["./main"]
