FROM golang:1.17-alpine AS builder
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . ./
RUN GO111MODULE=on CGO_ENABLED=0 GOOS=linux go build -o /hello-world

FROM alpine:latest AS runner
RUN apk --no-cache add ca-certificates
COPY --from=0 /hello-world /hello-world
EXPOSE 8080

CMD [ "/hello-world" ]
