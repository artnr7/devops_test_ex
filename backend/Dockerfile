FROM golang:1.25 AS app_builder

WORKDIR /app_build

COPY ./http_go/ .

# RUN go mod download

# RUN go build -v -o main .

RUN CGO_ENABLED=0 go build -o main .

# --- #

 FROM alpine:latest AS backend

 WORKDIR /backend

 COPY --from=app_builder /app_build/main .

 EXPOSE 8080

 ENTRYPOINT ["./main"]
