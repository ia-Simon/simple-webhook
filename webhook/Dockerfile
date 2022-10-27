FROM golang:1.19 as build

WORKDIR /code
COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /simplewebhook


FROM alpine:3.16 as final

RUN apk add nodejs npm; \
    npm i -g localtunnel
COPY entrypoint.sh /
RUN chmod 700 entrypoint.sh
COPY --from=build /simplewebhook /

ENTRYPOINT [ "/entrypoint.sh" ]