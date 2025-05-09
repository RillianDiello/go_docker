FROM golang:1.20 as builder
WORKDIR /app
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app main.go
FROM scratch
COPY --from=builder /app/app /app
ENTRYPOINT [ "/app" ]