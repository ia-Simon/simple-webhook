#!/bin/sh

echo '>> Initializing webhook...'
./simplewebhook -t &
sleep 2
echo ''

echo '# Webhook data received:'
tail -fn $LOG_TAILING_INITIAL_LINES history.log