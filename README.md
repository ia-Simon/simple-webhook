# Simple Webhook
Quick solution for testing webhooks, using Golang and [localtunnel](https://github.com/localtunnel/localtunnel).

To use it, run the following command:
```sh
make run
```
The webhook URL will be the returned base domain + "/webhook", *e.g.* `https://test-webhook.loca.lt/webhook`. All received requests will 
be logged to `history.log`.