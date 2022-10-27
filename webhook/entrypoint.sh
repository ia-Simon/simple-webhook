#!/bin/sh

echo '> Initializing webhook...'
./simplewebhook &
sleep 2

echo '> Setting up localtunnel...'
lt -p 8080 -s $WEBHOOK_SUBDOMAIN &
sleep 2

echo ''
echo '> Webhook data received:'
tail -fn $LOG_TAILING_INITIAL_LINES history.log