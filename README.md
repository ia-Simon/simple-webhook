# Simple Webhook

Quick and easy to setup solution for testing webhooks, using Golang and [ngrok](https://ngrok.com/).

## Docker Usage

To use this project without installing any language dependencies, run the following command:
```sh
make run
```
The webhook URL will be the domain exhibited after webhook initialization + "/webhook", *e.g.* `http://xxxx-xxx-xxx-xxx-xx.yy.ngrok.io/webhook`. All received requests will be logged to `history.log`.

To clean log files and docker image generated by this type of usage, run the following command:
```sh
make clean
```

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
