FROM golang:1.23.4 AS builder
WORKDIR /app

COPY ./app ./
RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -a -o main .

FROM alpine:latest
WORKDIR /app

COPY --from=builder /app/main .
COPY ./app/.env .

ENV BLUE_PORT=8080
ENV GREEN_PORT=8081

CMD ["sh", "-c", "./main --port=${BLUE_PORT}"]

EXPOSE 8080
