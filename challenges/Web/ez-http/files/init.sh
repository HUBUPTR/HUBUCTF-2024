#!/bin/sh

# export FLAG=$GZCTF_FLAG
export FLAG=flag{test}

php-fpm -D
nginx -g 'daemon off;'
