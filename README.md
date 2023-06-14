# Simple Webhook
Quick and easy to setup solution for testing webhooks, using Golang and [ngrok](https://ngrok.com/docs/using-ngrok-with/go/).

To use it, run the following command:
```sh
make run
```
The webhook URL will be the domain exhibited after webhook initialization + "/webhook", *e.g.* `https://xxxx-xxx-xxx-xxx-xx.yy.ngrok.io/webhook`. All received requests will be logged to `history.log`.