FROM golang:1.22 as build

WORKDIR /code
COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /simplewebhook


FROM debian:stable-slim as final

COPY docker-entrypoint.sh /
RUN chmod 700 docker-entrypoint.sh
COPY --from=build /simplewebhook /

ENTRYPOINT [ "/docker-entrypoint.sh" ]