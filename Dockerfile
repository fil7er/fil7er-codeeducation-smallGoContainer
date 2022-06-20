FROM golang:alpine AS builder


WORKDIR /app
COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" hello-world.go

FROM scratch

WORKDIR /go/bin/hello

COPY --from=builder /app /go/bin/hello

CMD ["./hello-world"]

