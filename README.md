# Simple Webhook

Quick solution for testing webhooks, using Golang and [ngrok](https://ngrok.com/).

## Command Line Usage

To help options use:

```shell
simple-webhook --help
```

or

```shell
go run . --help
```

Command flags avaible are:

| Flag              | Description                          | Default       |
|-------------------|--------------------------------------|---------------|
| --help or -h      | List command flags help descriptions | -             |
| --port or -p      | Define listen port                   | 8080          |
| --logPath or -l   | Define full log path                 |  history.log  |
| --endpoint or -e  | Define endpoint webhook              |  /webhook     |

Exemple:

```shell
simple-webhook --port 8080 --logPath history.log --endpoint /webhook
```

or

```shell
simple-webhook --p 8080 --l history.log --e /webhook
```

## Make commands

| Command               | Description                               |
|-----------------------|-------------------------------------------|
| make help             | List command help descriptions            |
| make run              | Run with default args in docker container |
| make build            | Build appThe ```make install``` lication docker image            |
| make clean            | Clean docker build                        |
| make build-local      | Build application local                   |
| make run-local        | Run local with default args               |
| make clean-local      | Clean local build with default args       |
| make install-local    | Build and install local application       |
| make uninstall-local  | Uninstall local application               |
