#!/bin/bash

truncate -s 0 /var/log/nginx/error_manual.log
truncate -s 0 /var/log/nginx/access_manual.log

exec nginx -g 'daemon off;'