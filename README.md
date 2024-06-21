# Simple Webhook

Quick and easy to setup solution for testing webhooks, using Golang and [ngrok](https://ngrok.com/).

## Docker Usage

This project can be used via Docker, without the need of any Go tools installed to make the build for your host OS.

To run the webhook application, execute the following command. The ngrok token can be retrieved from your [Ngrok Dashboard](https://dashboard.ngrok.com). This application will not keep any copies nor forward the provided token. It's usage is entirely local.
```sh
NGROK_TOKEN='YOUR NGROK TOKEN HERE' make run
```
The webhook URL will be the domain exhibited after webhook initialization + "/webhook", *e.g.* `http://xxxx-xxx-xxx-xx-xx-xxx.ngrok.xyz/webhook`. All received requests will be logged to `history.log`. This file's contents are displayed by the docker container logs for convenience.

To clean the log file and docker image generated by this workflow, run the following command:
```sh
make clean
```

## Command Line Usage

If you want more flexibility and/or access to the application flags, run the following command to install it to your PATH (note that this method requires the Go toolkit to be installed and available on your CLI):
```sh
make local-install
```

To remove the installed app from your PATH, run the following command:
```sh
make local-clean
```
### Application Flags

Available flags are listed below:

| Flag | Description                                       | Default     |
| ---- | ------------------------------------------------- | ----------- |
| -h   | Shows app help information                        | -           |
| -p   | Define app HTTP port                              | 8080        |
| -l   | Define full log path                              | history.log |
| -e   | Define webhook endpoint route                     | /webhook    |
| -t   | Define whether to run locally or via ngrok tunnel | -           |
| -a   | Provide Ngrok authtoken                           | [REQUIRED]  |

Exemples:

Setting custom port and output log file path:
```shell
simple-webhook -p 5000 -l history.log
```
Setting custom endpoint route and opting for ngrok execution
```shell
simple-webhook -e /webhook -t
```
