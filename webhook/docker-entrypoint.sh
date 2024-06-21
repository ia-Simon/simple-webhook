#!/bin/sh

echo '>> Initializing webhook...'
if [ -z $NGROK_TOKEN ]; then
  NGROK_TOKEN="TOKEN"
fi

./simplewebhook -t -a $NGROK_TOKEN &
sleep 2
echo ''

echo '# Webhook data received:'
tail -fn $LOG_TAILING_INITIAL_LINES history.log