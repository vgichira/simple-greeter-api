FROM golang:1.18-alpine AS builder

WORKDIR /app

COPY go.* .

RUN go mod download

COPY . .

RUN go build -o simple_api main.go

FROM alpine:3.17

WORKDIR /app

# RUN apk update && \
#     apk upgrade && \
#     apk add bash && \
#     rm -rf /var/cache/apk/*

COPY --from=builder /app/simple_api /usr/bin/

EXPOSE 3000

CMD [ "simple_api" ]