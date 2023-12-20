FROM golang:1.19-alpine AS builder

RUN apk update && apk add --no-cache build-base

WORKDIR /app
COPY . /app

RUN make build

# Stage 2: Runtime environment
FROM alpine:3.14

RUN apk --no-cache add tzdata && apk --no-cache add curl

WORKDIR /app

# Copy the binary from the build environment
COPY --from=builder /app/dating-apps-api /app/dating-apps-api
COPY --from=builder /app/.env /app/.env

EXPOSE 8080

CMD ["./dating-apps-api"]